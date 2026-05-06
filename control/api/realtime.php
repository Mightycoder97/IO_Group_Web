<?php
/**
 * IO Group - Lightweight database change version endpoint
 *
 * This does not stream data. It gives the browser a cheap version hash so
 * pages can refresh their own data only when relevant tables changed.
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Metodo no permitido']);
    exit();
}

canView();

$scope = strtolower($_GET['scope'] ?? 'all');
$scope = preg_replace('/[^a-z0-9_-]/', '', $scope);

$scopeTables = [
    'all' => [
        'Cliente', 'Empresa', 'Sede', 'ContratoServicio', 'Servicio', 'Factura',
        'Guia', 'Manifiesto', 'IngresoNuevoCliente', 'GestionCobranza',
        'CalendarioRecojo', 'Ruta', 'Empleado', 'Vehiculo', 'Planta',
        'Prospecto', 'Egreso', 'Usuario'
    ],
    'dashboard' => [
        'Cliente', 'Empresa', 'Sede', 'ContratoServicio', 'Servicio', 'Factura',
        'Guia', 'Manifiesto', 'GestionCobranza', 'IngresoNuevoCliente', 'Ruta'
    ],
    'mapa' => ['Sede', 'Empresa', 'ContratoServicio'],
    'clientes' => ['Cliente', 'Empresa', 'Sede', 'ContratoServicio'],
    'empresas' => ['Empresa', 'Cliente', 'Sede', 'ContratoServicio'],
    'sedes' => ['Sede', 'Empresa', 'ContratoServicio'],
    'contratos' => ['ContratoServicio', 'Sede', 'Empresa'],
    'servicios' => ['Servicio', 'Sede', 'Empresa', 'ContratoServicio', 'Ruta'],
    'rutas' => ['Ruta', 'Servicio', 'Sede', 'Empresa', 'Vehiculo', 'Empleado'],
    'calendario' => ['CalendarioRecojo', 'Servicio', 'Sede', 'Empresa', 'Ruta'],
    'facturas' => ['Factura', 'Servicio', 'Empresa', 'Sede'],
    'guias' => ['Guia', 'Servicio', 'Empresa', 'Sede'],
    'manifiestos' => ['Manifiesto', 'Servicio', 'Empresa', 'Sede'],
    'cobranza' => ['GestionCobranza', 'Factura', 'Empresa', 'Sede'],
    'ingresos' => ['Factura', 'Servicio', 'Empresa', 'Sede'],
    'egresos' => ['Egreso'],
    'prospectos' => ['Prospecto'],
    'altas' => ['IngresoNuevoCliente', 'Cliente', 'Empresa', 'Sede'],
    'empleados' => ['Empleado'],
    'vehiculos' => ['Vehiculo'],
    'plantas' => ['Planta'],
    'usuarios' => ['Usuario'],
    'alertas' => ['ContratoServicio', 'Factura', 'Servicio', 'Sede', 'Empresa'],
    'reportes' => [
        'Cliente', 'Empresa', 'Sede', 'ContratoServicio', 'Servicio', 'Factura',
        'Guia', 'Manifiesto', 'GestionCobranza', 'Ruta'
    ],
];

$tables = $scopeTables[$scope] ?? $scopeTables['all'];
$tables = array_values(array_unique($tables));

try {
    $placeholders = implode(',', array_fill(0, count($tables), '?'));
    $columnRows = db()->query(
        "SELECT TABLE_NAME, COLUMN_NAME
         FROM INFORMATION_SCHEMA.COLUMNS
         WHERE TABLE_SCHEMA = ? AND TABLE_NAME IN ($placeholders)",
        array_merge([DB_NAME], $tables)
    );

    $columnsByTable = [];
    foreach ($columnRows as $row) {
        $table = $row['TABLE_NAME'];
        if (!isset($columnsByTable[$table])) {
            $columnsByTable[$table] = [];
        }
        $columnsByTable[$table][$row['COLUMN_NAME']] = true;
    }

    $summary = [];
    foreach ($tables as $table) {
        if (!isset($columnsByTable[$table])) {
            continue;
        }

        $dateColumn = null;
        if (isset($columnsByTable[$table]['fecha_modificacion'])) {
            $dateColumn = 'fecha_modificacion';
        } elseif (isset($columnsByTable[$table]['fecha_creacion'])) {
            $dateColumn = 'fecha_creacion';
        }

        $tableSql = '`' . str_replace('`', '``', $table) . '`';
        if ($dateColumn) {
            $dateSql = '`' . str_replace('`', '``', $dateColumn) . '`';
            $row = db()->queryOne(
                "SELECT COUNT(*) AS total, COALESCE(MAX(UNIX_TIMESTAMP($dateSql)), 0) AS max_modified
                 FROM $tableSql"
            );
        } else {
            $row = db()->queryOne("SELECT COUNT(*) AS total, 0 AS max_modified FROM $tableSql");
        }

        $summary[$table] = [
            'total' => intval($row['total'] ?? 0),
            'max_modified' => intval($row['max_modified'] ?? 0),
        ];
    }

    $version = sha1(json_encode($summary));

    echo json_encode([
        'success' => true,
        'data' => [
            'scope' => $scope,
            'version' => $version,
            'generated_at' => date('c'),
            'tables' => $summary,
        ],
    ]);
} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Error calculando version de datos',
    ]);
}
