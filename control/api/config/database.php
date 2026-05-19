<?php
/**
 * IO Group - Database Connection Class
 * PDO MySQL connection with singleton pattern
 */

require_once __DIR__ . "/config.php";

class Database
{
    private static $instance = null;
    private $connection;

    private function __construct()
    {
        try {
            $this->connect();
        } catch (PDOException $e) {
            $details =
                "DB  " .
                DB_HOST .
                ":" .
                DB_PORT .
                "/" .
                DB_NAME .
                " | Usuario: " .
                DB_USER;
            $errorMsg = $e->getMessage();
            // Log detailed error to server log, but only return safe message to client
            error_log(
                "Database connection failed: $details | Error: $errorMsg",
            );
            http_response_code(500);
            echo json_encode([
                "success" => false,
                "message" => "Error de conexión a la base de datos",
                "debug" =>
                    getenv("APP_DEBUG") === "true"
                        ? [
                            "env_loaded" => defined("ENV_LOADED") && ENV_LOADED,
                            "env_path" => defined("ENV_LOADED_PATH")
                                ? ENV_LOADED_PATH
                                : "not set",
                            "db_host" => DB_HOST,
                            "db_port" => DB_PORT,
                            "db_name" => DB_NAME ? "(configurada)" : "(vacia)",
                            "db_user" => DB_USER ? "(configurado)" : "(vacio)",
                            "pdo_error" => $errorMsg,
                        ]
                        : null,
            ]);
            exit();
        }
    }

    private function connect($forceNonPersistent = false)
    {
        $dsn =
            "mysql:host=" .
            DB_HOST .
            ";port=" .
            DB_PORT .
            ";dbname=" .
            DB_NAME .
            ";charset=" .
            DB_CHARSET;
        $persistent = $forceNonPersistent
            ? false
            : filter_var(
                getenv("DB_PERSISTENT") ?: "false",
                FILTER_VALIDATE_BOOLEAN,
            );
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
            PDO::ATTR_PERSISTENT => $persistent,
            PDO::MYSQL_ATTR_INIT_COMMAND =>
                "SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci",
        ];

        $this->connection = new PDO($dsn, DB_USER, DB_PASS, $options);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getConnection()
    {
        return $this->connection;
    }

    public function reconnect($forceNonPersistent = true)
    {
        $this->connection = null;
        $this->connect($forceNonPersistent);
        return $this->connection;
    }

    public function ping()
    {
        try {
            $this->connection->query("SELECT 1");
            return true;
        } catch (PDOException $e) {
            if ($this->isConnectionLost($e)) {
                $this->reconnect();
                return true;
            }
            throw $e;
        }
    }

    public function isConnectionLost($e)
    {
        $message = strtolower($e->getMessage());
        return strpos($message, "server has gone away") !== false ||
            strpos($message, "lost connection") !== false ||
            strpos($message, "error while sending query packet") !== false;
    }

    /**
     * Execute a SELECT query
     */
    public function query($sql, $params = [])
    {
        $stmt = $this->connection->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll();
    }

    /**
     * Execute a single row SELECT query
     */
    public function queryOne($sql, $params = [])
    {
        $stmt = $this->connection->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetch();
    }

    /**
     * Execute INSERT, UPDATE, DELETE
     */
    public function execute($sql, $params = [])
    {
        $stmt = $this->connection->prepare($sql);
        return $stmt->execute($params);
    }

    /**
     * Execute INSERT and return last insert ID
     */
    public function insert($sql, $params = [])
    {
        $stmt = $this->connection->prepare($sql);
        $stmt->execute($params);
        return $this->connection->lastInsertId();
    }

    /**
     * Get affected rows count
     */
    public function executeCount($sql, $params = [])
    {
        $stmt = $this->connection->prepare($sql);
        $stmt->execute($params);
        return $stmt->rowCount();
    }

    /**
     * Begin a database transaction
     */
    public function beginTransaction()
    {
        return $this->connection->beginTransaction();
    }

    /**
     * Commit the current transaction
     */
    public function commit()
    {
        return $this->connection->commit();
    }

    /**
     * Rollback the current transaction
     */
    public function rollBack()
    {
        return $this->connection->rollBack();
    }
}

// Helper function to get database instance
function db()
{
    return Database::getInstance();
}
