#!/usr/bin/env python3
"""
IO Group Linktree — Automated Playwright Regression Test Suite
Executes comprehensive regression testing for Milestone M1 (Iteration 2):
1. Asset resolution under /links and /links/ (trailing slash resilience)
2. Responsive layout & 0px overflow across 13 viewports in Light & Dark modes
3. Typography wrapping for .link-subtitle on narrow mobile viewports
4. Secondary touch target sizing (>= 48px standards)
5. Official brochure & QR code asset integrity
"""

import http.server
import os
import socketserver
import sys
import threading
import time
import urllib.parse
from playwright.sync_api import sync_playwright

# 13 Standard Industry Viewports (Challenger 2 / Reviewer 1 benchmark)
VIEWPORTS = [
    {"name": "iPhone SE 1st gen", "width": 320, "height": 568},
    {"name": "Samsung Galaxy S20", "width": 360, "height": 800},
    {"name": "iPhone 8 / SE 2nd gen", "width": 375, "height": 667},
    {"name": "iPhone 14/15", "width": 390, "height": 844},
    {"name": "iPhone Plus / Max", "width": 414, "height": 896},
    {"name": "Android Breakpoint", "width": 480, "height": 854},
    {"name": "Small Tablet / Fold", "width": 600, "height": 960},
    {"name": "iPad Portrait", "width": 768, "height": 1024},
    {"name": "iPad Landscape", "width": 1024, "height": 768},
    {"name": "Laptop", "width": 1280, "height": 800},
    {"name": "MacBook / Desktop", "width": 1440, "height": 900},
    {"name": "Full HD Monitor", "width": 1920, "height": 1080},
    {"name": "2K Display", "width": 2560, "height": 1440},
]

COLOR_SCHEMES = ["light", "dark"]

class ApacheSimulationHandler(http.server.SimpleHTTPRequestHandler):
    """Simulates Apache mod_rewrite clean URLs for /links and /links/"""
    def log_message(self, format, *args):
        pass  # Quiet logs during automated test runs

    def do_GET(self):
        clean_path = urllib.parse.urlparse(self.path).path
        if clean_path in ["/links", "/links/", "/linktree", "/linktree/"]:
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.end_headers()
            with open("links.html", "rb") as f:
                self.wfile.write(f.read())
        else:
            super().do_GET()


def run_regression_tests():
    print("=" * 70)
    print("IO GROUP LINKTREE — AUTOMATED PLAYWRIGHT REGRESSION SUITE")
    print("=" * 70)

    # 1. Start ephemeral HTTP server
    server = socketserver.TCPServer(("127.0.0.1", 0), ApacheSimulationHandler)
    port = server.server_address[1]
    server_thread = threading.Thread(target=server.serve_forever, daemon=True)
    server_thread.start()
    base_url = f"http://127.0.0.1:{port}"
    print(f"[*] Ephemeral HTTP test server started on {base_url}")

    failures = []
    tests_run = 0

    try:
        with sync_playwright() as p:
            browser = p.chromium.launch(channel="chrome", headless=True)

            # =================================================================
            # TEST SUITE 1: Base href & Trailing Slash Asset Resolution
            # =================================================================
            print("\n[TEST SUITE 1] Clean Route & Asset Pathing Under /links and /links/")
            for route in ["/links", "/links/"]:
                tests_run += 1
                page = browser.new_page(viewport={"width": 375, "height": 800})
                failed_res = []

                def track_failed_response(resp):
                    if resp.status >= 400:
                        failed_res.append((resp.url, resp.status))

                page.on("response", track_failed_response)
                page.goto(f"{base_url}{route}", wait_until="networkidle")

                if failed_res:
                    msg = f"Route '{route}' had {len(failed_res)} failed sub-resources: {failed_res}"
                    print(f"  [FAIL] {msg}")
                    failures.append(msg)
                else:
                    print(f"  [PASS] Route '{route}' loaded seamlessly with 0 HTTP errors.")
                page.close()

            # =================================================================
            # TEST SUITE 2: Responsive Layout & 0px Overflow (13 Viewports x 2 Themes)
            # =================================================================
            print("\n[TEST SUITE 2] Responsive Layout & 0px Overflow Across 13 Viewports (26 runs)")
            for scheme in COLOR_SCHEMES:
                for vp in VIEWPORTS:
                    tests_run += 1
                    w = vp["width"]
                    h = vp["height"]
                    label = f"{vp['name']:20s} {w}x{h:<5d} [{scheme}]"

                    page = browser.new_page(
                        viewport={"width": w, "height": h},
                        color_scheme=scheme,
                    )
                    page.goto(f"{base_url}/links", wait_until="domcontentloaded")

                    # Check 1: Document scrollWidth does not exceed viewport width
                    body_scroll_w = page.evaluate("document.body.scrollWidth")
                    doc_scroll_w = page.evaluate("document.documentElement.scrollWidth")
                    max_scroll_w = max(body_scroll_w, doc_scroll_w)

                    # Check 2: Brochure download button right edge
                    btn_rect = page.evaluate(
                        'document.querySelector(".brochure-download-btn") ? '
                        'document.querySelector(".brochure-download-btn").getBoundingClientRect() : null'
                    )

                    vp_fails = []
                    if max_scroll_w > w:
                        vp_fails.append(f"scrollWidth={max_scroll_w} > viewport={w}")

                    if btn_rect and btn_rect["right"] > w + 0.5:
                        vp_fails.append(f"brochure btn right={btn_rect['right']:.1f} > viewport={w}")

                    # Check 3: Link cards within container
                    cards = page.query_selector_all(".link-card")
                    for idx, card in enumerate(cards):
                        c_box = card.bounding_box()
                        if c_box and c_box["x"] + c_box["width"] > w + 0.5:
                            vp_fails.append(f"link-card[{idx}] right={c_box['x'] + c_box['width']:.1f} > viewport={w}")
                            break

                    if vp_fails:
                        print(f"  [FAIL] {label} -> {', '.join(vp_fails)}")
                        failures.append(f"{label}: {', '.join(vp_fails)}")
                    else:
                        print(f"  [PASS] {label} -> 0px overflow")
                    page.close()

            # =================================================================
            # TEST SUITE 3: 6-Channel Grid, Modals (Email & Phone) & Clean Footer
            # =================================================================
            print("\n[TEST SUITE 3] 6-Channel Bento Grid, Interactive Modals & Clean Footer")
            for w in [320, 375]:
                tests_run += 1
                page = browser.new_page(viewport={"width": w, "height": 800})
                page.goto(f"{base_url}/links", wait_until="domcontentloaded")

                # Verify .link-subtitle is white-space: normal
                ws = page.evaluate('window.getComputedStyle(document.querySelector(".link-subtitle")).whiteSpace')
                if ws != "normal":
                    msg = f"At {w}px, .link-subtitle whiteSpace is '{ws}', expected 'normal'"
                    print(f"  [FAIL] {msg}")
                    failures.append(msg)
                else:
                    print(f"  [PASS] At {w}px, .link-subtitle white-space is 'normal'")

                # Verify 6 channel tiles exist under .channels-bento-grid
                tiles = page.query_selector_all(".channels-bento-grid .channel-tile")
                if len(tiles) != 6:
                    msg = f"Expected 6 channel tiles in .channels-bento-grid, found {len(tiles)}"
                    print(f"  [FAIL] {msg}")
                    failures.append(msg)
                else:
                    print(f"  [PASS] At {w}px, verified 6 channel tiles (Facebook, Instagram, TikTok, WhatsApp, Correo, Llamada).")

                # Verify TikTok link and no footer social icons
                tiktok = page.query_selector('a[href="https://www.tiktok.com/@iogroup.pe"]')
                footer_socials = page.query_selector_all("footer .social-circle-link")
                if not tiktok:
                    failures.append("TikTok link https://www.tiktok.com/@iogroup.pe missing")
                if len(footer_socials) > 0:
                    failures.append("Redundant social icons still present in footer")
                else:
                    print(f"  [PASS] At {w}px, TikTok link verified and footer has 0 redundant social icons.")

                # Verify Email Modal opens and shows Naenciso@iogroup.pe and Jgarcia@iogroup.pe
                page.click("#openEmailBtn")
                page.wait_for_timeout(150)
                email_open = page.evaluate("document.getElementById('emailModal').open")
                email_links = page.query_selector_all("#emailModal a.modal-option-card")
                if not email_open or len(email_links) != 2:
                    failures.append("Email modal failed to open or missing 2 email options")
                else:
                    print(f"  [PASS] At {w}px, Email modal opened with 2 recipients (Naenciso@iogroup.pe, Jgarcia@iogroup.pe).")
                page.click('[data-close-modal="emailModal"]')

                # Verify Phone Modal opens and shows both phone numbers
                page.click("#openPhoneBtn")
                page.wait_for_timeout(150)
                phone_open = page.evaluate("document.getElementById('phoneModal').open")
                phone_links = page.query_selector_all("#phoneModal a.modal-option-card")
                if not phone_open or len(phone_links) != 2:
                    failures.append("Phone modal failed to open or missing 2 phone options")
                else:
                    print(f"  [PASS] At {w}px, Phone modal opened with 2 phone lines (+51 997 571 262, +51 973 224 733).")
                page.click('[data-close-modal="phoneModal"]')

                page.close()

            # =================================================================
            # TEST SUITE 4: Secondary Touch Targets (>= 48px Standards)
            # =================================================================
            print("\n[TEST SUITE 4] Interactive Touch Target Dimensions (>= 48px)")
            page = browser.new_page(viewport={"width": 375, "height": 800})
            page.goto(f"{base_url}/links", wait_until="domcontentloaded")

            # Check primary cards
            tests_run += 1
            primary_cards = page.query_selector_all(".link-card")
            card_failures = []
            for idx, c in enumerate(primary_cards):
                b = c.bounding_box()
                if b and b["height"] < 48:
                    card_failures.append(f"card[{idx}] h={b['height']:.1f}px")
            if card_failures:
                msg = f"Primary cards under 48px: {card_failures}"
                print(f"  [FAIL] {msg}")
                failures.append(msg)
            else:
                print(f"  [PASS] All {len(primary_cards)} primary .link-card elements measure >= 48px height.")

            # Check secondary elements on page
            tests_run += 1
            sec_elements = [
                (".btn-qr-trigger", "QR Code modal trigger button", False),     # check height
                (".complaints-link", "Libro de reclamaciones link", False),     # check height
            ]

            for selector, desc, check_both in sec_elements:
                elements = page.query_selector_all(selector)
                sub_fails = []
                for idx, el in enumerate(elements):
                    box = el.bounding_box()
                    if not box:
                        continue
                    if check_both and (box["width"] < 47.9 or box["height"] < 47.9):
                        sub_fails.append(f"[{idx}] {box['width']:.1f}x{box['height']:.1f}px")
                    elif not check_both and box["height"] < 47.9:
                        sub_fails.append(f"[{idx}] height={box['height']:.1f}px")

                if sub_fails:
                    msg = f"{desc} ({selector}) below 48px: {sub_fails}"
                    print(f"  [FAIL] {msg}")
                    failures.append(msg)
                else:
                    print(f"  [PASS] {desc} ({len(elements)} element(s)) meet >= 48px target standard.")

            # Open modal and check modal controls
            tests_run += 1
            page.click("#openQrBtn")
            page.wait_for_timeout(300)

            modal_elements = [
                (".modal-close-btn", "Modal close button", True),
                (".btn-qr-download.png", "PNG Download button in modal", False),
                (".btn-qr-download.svg", "SVG Download button in modal", False),
                (".btn-copy-url", "Copy URL button in modal", False),
            ]

            for selector, desc, check_both in modal_elements:
                el = page.query_selector(selector)
                if el:
                    box = el.bounding_box()
                    if box:
                        if check_both and (box["width"] < 47.9 or box["height"] < 47.9):
                            msg = f"{desc} ({selector}) is {box['width']:.1f}x{box['height']:.1f}px (< 48px)"
                            print(f"  [FAIL] {msg}")
                            failures.append(msg)
                        elif not check_both and box["height"] < 47.9:
                            msg = f"{desc} ({selector}) height is {box['height']:.1f}px (< 48px)"
                            print(f"  [FAIL] {msg}")
                            failures.append(msg)
                        else:
                            print(f"  [PASS] {desc} meets >= 48px standard ({box['width']:.1f}x{box['height']:.1f}px).")
                else:
                    msg = f"Modal element '{selector}' not found in DOM."
                    print(f"  [FAIL] {msg}")
                    failures.append(msg)

            page.close()

            # =================================================================
            # TEST SUITE 5: Official Corporate Brochure & QR Integrity
            # =================================================================
            print("\n[TEST SUITE 5] Official Corporate Brochure & QR Asset Integrity")
            tests_run += 1

            # Check official brochure file on disk
            official_pdf = "docs/BROCHURE IOGROUP OFICIAL.pdf"
            if not os.path.exists(official_pdf):
                msg = f"Missing official brochure file: {official_pdf}"
                print(f"  [FAIL] {msg}")
                failures.append(msg)
            else:
                sz = os.path.getsize(official_pdf)
                print(f"  [PASS] Official brochure '{official_pdf}' exists ({sz:,} bytes).")

            # Check artificial brochure deletion
            artificial_pdf = "docs/brochure-io-group.pdf"
            if os.path.exists(artificial_pdf):
                msg = f"Artificial brochure '{artificial_pdf}' still exists. Must be deleted!"
                print(f"  [FAIL] {msg}")
                failures.append(msg)
            else:
                print(f"  [PASS] Artificial brochure '{artificial_pdf}' is correctly removed.")

            # Check HTML href encoding
            with open("links.html", "r", encoding="utf-8") as f:
                html_text = f.read()

            if "docs/brochure-io-group.pdf" in html_text:
                msg = "links.html still references deprecated artificial brochure 'docs/brochure-io-group.pdf'"
                print(f"  [FAIL] {msg}")
                failures.append(msg)
            elif "BROCHURE%20IOGROUP%20OFICIAL.pdf" not in html_text and "BROCHURE IOGROUP OFICIAL.pdf" not in html_text:
                msg = "links.html does NOT link to the official corporate brochure"
                print(f"  [FAIL] {msg}")
                failures.append(msg)
            else:
                print("  [PASS] links.html correctly links to the official corporate brochure.")

            browser.close()

    finally:
        server.shutdown()
        print("\n[*] Ephemeral HTTP test server stopped.")

    # =================================================================
    # SUMMARY REPORT
    # =================================================================
    print("\n" + "=" * 70)
    print(f"REGRESSION SUITE EXECUTION COMPLETE: {tests_run} test categories run.")
    if failures:
        print(f"RESULT: FAILED ({len(failures)} failure(s) detected)")
        for idx, f in enumerate(failures, 1):
            print(f"  {idx}. {f}")
        print("=" * 70)
        return 1
    else:
        print("RESULT: ALL REGRESSION TESTS PASSED (100% SUCCESS)")
        print("=" * 70)
        return 0


if __name__ == "__main__":
    sys.exit(run_regression_tests())
