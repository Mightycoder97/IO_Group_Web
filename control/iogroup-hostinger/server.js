/**
 * IO Group - Server Entry Point
 */

require('dotenv').config();
const app = require('./src/app');
const { getConnection, closeConnection } = require('./config/database');

const PORT = process.env.PORT || 3000;

// Start server
async function startServer() {
    try {
        // Test database connection
        console.log('🔄 Conectando a SQL Server...');
        await getConnection();

        // Start Express server
        app.listen(PORT, () => {
            console.log('');
            console.log('============================================');
            console.log('  🌿 IO GROUP - Sistema de Operaciones');
            console.log('============================================');
            console.log(`  📡 Servidor: http://localhost:${PORT}`);
            console.log(`  📊 Base de datos: IOGroupDB`);
            console.log(`  🖥️  SQL Server: SEBASTIAN`);
            console.log('============================================');
            console.log('');
        });
    } catch (err) {
        console.error('❌ Error iniciando servidor:', err.message);
        process.exit(1);
    }
}

// Graceful shutdown
process.on('SIGINT', async () => {
    console.log('\n🛑 Cerrando servidor...');
    await closeConnection();
    process.exit(0);
});

process.on('SIGTERM', async () => {
    console.log('\n🛑 Cerrando servidor...');
    await closeConnection();
    process.exit(0);
});

// Start the server
startServer();
