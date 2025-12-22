/**
 * IO Group - Express Application Configuration
 */

const express = require('express');
const cors = require('cors');
const path = require('path');

// Import routes
const authRoutes = require('./routes/auth.routes');
const clientesRoutes = require('./routes/clientes.routes');
const empresasRoutes = require('./routes/empresas.routes');
const sedesRoutes = require('./routes/sedes.routes');
const contratosRoutes = require('./routes/contratos.routes');
const empleadosRoutes = require('./routes/empleados.routes');
const contratosLaboralesRoutes = require('./routes/contratos-laborales.routes');
const vehiculosRoutes = require('./routes/vehiculos.routes');
const plantasRoutes = require('./routes/plantas.routes');
const rutasRoutes = require('./routes/rutas.routes');
const serviciosRoutes = require('./routes/servicios.routes');
const manifestosRoutes = require('./routes/manifiestos.routes');
const guiasRoutes = require('./routes/guias.routes');
const facturasRoutes = require('./routes/facturas.routes');
const reportesRoutes = require('./routes/reportes.routes');
const alertasRoutes = require('./routes/alertas.routes');

// Create Express app
const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files from public folder
app.use(express.static(path.join(__dirname, '../public')));

// Serve uploaded files
app.use('/uploads', express.static(path.join(__dirname, '../uploads')));

// API Routes
app.use('/api/auth', authRoutes);
app.use('/api/clientes', clientesRoutes);
app.use('/api/empresas', empresasRoutes);
app.use('/api/sedes', sedesRoutes);
app.use('/api/contratos', contratosRoutes);
app.use('/api/empleados', empleadosRoutes);
app.use('/api/contratos-laborales', contratosLaboralesRoutes);
app.use('/api/vehiculos', vehiculosRoutes);
app.use('/api/plantas', plantasRoutes);
app.use('/api/rutas', rutasRoutes);
app.use('/api/servicios', serviciosRoutes);
app.use('/api/manifiestos', manifestosRoutes);
app.use('/api/guias', guiasRoutes);
app.use('/api/facturas', facturasRoutes);
app.use('/api/reportes', reportesRoutes);
app.use('/api/alertas', alertasRoutes);

// Health check endpoint
app.get('/api/health', (req, res) => {
    res.json({
        success: true,
        message: 'IO Group API funcionando correctamente',
        timestamp: new Date().toISOString()
    });
});

// Catch-all route for SPA (redirect to login)
app.get('*', (req, res) => {
    // If it's an API route that wasn't found
    if (req.path.startsWith('/api/')) {
        return res.status(404).json({
            success: false,
            message: 'Endpoint no encontrado'
        });
    }

    // Otherwise serve the index.html for client-side routing
    res.sendFile(path.join(__dirname, '../public/index.html'));
});

// Error handling middleware
app.use((err, req, res, next) => {
    console.error('Error:', err);
    res.status(500).json({
        success: false,
        message: 'Error interno del servidor',
        error: process.env.NODE_ENV === 'development' ? err.message : undefined
    });
});

module.exports = app;
