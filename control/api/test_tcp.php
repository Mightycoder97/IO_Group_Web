<?php
try {
    echo "Connecting to 127.0.0.1...\n";
    $pdo = new PDO("mysql:host=127.0.0.1;port=3306;dbname=u511863531_IOGroupBD", "u511863531_Sebastian", "Sebas0920%");
    echo "Connected successfully to 127.0.0.1!\n";
} catch (Exception $e) {
    echo "Connection failed: " . $e->getMessage() . "\n";
}
