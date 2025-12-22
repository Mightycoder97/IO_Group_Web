<?php
/**
 * IO Group - Main API Router
 * Routes requests to appropriate PHP handler based on URL path
 */

// Set base directory
$basePath = dirname($_SERVER['SCRIPT_NAME']);
$requestUri = $_SERVER['REQUEST_URI'];
$path = parse_url($requestUri, PHP_URL_PATH);

// Remove base path
if ($basePath !== '/' && strpos($path, $basePath) === 0) {
    $path = substr($path, strlen($basePath));
}

// Route API requests
if (preg_match('#^/api/(\w+)#', $path, $matches)) {
    $endpoint = $matches[1];
    $apiFile = __DIR__ . "/api/{$endpoint}.php";
    
    // Map hyphenated endpoints
    $endpointMap = [
        'contratos-laborales' => 'contratos-laborales'
    ];
    
    if (isset($endpointMap[$endpoint])) {
        $apiFile = __DIR__ . "/api/{$endpointMap[$endpoint]}.php";
    }
    
    if (file_exists($apiFile)) {
        require $apiFile;
        exit;
    }
    
    http_response_code(404);
    header('Content-Type: application/json');
    echo json_encode(['success' => false, 'message' => 'Endpoint no encontrado']);
    exit;
}

// For non-API requests, serve static files or redirect to login
$publicPath = __DIR__ . '/public' . $path;

// If it's a request for a file that exists in public
if (is_file($publicPath)) {
    // Let the web server handle it
    return false;
}

// Default: redirect to public/index.html
header('Location: ' . $basePath . '/public/index.html');
exit;
