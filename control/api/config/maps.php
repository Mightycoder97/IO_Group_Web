<?php
// Google Maps API Configuration
// API key loaded from environment (SEC-09)
require_once __DIR__ . '/config.php'; // ensures .env is loaded
return [
    'api_key' => getenv('GOOGLE_MAPS_API_KEY') ?: ''
];
