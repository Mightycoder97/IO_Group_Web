<?php
/**
 * IO Group - .env Backup & Restore Tool
 *
 * USAGE (CLI):
 *   php env-tool.php export          → creates .env.enc (encrypted backup)
 *   php env-tool.php import          → restores .env from .env.enc
 *   php env-tool.php show            → shows decrypted .env content
 *
 * USAGE (Browser): Access via URL with ?action=export|import|show
 *
 * The encrypted file .env.enc can be safely committed to git
 * or stored anywhere. It's protected by a master password.
 */

$isCli = php_sapi_name() === "cli";
$action = $isCli
    ? $argv[1] ?? "help"
    : $_GET["action"] ?? ($_POST["action"] ?? "help");
$masterPassword = null;

// ====== CONFIGURATION ======
define("ENV_FILE", __DIR__ . "/../.env");
define("BACKUP_FILE", __DIR__ . "/../.env.enc");
define("CIPHER", "aes-256-cbc");

// ====== AUTHENTICATION (browser only) ======
if (!$isCli) {
    require_once __DIR__ . "/config/jwt.php";

    // Require admin role for all browser access
    $authUser = getAuthUser(false);
    if (!$authUser) {
        // Not authenticated — redirect to login
        $loginPath = str_replace(
            "/api/env-tool.php",
            "/public/pages/login.html",
            $_SERVER["SCRIPT_NAME"],
        );
        header("Location: " . $loginPath);
        exit();
    }
    if ($authUser["rol"] !== "admin") {
        http_response_code(403);
        tool_output(
            "❌ Access denied. Only administrators can use this tool.",
            "error",
        );
        exit();
    }
    tool_output(
        "🔒 Authenticated as: " .
            htmlspecialchars($authUser["nombre"] ?? $authUser["username"]),
        "ok",
    );
}

function tool_output($msg, $type = "info")
{
    global $isCli;
    if ($isCli) {
        $colors = [
            "ok" => "\033[32m",
            "error" => "\033[31m",
            "warn" => "\033[33m",
            "info" => "\033[36m",
            "reset" => "\033[0m",
        ];
        echo ($colors[$type] ?? "") . $msg . $colors["reset"] . "\n";
    } else {
        $color = [
            "ok" => "#6a9955",
            "error" => "#f44747",
            "warn" => "#ce9178",
            "info" => "#569cd6",
        ];
        echo "<div style='font-family:monospace;padding:4px 0;color:{$color[$type]}'>" .
            htmlspecialchars($msg) .
            "</div>\n";
    }
}

function getMasterPassword()
{
    global $isCli, $masterPassword;
    if ($masterPassword) {
        return $masterPassword;
    }

    if ($isCli) {
        echo "Enter master password: ";
        system("stty -echo");
        $password = trim(fgets(STDIN));
        system("stty echo");
        echo "\n";
        return $password;
    } else {
        $password = $_POST["password"] ?? ($_GET["password"] ?? "");
        if (!$password && ($_SERVER["REQUEST_METHOD"] ?? "") === "GET") {
            return null; // Will prompt via HTML form
        }
        return $password;
    }
}

function encryptEnv($plaintext, $password)
{
    $key = hash("sha256", $password, true);
    $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length(CIPHER));
    $encrypted = openssl_encrypt($plaintext, CIPHER, $key, 0, $iv);
    if ($encrypted === false) {
        throw new Exception("Encryption failed: " . openssl_error_string());
    }
    // Format: base64(iv):base64(encrypted)
    return base64_encode($iv) . ":" . base64_encode($encrypted);
}

function decryptEnv($payload, $password)
{
    $parts = explode(":", $payload, 2);
    if (count($parts) !== 2) {
        throw new Exception("Invalid encrypted format");
    }
    $iv = base64_decode($parts[0]);
    $encrypted = base64_decode($parts[1]);
    $key = hash("sha256", $password, true);
    $decrypted = openssl_decrypt($encrypted, CIPHER, $key, 0, $iv);
    if ($decrypted === false) {
        throw new Exception(
            "Decryption failed. Wrong password or corrupted file.",
        );
    }
    return $decrypted;
}

// ====== Export ======
function action_export()
{
    if (!file_exists(ENV_FILE)) {
        tool_output("❌ .env file not found at: " . ENV_FILE, "error");
        tool_output("   Create it first based on .env.example", "info");
        return;
    }

    $password = getMasterPassword();
    if (!$password) {
        showPasswordForm("export");
        return;
    }

    // Confirm password
    global $isCli;
    if ($isCli) {
        echo "Confirm password: ";
        system("stty -echo");
        $confirm = trim(fgets(STDIN));
        system("stty echo");
        echo "\n";
        if ($password !== $confirm) {
            tool_output("❌ Passwords do not match", "error");
            return;
        }
    }

    try {
        $plaintext = file_get_contents(ENV_FILE);
        if ($plaintext === false) {
            throw new Exception("Cannot read .env");
        }

        $encrypted = encryptEnv($plaintext, $password);
        file_put_contents(BACKUP_FILE, $encrypted);

        tool_output(
            "✅ .env encrypted and saved to: " . basename(BACKUP_FILE),
            "ok",
        );
        tool_output("   You can now safely store this file anywhere.", "info");
        tool_output("   To restore, run: php env-tool.php import", "info");
        tool_output(
            "   Store your master password in a password manager!",
            "warn",
        );
    } catch (Exception $e) {
        tool_output("❌ Export failed: " . $e->getMessage(), "error");
    }
}

// ====== Import ======
function action_import()
{
    if (!file_exists(BACKUP_FILE)) {
        tool_output(
            "❌ Backup file not found: " . basename(BACKUP_FILE),
            "error",
        );
        tool_output(
            "   Place .env.enc in the control/ directory first.",
            "info",
        );
        return;
    }

    if (file_exists(ENV_FILE)) {
        global $isCli;
        if ($isCli) {
            echo ".env already exists. Overwrite? [y/N]: ";
            $confirm = strtolower(trim(fgets(STDIN)));
            if ($confirm !== "y") {
                tool_output("Aborted.", "warn");
                return;
            }
        }
    }

    $password = getMasterPassword();
    if (!$password) {
        showPasswordForm("import");
        return;
    }

    try {
        $payload = file_get_contents(BACKUP_FILE);
        $decrypted = decryptEnv($payload, $password);
        file_put_contents(ENV_FILE, $decrypted);

        tool_output("✅ .env restored successfully!", "ok");
        tool_output("   File: " . ENV_FILE, "info");
    } catch (Exception $e) {
        tool_output("❌ Import failed: " . $e->getMessage(), "error");
    }
}

// ====== Show ======
function action_show()
{
    if (!file_exists(ENV_FILE)) {
        tool_output("❌ .env file not found", "error");
        return;
    }

    $password = getMasterPassword();
    if (!$password) {
        showPasswordForm("show");
        return;
    }

    // For show, we just read the plain .env (needs server access)
    // OR decrypt from .env.enc
    $source = file_exists(BACKUP_FILE) ? BACKUP_FILE : null;

    if ($source === BACKUP_FILE) {
        try {
            $payload = file_get_contents(BACKUP_FILE);
            $content = decryptEnv($payload, $password);
            tool_output("--- .env content (from backup) ---", "info");
            tool_output($content, "info");
        } catch (Exception $e) {
            tool_output("❌ Cannot decrypt: " . $e->getMessage(), "error");
        }
    } else {
        // Read plain .env directly (mask passwords)
        $lines = file(ENV_FILE, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        tool_output("--- .env content (passwords masked) ---", "info");
        foreach ($lines as $line) {
            $line = trim($line);
            if ($line === "" || str_starts_with($line, "#")) {
                tool_output($line, "info");
                continue;
            }
            if (
                strpos($line, "PASSWORD") !== false ||
                strpos($line, "SECRET") !== false ||
                strpos($line, "KEY") !== false ||
                strpos($line, "TOKEN") !== false
            ) {
                $key = explode("=", $line, 2)[0];
                tool_output("$key=***hidden***", "warn");
            } else {
                tool_output($line, "info");
            }
        }
    }
}

// ====== HTML Form (Browser) ======
function showPasswordForm($action)
{
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>IO Group - .env Tool</title>
        <style>
            body { font-family: system-ui; max-width: 480px; margin: 80px auto; padding: 24px; background: #1e1e1e; color: #d4d4d4; }
            h2 { color: #4ec9b0; }
            input, button { width: 100%; padding: 10px; margin: 8px 0; border-radius: 8px; border: 1px solid #555; background: #2d2d2d; color: #fff; font-size: 14px; box-sizing: border-box; }
            button { background: #0e639c; cursor: pointer; font-weight: bold; }
            button:hover { background: #1177bb; }
            .note { color: #ce9178; font-size: 12px; margin-top: 16px; }
        </style>
    </head>
    <body>
        <h2>🔐 IO Group - .env Tool</h2>
        <p>Action: <strong><?php echo htmlspecialchars($action); ?></strong></p>
        <form method="POST">
            <input type="hidden" name="action" value="<?php echo htmlspecialchars(
                $action,
            ); ?>">
            <label>Master Password:</label>
            <input type="password" name="password" placeholder="Enter your master password" required autofocus>
            <button type="submit">Submit</button>
        </form>
        <div class="note">
            ⚠️ This password protects your .env backup. Store it in a password manager!
        </div>
    </body>
    </html>
    <?php exit();
}

function showHelp()
{
    global $isCli;
    if ($isCli) {
        echo "IO Group - .env Backup & Restore Tool\n";
        echo "======================================\n";
        echo "Usage:\n";
        echo "  php env-tool.php export    Create encrypted .env.enc backup\n";
        echo "  php env-tool.php import    Restore .env from .env.enc\n";
        echo "  php env-tool.php show      View .env content (masked)\n\n";
        echo "The encrypted .env.enc file can be stored anywhere safely.\n";
        echo "You only need to remember your master password.\n";
    } else {
         ?>
        <!DOCTYPE html>
        <html><head><title>IO Group - .env Tool</title>
        <style>body{font-family:system-ui;max-width:500px;margin:80px auto;padding:24px;background:#1e1e1e;color:#d4d4d4;}
        h2{color:#4ec9b0;}a{display:block;padding:10px;margin:6px 0;background:#2d2d2d;color:#569cd6;text-decoration:none;border-radius:8px;}
        a:hover{background:#333;}</style></head><body>
        <h2>🔐 IO Group - .env Tool</h2>
        <p>Select an action:</p>
        <a href="?action=export">📤 Export (create .env.enc backup)</a>
        <a href="?action=import">📥 Import (restore from .env.enc)</a>
        <a href="?action=show">👁 Show .env content</a>
        </body></html>
        <?php
    }
}

// ====== Main ======
if (!$isCli && ($_SERVER["REQUEST_METHOD"] ?? "") === "POST") {
    $password = $_POST["password"] ?? "";
    if (!$password) {
        tool_output("❌ Password is required", "error");
        exit();
    }
    $masterPassword = $password;
}

switch ($action) {
    case "export":
        action_export();
        break;
    case "import":
        action_import();
        break;
    case "show":
        action_show();
        break;
    default:
        showHelp();
        break;
}
