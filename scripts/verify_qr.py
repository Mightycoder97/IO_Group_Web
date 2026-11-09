#!/usr/bin/env python3
"""
IO Group QR Code Automated Verification Script
Decodes img/qr/qr-linktree.png using zxing-cpp and Pillow and asserts strict equality
with canonical production Linktree URL https://www.iogroup.pe/links.
Also verifies vector SVG asset img/qr/qr-linktree.svg.
"""

import sys
import os
from pathlib import Path
from PIL import Image
import zxingcpp

EXPECTED_URL = "https://www.iogroup.pe/links"
BASE_DIR = Path(__file__).resolve().parent.parent
PNG_PATH = BASE_DIR / "img" / "qr" / "qr-linktree.png"
SVG_PATH = BASE_DIR / "img" / "qr" / "qr-linktree.svg"

def verify_qr():
    print("=" * 60)
    print("IO Group QR Code Automated Verification")
    print("=" * 60)

    # 1. Verify PNG existence and dimensions
    print(f"[1/4] Checking PNG file existence: {PNG_PATH}")
    if not PNG_PATH.exists():
        print(f"ERROR: File not found: {PNG_PATH}")
        sys.exit(1)

    file_size_png = PNG_PATH.stat().st_size
    print(f"      File size: {file_size_png:,} bytes")
    if file_size_png == 0:
        print("ERROR: PNG file is empty!")
        sys.exit(1)

    try:
        with Image.open(PNG_PATH) as img:
            width, height = img.size
            img_format = img.format
            print(f"      Dimensions: {width}x{height} px | Format: {img_format}")
            if width != 1024 or height != 1024:
                print(f"ERROR: Expected 1024x1024, got {width}x{height}")
                sys.exit(1)
            
            # 2. Decode using zxing-cpp
            print("[2/4] Decoding QR barcode via zxing-cpp...")
            results = zxingcpp.read_barcodes(img)
            
            if not results:
                print("ERROR: No barcodes detected in PNG!")
                sys.exit(1)
            
            if len(results) != 1:
                print(f"ERROR: Expected 1 barcode, found {len(results)}")
                sys.exit(1)

            barcode = results[0]
            decoded_text = barcode.text
            print(f"      Detected format: {barcode.format}")
            print(f"      Decoded payload: '{decoded_text}'")

            # 3. Assert exact URL match
            print(f"[3/4] Asserting exact URL match with '{EXPECTED_URL}'...")
            if decoded_text != EXPECTED_URL:
                print(f"ERROR: Decoded text mismatch!\n  Expected: '{EXPECTED_URL}'\n  Actual:   '{decoded_text}'")
                sys.exit(1)
            print("      SUCCESS: Decoded URL strictly matches expected canonical URL.")

    except Exception as e:
        print(f"ERROR during PNG processing/decoding: {e}")
        sys.exit(1)

    # 4. Verify SVG asset
    print(f"[4/4] Checking SVG file existence: {SVG_PATH}")
    if not SVG_PATH.exists():
        print(f"ERROR: SVG file not found: {SVG_PATH}")
        sys.exit(1)

    file_size_svg = SVG_PATH.stat().st_size
    print(f"      SVG File size: {file_size_svg:,} bytes")
    if file_size_svg < 100:
        print("ERROR: SVG file is suspiciously small or empty!")
        sys.exit(1)

    svg_content = SVG_PATH.read_text(encoding="utf-8")
    if "<svg" not in svg_content or "</svg>" not in svg_content:
        print("ERROR: File does not contain valid SVG root tag!")
        sys.exit(1)
    print("      SUCCESS: SVG asset verified and valid.")

    print("=" * 60)
    print("ALL VERIFICATIONS PASSED: QR code assets are genuine and valid.")
    print("=" * 60)
    return 0

if __name__ == "__main__":
    sys.exit(verify_qr())
