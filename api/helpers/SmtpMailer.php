<?php
/**
 * IO Group - SMTP Mailer Helper
 * Lightweight, socket-based SMTP client for sending HTML emails without external library dependencies.
 * Respects SSL/TLS options and environment configurations.
 */

class SmtpMailer
{
    private $host;
    private $port;
    private $user;
    private $pass;
    private $secure;

    public function __construct($host = null, $port = null, $user = null, $pass = null, $secure = null)
    {
        // Fallback to environment variables if parameters are not provided
        $this->host = $host ?: getenv('SMTP_HOST') ?: 'localhost';
        $this->port = $port ?: intval(getenv('SMTP_PORT') ?: 25);
        $this->user = $user ?: getenv('SMTP_USER') ?: '';
        $this->pass = $pass ?: getenv('SMTP_PASSWORD') ?: '';
        $this->secure = $secure ?: getenv('SMTP_SECURE') ?: '';
    }

    /**
     * Send an HTML email
     * 
     * @param string|array $to Destination email(s)
     * @param string $subject Email subject
     * @param string $body HTML body content
     * @param array $headers Additional headers (key => value)
     * @return bool True on success, false on failure
     */
    public function send($to, $subject, $body, $headers = [])
    {
        $remote = $this->host;
        
        // Handle SSL prefix if configured
        if (strtolower($this->secure) === 'ssl') {
            $remote = 'ssl://' . $remote;
        }

        // Context options to prevent SSL handshake errors on local/self-signed certs
        $context = stream_context_create([
            'ssl' => [
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
            ]
        ]);

        error_log("SMTP: Connecting to {$remote}:{$this->port}");
        
        $socket = @stream_socket_client(
            "{$remote}:{$this->port}",
            $errno,
            $errstr,
            15,
            STREAM_CLIENT_CONNECT,
            $context
        );

        if (!$socket) {
            error_log("SMTP Connection Error: {$errstr} ({$errno})");
            return false;
        }

        // Helper to read SMTP server responses
        $getResponse = function ($sock) {
            $response = "";
            while (($line = fgets($sock, 515)) !== false) {
                $response .= $line;
                // SMTP multi-line response lines have a '-' after status code. Last line has a space.
                if (substr($line, 3, 1) === " ") {
                    break;
                }
            }
            return $response;
        };

        // Helper to send a command and log/return response
        $sendCommand = function ($sock, $cmd) use ($getResponse) {
            fputs($sock, $cmd . "\r\n");
            $resp = $getResponse($sock);
            error_log("SMTP TX: " . trim($cmd) . " | RX: " . trim($resp));
            return $resp;
        };

        // Read initial connection greeting (should be 220)
        $greeting = $getResponse($socket);
        error_log("SMTP Greeting: " . trim($greeting));
        if (strpos($greeting, '220') !== 0) {
            fclose($socket);
            return false;
        }

        $serverName = $_SERVER['SERVER_NAME'] ?? 'localhost';
        $sendCommand($socket, "EHLO {$serverName}");

        // Handle STARTTLS if configured
        if (strtolower($this->secure) === 'tls') {
            $starttls = $sendCommand($socket, "STARTTLS");
            if (strpos($starttls, '220') !== 0) {
                error_log("SMTP: STARTTLS rejected");
                fclose($socket);
                return false;
            }
            // Enable crypto stream
            if (!stream_socket_enable_crypto($socket, true, STREAM_CRYPTO_METHOD_TLS_CLIENT)) {
                error_log("SMTP: Failed to enable TLS encryption");
                fclose($socket);
                return false;
            }
            // Send EHLO again over encrypted channel
            $sendCommand($socket, "EHLO {$serverName}");
        }

        // Authenticate if credentials are provided
        if (!empty($this->user)) {
            $auth = $sendCommand($socket, "AUTH LOGIN");
            if (strpos($auth, '334') !== 0) {
                error_log("SMTP: AUTH LOGIN not supported or rejected");
                fclose($socket);
                return false;
            }
            
            $userResp = $sendCommand($socket, base64_encode($this->user));
            $passResp = $sendCommand($socket, base64_encode($this->pass));
            
            if (strpos($passResp, '235') !== 0) {
                error_log("SMTP: Authentication failed for user {$this->user}");
                fclose($socket);
                return false;
            }
        }

        // Set Mail Sender
        $fromEmail = $this->user ?: 'noreply@iogroup.pe';
        $mailFrom = $sendCommand($socket, "MAIL FROM:<{$fromEmail}>");
        if (strpos($mailFrom, '250') !== 0) {
            error_log("SMTP: Sender rejected");
            fclose($socket);
            return false;
        }

        // Set Mail Recipients
        $toEmails = is_array($to) ? $to : explode(',', $to);
        $hasRecipient = false;
        foreach ($toEmails as $toEmail) {
            $toEmail = trim($toEmail);
            if (!empty($toEmail)) {
                $rcptTo = $sendCommand($socket, "RCPT TO:<{$toEmail}>");
                if (strpos($rcptTo, '250') === 0 || strpos($rcptTo, '251') === 0) {
                    $hasRecipient = true;
                } else {
                    error_log("SMTP: Recipient {$toEmail} rejected");
                }
            }
        }

        if (!$hasRecipient) {
            error_log("SMTP: No valid recipients accepted");
            fclose($socket);
            return false;
        }

        // Start DATA block
        $data = $sendCommand($socket, "DATA");
        if (strpos($data, '354') !== 0) {
            error_log("SMTP: DATA command rejected");
            fclose($socket);
            return false;
        }

        // Build email headers
        $emailHeaders = [];
        $emailHeaders['MIME-Version'] = '1.0';
        $emailHeaders['Content-Type'] = 'text/html; charset=UTF-8';
        $emailHeaders['From'] = '"IO Group" <' . $fromEmail . '>';
        $emailHeaders['To'] = is_array($to) ? implode(', ', $to) : $to;
        $emailHeaders['Subject'] = '=?UTF-8?B?' . base64_encode($subject) . '?='; // UTF-8 Subject encoding
        $emailHeaders['Date'] = date('r');
        $emailHeaders['X-Mailer'] = 'PHP/' . phpversion();

        // Merge custom headers
        foreach ($headers as $key => $val) {
            $emailHeaders[$key] = $val;
        }

        // Format headers string
        $headersStr = "";
        foreach ($emailHeaders as $k => $v) {
            $headersStr .= "{$k}: {$v}\r\n";
        }

        // Escape dot at start of line as per RFC 5321
        $escapedBody = str_replace("\r\n.", "\r\n..", $body);
        if (strpos($escapedBody, '.') === 0) {
            $escapedBody = '.' . $escapedBody;
        }

        // Send headers + body + end message dot
        fputs($socket, $headersStr . "\r\n" . $escapedBody . "\r\n.\r\n");
        $dataFinish = $getResponse($socket);
        error_log("SMTP DATA FINISH: " . trim($dataFinish));

        // Close connection
        $sendCommand($socket, "QUIT");
        fclose($socket);

        return strpos($dataFinish, '250') === 0;
    }
}
