<?php
/**
 * IO Group - JWT Helper
 * Simple JWT implementation without external dependencies
 */

require_once __DIR__ . '/config.php';

class JWT {
    
    /**
     * Generate a JWT token
     */
    public static function generate($payload) {
        $header = self::base64UrlEncode(json_encode([
            'typ' => 'JWT',
            'alg' => 'HS256'
        ]));

        $payload['iat'] = time();
        $payload['exp'] = time() + JWT_EXPIRE;
        $payloadEncoded = self::base64UrlEncode(json_encode($payload));

        $signature = self::base64UrlEncode(
            hash_hmac('sha256', "$header.$payloadEncoded", JWT_SECRET, true)
        );

        return "$header.$payloadEncoded.$signature";
    }

    /**
     * Verify and decode a JWT token
     */
    public static function verify($token) {
        $parts = explode('.', $token);
        
        if (count($parts) !== 3) {
            return false;
        }

        list($header, $payload, $signature) = $parts;

        // Verify signature
        $expectedSignature = self::base64UrlEncode(
            hash_hmac('sha256', "$header.$payload", JWT_SECRET, true)
        );

        if (!hash_equals($expectedSignature, $signature)) {
            return false;
        }

        // Decode payload
        $data = json_decode(self::base64UrlDecode($payload), true);

        // Check expiration
        if (isset($data['exp']) && $data['exp'] < time()) {
            return false;
        }

        return $data;
    }

    /**
     * Base64 URL-safe encode
     */
    private static function base64UrlEncode($data) {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
    }

    /**
     * Base64 URL-safe decode
     */
    private static function base64UrlDecode($data) {
        return base64_decode(strtr($data, '-_', '+/'));
    }
}

/**
 * Get current authenticated user from request
 * Returns user data or sends 401 response
 */
function getAuthUser($required = true) {
    $headers = getallheaders();
    $authHeader = $headers['Authorization'] ?? $headers['authorization'] ?? '';

    if (empty($authHeader)) {
        if ($required) {
            http_response_code(401);
            echo json_encode([
                'success' => false,
                'message' => 'No se proporcionó token de autenticación'
            ]);
            exit();
        }
        return null;
    }

    // Extract token (Bearer <token>)
    $token = preg_replace('/^Bearer\s+/', '', $authHeader);

    $user = JWT::verify($token);

    if (!$user) {
        if ($required) {
            http_response_code(401);
            echo json_encode([
                'success' => false,
                'message' => 'Token inválido o expirado'
            ]);
            exit();
        }
        return null;
    }

    return $user;
}

/**
 * Check if user has required role
 */
function requireRole($roles) {
    $user = getAuthUser();
    
    if (!is_array($roles)) {
        $roles = [$roles];
    }

    if (!in_array($user['rol'], $roles)) {
        http_response_code(403);
        echo json_encode([
            'success' => false,
            'message' => 'No tiene permisos para realizar esta acción'
        ]);
        exit();
    }

    return $user;
}

/**
 * Check if user can edit (admin or editor)
 */
function canEdit() {
    return requireRole(['admin', 'editor']);
}

/**
 * Check if user can view (any authenticated user)
 */
function canView() {
    return getAuthUser();
}
