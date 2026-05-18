# Implementation Plan — Security Hardening

## Project: IO_Group_Web
## Date: 2026-05-16

---

## Phase 0: Emergency — Remove Sensitive Data from Repository

> **Priority: CRITICAL** — These files contain real client data, financial records, and legal documents.

### 0.1 Remove sensitive files from the repository
- [ ] Remove all `.xlsx` files from repo root:
  - `COBRANZAS 2025.xlsx`
  - `DATA 2026.xlsx`
  - `DATA 2026_BACKUP.xlsx`
  - `PAGOS CLIENTES LIMA.xlsx`
  - `Datos.xlsx`
  - `Modelo_Hoja_De_Ruta.xlsx`
- [ ] Remove all `.docx` files:
  - `Doc1.docx`
  - `modelo_contrato.docx`
  - `control/modelo_contrato.docx`
  - `control/Entregables/AVANCE_ENTREGABLE_2_CATALOGOS_BASE.docx`
- [ ] Remove PDF templates from `control/`:
  - `MODELO FACTURA.PDF`
  - `MODELO GUIA DE TRANSPORTE.pdf`
  - `MODELO MANIFIESTO.pdf`
  - `MODELO RUTA.pdf`
- [ ] Remove `control/BASE DE DATOS 2026.xlsx`
- [ ] Remove `correos_extraidos.txt`
- [ ] Remove `Foto Manifiesto Modelo.jpeg`
- [ ] Purge files from git history (BFG or `git filter-repo`)
- [ ] Add all sensitive patterns to `.gitignore`

### 0.2 Update `.gitignore`
- [ ] Add patterns for all sensitive file types in root:
  ```
  *.xlsx
  *.docx
  *.pdf
  !README.pdf
  *.xls
  *.csv
  *.txt
  !.gitkeep
  !AGENTS.md
  ```

---

## Phase 1: Authentication & Token Security

> **Priority: CRITICAL** — JWT secret is hardcoded and known publicly.

### 1.1 Fix JWT Secret Fallback
**Files:** `control/config/auth.js`, `control/api/config/jwt.php`

- [ ] Remove hardcoded fallback `'iogroup_secret_key_2024'` from `auth.js:9`
- [ ] Remove empty-string fallback for `JWT_SECRET` in `config.php:63`
- [ ] Fail startup if `JWT_SECRET` is not set (throw error, don't default)
- [ ] Generate a secure random secret: `bin/random_bytes(32)` or equivalent

### 1.2 Implement JWT Revocation (Token Blacklist)
**Files:** `control/api/config/jwt.php`, `control/api/auth.php`

- [ ] Create `TokenBlacklist` table: `id, token_hash, expires_at, created_at`
- [ ] On logout: hash token and insert into blacklist
- [ ] On `getAuthUser()`: check if token is blacklisted before accepting
- [ ] Add cleanup job to remove expired entries

### 1.3 Harden Rate Limiting
**File:** `control/api/auth.php`

- [ ] Move rate limit storage from `sys_get_temp_dir()` to database table `LoginAttempts`
- [ ] Table schema: `id, ip_address, username, attempt_time`
- [ ] Implement exponential backoff after repeated failures
- [ ] Add account lockout after N consecutive failures (e.g., 10 attempts → 15 min lock)

### 1.4 Enforce Password Policy on Login/Change
**File:** `control/api/auth.php`

- [ ] Apply same password validation rules to `changePassword()` as `register()` (min 8 chars, uppercase, number, special char)
- [ ] Prevent reuse of last 3 passwords (store password history)
- [ ] Add password expiration policy (e.g., 90 days)

---

## Phase 2: CORS & API Security

> **Priority: HIGH** — Wildcard CORS allows any site to call your APIs.

### 2.1 Restrict CORS Origins
**Files:** `api/send-contact.php`, `api/newsletter-subscribe.php`, `api/sunat-ruc.php`

- [ ] Replace `Access-Control-Allow-Origin: *` with explicit allowed origins
- [ ] Create shared CORS config: `api/config/cors.php`
  ```php
  $allowedOrigins = [
      'https://iogroup.pe',
      'https://www.iogroup.pe',
  ];
  ```
- [ ] Validate `Origin` header against whitelist before setting response header

### 2.2 Fix config.php CORS Logic
**File:** `control/api/config/config.php:74-80`

- [ ] Current logic always sets `$allowedOrigin` regardless of match — fix to only set if origin is in whitelist
- [ ] Remove fallback to `*` behavior

### 2.3 Add CSRF Protection
**Files:** All form-handling endpoints

- [ ] Implement CSRF token generation and validation for:
  - `api/send-contact.php`
  - `api/newsletter-subscribe.php`
  - All `control/api/*.php` endpoints
- [ ] Store CSRF token in session or JWT
- [ ] Require `X-CSRF-Token` header on state-changing requests (POST, PUT, DELETE)
- [ ] For SPA: send CSRF token via meta tag or dedicated endpoint

### 2.4 Add Rate Limiting to Public APIs
**Files:** `api/send-contact.php`, `api/newsletter-subscribe.php`

- [ ] Implement IP-based rate limiting:
  - Contact form: max 5 submissions per hour per IP
  - Newsletter: max 3 subscriptions per hour per IP
- [ ] Use database-backed rate limit table (not temp files)
- [ ] Return `429 Too Many Requests` with `Retry-After` header

---

## Phase 3: Input Validation & Injection Prevention

> **Priority: HIGH** — Prevent XSS, email injection, and file upload attacks.

### 3.1 Fix Email Header Injection
**Files:** `api/send-contact.php`, `api/newsletter-subscribe.php`

- [ ] Sanitize all values used in email headers:
  ```php
  $safeEmail = preg_replace('/[\r\n]/', '', $email);
  ```
- [ ] Validate that `Reply-To` and `From` headers contain no line breaks
- [ ] Consider using PHPMailer instead of native `mail()` for better security

### 3.2 Harden File Upload Validation
**File:** `control/api/facturas.php` (and any other upload endpoints)

- [ ] Validate MIME type (not just extension):
  ```php
  $finfo = finfo_open(FILEINFO_MIME_TYPE);
  $mime = finfo_file($finfo, $_FILES['archivo_pdf']['tmp_name']);
  if ($mime !== 'application/pdf') { reject(); }
  ```
- [ ] Validate file extension against whitelist: `['pdf', 'jpg', 'png']`
- [ ] Limit file size (e.g., 10MB max)
- [ ] Rename uploaded files to UUID (don't use original filename)
- [ ] Store uploads outside web root or serve via PHP controller with auth check
- [ ] Add `.htaccess` to uploads directory to prevent PHP execution:
  ```apache
  <FilesMatch "\.php$">
      Order allow,deny
      Deny from all
  </FilesMatch>
  ```

### 3.3 Add Content Security Headers to Public Site
**File:** `.htaccess` (root)

- [ ] Add security headers currently missing from root `.htaccess`:
  ```apache
  Header set X-Content-Type-Options "nosniff"
  Header set X-Frame-Options "SAMEORIGIN"
  Header set Strict-Transport-Security "max-age=31536000; includeSubDomains"
  Header set Referrer-Policy "strict-origin-when-cross-origin"
  ```
- [ ] Add CSP header (start with report-only, then enforce):
  ```apache
  Header set Content-Security-Policy-Report-Only "default-src 'self'; script-src 'self' ..."
  ```

### 3.4 Tighten CSP in Control Panel
**File:** `control/.htaccess:80`

- [ ] Remove `'unsafe-inline'` from `script-src` (requires migrating inline scripts to external files)
- [ ] Remove `'unsafe-eval'` from `script-src`
- [ ] Use nonce-based or hash-based CSP for necessary inline scripts

---

## Phase 4: HTTPS & Transport Security

> **Priority: HIGH** — No HTTP-to-HTTPS redirect.

### 4.1 Enforce HTTPS
**File:** `.htaccess` (root) and `control/.htaccess`

- [ ] Add HTTP-to-HTTPS redirect:
  ```apache
  RewriteCond %{HTTPS} off
  RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
  ```
- [ ] Ensure HSTS header is set (already in `control/.htaccess`, add to root)

### 4.2 Secure Cookie Flags
**Files:** All PHP files that set cookies

- [ ] Ensure all cookies have `Secure`, `HttpOnly`, and `SameSite=Strict` flags
- [ ] JWT tokens should be stored in `HttpOnly` cookies (not localStorage)

---

## Phase 5: Remove Debug & Test Files

> **Priority: HIGH** — Debug scripts in production expose internals.

### 5.1 Remove Debug Files
**Files:** `control/api/`

- [ ] Remove or move outside web root:
  - `debug_ruta202.php`
  - `debug_rutas.php`
  - `fix_coords.php`
  - `test_prospecto.php`
  - `test_update_sede.php`
  - `update_prospecto_schema.php`
  - `diagnose_missing_gps.php`
  - `geocode_sedes_now.php`
  - `geocode_sedes_strict.php`
  - `geocode_sedes_google.php`
  - `audit_sede_geo_region.php`

### 5.2 Remove Migration Runner Scripts
**Files:** `control/`

- [ ] Remove or restrict access to:
  - `run_add_comprobante_column.php`
  - `run_alta_migration_2.php`
  - `run_alta_migration.php`
  - `run_firma_migration.php`
  - `run_migration.php`
- [ ] These should only be run via CLI, not accessible via web

### 5.3 Block Web Access to Migration/Debug Files
**File:** `control/.htaccess`

- [ ] Add rules to block web access to `run_*.php`, `debug_*.php`, `test_*.php`, `fix_*.php`

---

## Phase 6: Database & Configuration Security

> **Priority: MEDIUM-HIGH** — Protect credentials and database access.

### 6.1 Protect Database Config
**Files:** `control/api/config/config.php`, `control/api/config/database.php`

- [ ] Move `config.php` and `database.php` outside web root
- [ ] Ensure `.htaccess` blocks direct access to `config/` directory (already done, verify)
- [ ] Remove `DB_PASS` from any error output or logs

### 6.2 Secure Environment Loading
**Files:** `control/api/config/config.php`, `api/sunat-ruc.php`

- [ ] Use a proper .env parser library (e.g., `vlucas/phpdotenv`) instead of manual parsing
- [ ] Validate that all required env vars are set before proceeding
- [ ] Fail gracefully with generic error message (don't expose which var is missing)

### 6.3 Remove SQL Files from Repository
**Files:** `control/database/` and `control/database/migrations/`

- [ ] Move SQL migration files outside web root
- [ ] Or block access via `.htaccess`:
  ```apache
  <FilesMatch "\.sql$">
      Order allow,deny
      Deny from all
  </FilesMatch>
  ```
- [ ] Note: `.gitignore` already has `*.sql` but files may already be tracked

### 6.4 Protect Node.js Config Files
**Files:** `control/api/package.json`, `control/api/package-lock.json`

- [ ] Block web access to `package.json` and `package-lock.json` (reveals dependencies and versions)

---

## Phase 7: Logging & Error Handling

> **Priority: MEDIUM** — Prevent information leakage through errors.

### 7.1 Harden Error Reporting
**File:** `control/api/config/config.php:70-71`

- [ ] Ensure `display_errors = 0` in production (already set, verify)
- [ ] Set `log_errors = 1` and `error_log` to a secure path
- [ ] Never expose stack traces or SQL errors to the client

### 7.2 Sanitize Audit Logs
**Files:** All API files that write to `AuditLog`

- [ ] Ensure `datos_nuevos` and `datos_anteriores` don't contain password hashes or sensitive data
- [ ] Specifically check `usuarios.php` — audit log may store password data in JSON
- [ ] Redact sensitive fields before storing in audit log

### 7.3 Remove PHP Version Exposure
**Files:** `api/send-contact.php:171`, `api/newsletter-subscribe.php:253`, `api/newsletter-subscribe.php:320`

- [ ] Remove `X-Mailer: PHP/` . phpversion()` from email headers (reveals PHP version)

---

## Phase 8: Additional Hardening

> **Priority: MEDIUM** — Defense in depth.

### 8.1 Add Security Headers to Root `.htaccess`
**File:** `.htaccess` (root)

- [ ] Add all security headers currently only in `control/.htaccess`
- [ ] Remove deprecated `X-XSS-Protection` header (modern browsers ignore it, can cause issues)

### 8.2 Implement Request Size Limits
**File:** `.htaccess`, `control/.htaccess`

- [ ] Add `LimitRequestBody` to prevent oversized requests
- [ ] Already have `post_max_size = 120M` — consider reducing if not needed

### 8.3 Add Honeypot Fields to Forms
**Files:** Frontend HTML files + `api/send-contact.php`, `api/newsletter-subscribe.php`

- [ ] Add invisible honeypot field to detect bot submissions
- [ ] Reject submissions where honeypot field is filled

### 8.4 Implement Request Logging
**Files:** `control/api/config/config.php`

- [ ] Log all API requests: timestamp, IP, method, endpoint, user (if authenticated), response status
- [ ] Create `RequestLog` table for analysis and anomaly detection

### 8.5 Add Security.txt
**File:** `/.well-known/security.txt`

- [ ] Create security.txt per RFC 9116:
  ```
  Contact: mailto:security@iogroup.pe
  Preferred-Languages: es, en
  Policy: https://iogroup.pe/security-policy
  ```

### 8.6 Update Deprecated Headers
**File:** `control/.htaccess:77`

- [ ] Remove `X-XSS-Protection` (deprecated)
- [ ] Consider adding `Permissions-Policy` header

---

## Phase 9: Testing & Verification

> **Priority: MEDIUM** — Verify all changes work correctly.

### 9.1 Security Testing
- [ ] Run OWASP ZAP or Burp Suite against staging environment
- [ ] Test CSRF protection on all forms
- [ ] Verify CORS restrictions work correctly
- [ ] Test rate limiting under load
- [ ] Verify file upload restrictions
- [ ] Test JWT revocation
- [ ] Verify HTTPS redirect

### 9.2 Functional Testing
- [ ] Test contact form submission
- [ ] Test newsletter subscription
- [ ] Test login/logout flow
- [ ] Test all CRUD operations in control panel
- [ ] Test file upload for invoices
- [ ] Test RUC lookup

### 9.3 Code Review
- [ ] Review all changed files for regressions
- [ ] Verify no sensitive data remains in code or config
- [ ] Check that all `.env` values are properly loaded

---

## Summary by Priority

| Phase | Priority | Estimated Effort | Risk if Not Done |
|-------|----------|-----------------|------------------|
| 0 | CRITICAL | 1-2 hours | Data breach, legal liability |
| 1 | CRITICAL | 4-6 hours | Full account takeover |
| 2 | HIGH | 4-6 hours | CSRF attacks, spam, abuse |
| 3 | HIGH | 4-6 hours | XSS, injection, malware upload |
| 4 | HIGH | 1-2 hours | MITM attacks, credential theft |
| 5 | HIGH | 1-2 hours | Internal exposure, data manipulation |
| 6 | MEDIUM-HIGH | 2-4 hours | Credential leak, DB compromise |
| 7 | MEDIUM | 2-3 hours | Information leakage |
| 8 | MEDIUM | 3-4 hours | Reduced defense depth |
| 9 | MEDIUM | 4-8 hours | Undetected vulnerabilities |

**Total Estimated Effort: 26-44 hours**

---

## Dependencies & Order

1. **Phase 0** must be done FIRST — data is currently exposed
2. **Phase 1** depends on Phase 0 being complete
3. **Phase 2** can be done in parallel with Phase 1
4. **Phase 3** depends on Phase 2 (CORS must be fixed before CSRF)
5. **Phase 4** is independent but should be done early
6. **Phase 5** is independent
7. **Phase 6** depends on Phase 5 (clean up before securing config)
8. **Phase 7-8** can be done in parallel
9. **Phase 9** must be done LAST after all changes

---

## Notes

- All changes should be tested in a staging environment before production
- Back up the database before any schema changes
- Coordinate JWT secret rotation with all active users (will invalidate existing sessions)
- Consider implementing a maintenance window for Phase 1 changes (JWT changes will log out all users)
- The `control/api/config/maps.php` file is in `.gitignore` — verify it doesn't contain leaked API keys
