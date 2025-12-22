/**
 * IO Group - Database Configuration (MySQL)
 * Compatible with Hostinger MySQL hosting
 * Auto-converts SQL Server syntax to MySQL
 */

const mysql = require('mysql2/promise');
require('dotenv').config();

let pool = null;

/**
 * Get database connection pool
 */
async function getConnection() {
    if (!pool) {
        pool = mysql.createPool({
            host: process.env.DB_HOST || 'localhost',
            port: process.env.DB_PORT || 3306,
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || '',
            database: process.env.DB_DATABASE || 'iogroup_db',
            waitForConnections: true,
            connectionLimit: 10,
            queueLimit: 0,
            timezone: '-05:00'
        });

        // Test connection
        try {
            const conn = await pool.getConnection();
            console.log('✅ Conexión a MySQL establecida');
            conn.release();
        } catch (err) {
            console.error('❌ Error conectando a MySQL:', err.message);
            throw err;
        }
    }
    return pool;
}

/**
 * Execute a query with parameters
 * Converts SQL Server syntax to MySQL automatically
 * @param {string} query - SQL query with @param style placeholders
 * @param {Object|Array} params - Parameters object { paramName: value } or array
 * @returns {Promise<Object>} Query result with recordset property
 */
async function executeQuery(query, params = {}) {
    const connection = await getConnection();

    // Convert SQL Server functions to MySQL
    let mysqlQuery = query
        .replace(/GETDATE\(\)/gi, 'NOW()')
        .replace(/ISNULL\(/gi, 'IFNULL(')
        .replace(/LEN\(/gi, 'LENGTH(')
        .replace(/GETUTCDATE\(\)/gi, 'UTC_TIMESTAMP()')
        .replace(/CONVERT\(VARCHAR.*?,\s*(.*?)\)/gi, 'DATE_FORMAT($1, "%Y-%m-%d")');

    // Handle OUTPUT INSERTED.id_xxx pattern for INSERT
    const outputMatch = mysqlQuery.match(/OUTPUT\s+INSERTED\.(\w+)/i);
    if (outputMatch) {
        mysqlQuery = mysqlQuery.replace(/OUTPUT\s+INSERTED\.\w+/gi, '');
    }

    let positionalParams = [];

    // Convert named params to positional
    if (params && typeof params === 'object' && !Array.isArray(params)) {
        const paramNames = Object.keys(params);

        // Sort by length descending to avoid replacing partial names (e.g., @id before @id_user)
        paramNames.sort((a, b) => b.length - a.length);

        // Find all @param occurrences in order
        const paramOrder = [];
        let tempQuery = mysqlQuery;
        const regex = /@(\w+)/g;
        let match;
        while ((match = regex.exec(mysqlQuery)) !== null) {
            paramOrder.push(match[1]);
        }

        // Replace all @param with ?
        paramNames.forEach(name => {
            mysqlQuery = mysqlQuery.replace(new RegExp('@' + name + '\\b', 'g'), '?');
        });

        // Build positional params in order of appearance
        paramOrder.forEach(name => {
            if (params.hasOwnProperty(name)) {
                positionalParams.push(params[name]);
            }
        });
    } else if (Array.isArray(params)) {
        positionalParams = params;
    }

    try {
        const [rows, fields] = await connection.execute(mysqlQuery, positionalParams);

        // Handle INSERT - return insertId
        if (outputMatch && rows.insertId) {
            return {
                recordset: [{ [outputMatch[1]]: rows.insertId }],
                rowsAffected: [rows.affectedRows]
            };
        }

        // For SELECT queries
        if (Array.isArray(rows)) {
            return { recordset: rows, rowsAffected: [rows.length] };
        }

        // For UPDATE/DELETE
        return { recordset: [], rowsAffected: [rows.affectedRows] };
    } catch (err) {
        console.error('❌ Query error:', err.message);
        console.error('Query:', mysqlQuery);
        console.error('Params:', positionalParams);
        throw err;
    }
}

/**
 * Execute a stored procedure
 */
async function executeProcedure(procedure, params = {}) {
    const connection = await getConnection();
    const paramValues = Object.values(params);
    const placeholders = paramValues.map(() => '?').join(',');
    const [rows] = await connection.execute(`CALL ${procedure}(${placeholders})`, paramValues);
    return { recordset: Array.isArray(rows) ? rows[0] : rows };
}

/**
 * Close connection pool
 */
async function closeConnection() {
    if (pool) {
        await pool.end();
        pool = null;
        console.log('🔌 Conexión a MySQL cerrada');
    }
}

// Compatibility exports (same interface as mssql version)
module.exports = {
    sql: mysql,
    getConnection,
    executeQuery,
    executeProcedure,
    closeConnection
};
