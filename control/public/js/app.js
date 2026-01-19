/**
 * IO Group - Main Application JS
 */

// Active nav item
document.addEventListener('DOMContentLoaded', function () {
    const currentPath = window.location.pathname;
    document.querySelectorAll('.nav-item').forEach(item => {
        if (item.getAttribute('href') && currentPath.includes(item.getAttribute('href').replace('.html', ''))) {
            item.classList.add('active');
        } else if (!currentPath.includes(item.getAttribute('href')?.split('/')[0])) {
            item.classList.remove('active');
        }
    });
});

// Sidebar template with permission filtering
function getSidebarHTML() {
    const user = getUser();
    const isAdmin = user?.rol === 'admin';

    // Base path for pages
    const base = getBasePath() + '/pages/';

    // Helper to check if module is allowed
    const canView = (modulo) => {
        if (isAdmin) return true;
        return user?.permisos?.[modulo]?.ver === true;
    };

    // Helper to generate nav item
    const navItem = (href, icon, label, modulo) => {
        if (!canView(modulo)) return '';
        return `<a href="${base}${href}" class="nav-item"><i class="bi bi-${icon}"></i> ${label}</a>`;
    };

    // Helper to generate section (only if has visible items)
    const section = (title, items) => {
        const visibleItems = items.filter(i => i);
        if (visibleItems.length === 0) return '';
        return `<div class="nav-section"><div class="nav-section-title">${title}</div></div>${visibleItems.join('')}`;
    };

    return `
        <div class="sidebar-header">
            <i class="bi bi-recycle" style="font-size: 2rem; color: #81C784;"></i>
            <h2 style="color: white; font-size: 1.1rem; margin: 0.5rem 0 0 0;">IO Control</h2>
        </div>
        <nav class="sidebar-nav">
            ${navItem('dashboard.html', 'speedometer2', 'Dashboard', 'dashboard')}
            
            ${section('Clientes', [
        navItem('sedes/listar.html', 'geo-alt', 'Clientes', 'sedes'),
        navItem('prospectos/listar.html', 'person-hearts', 'Prospectos', 'prospectos')
    ])}
            
            ${section('Logístico', [
        navItem('calendario/index.html', 'calendar3', 'Calendario', 'rutas'),
        navItem('rutas/listar.html', 'truck', 'Asignar Rutas', 'rutas'),
        navItem('rutas/historial.html', 'clock-history', 'Historial Rutas', 'rutas'),
        navItem('servicios/listar.html', 'box-seam', 'Servicios', 'servicios'),
        navItem('manifiestos/listar.html', 'journal-text', 'Manifiestos', 'manifiestos'),
        navItem('guias/listar.html', 'file-earmark', 'Guías', 'guias')
    ])}
            
            ${section('Financiero', [
        navItem('facturas/listar.html', 'receipt', 'Facturas', 'facturas'),
        navItem('cobranza/listar.html', 'cash-coin', 'Cobranza', 'cobranza')
    ])}
            
            ${section('Configuración', [
        navItem('vehiculos/listar.html', 'truck', 'Vehículos', 'vehiculos'),
        navItem('plantas/listar.html', 'factory', 'Plantas', 'plantas'),
        navItem('empleados/listar.html', 'person-badge', 'Empleados', 'empleados')
    ])}
            
            ${section('Herramientas', [
        navItem('mapa/index.html', 'map', 'Mapa de Sedes', 'mapa'),
        navItem('reportes/index.html', 'graph-up', 'Reportes', 'reportes'),
        navItem('alertas/index.html', 'bell', 'Alertas', 'alertas')
    ])}
            
            ${isAdmin ? `
            <div class="nav-section"><div class="nav-section-title">Administración</div></div>
            <a href="${base}usuarios/listar.html" class="nav-item"><i class="bi bi-people-fill"></i> Usuarios</a>
            ` : ''}
        </nav>
    `;
}

// Initialize page
function initPage(moduleName) {
    checkAuth();

    // Set user name
    const user = getUser();
    const userNameEl = document.getElementById('userName');
    if (userNameEl && user) {
        userNameEl.textContent = user.nombre || user.username;
    }

    // Highlight current nav
    document.querySelectorAll('.nav-item').forEach(item => {
        const href = item.getAttribute('href');
        if (href && href.includes(moduleName)) {
            item.classList.add('active');
        }
    });

    // Load alert count
    loadAlertCount();
}

async function loadAlertCount() {
    try {
        const result = await api.get('/alertas/count');
        const badge = document.getElementById('alertCount');
        if (badge && result.success) {
            const count = (result.data.vencidos || 0) + (result.data.criticos || 0);
            badge.textContent = count;
            if (count === 0) badge.style.display = 'none';
        }
    } catch (err) { }
}

// Toggle sidebar
function toggleSidebar() {
    document.getElementById('sidebar').classList.toggle('show');
}

// Confirm delete
function confirmDelete(message = '¿Está seguro de eliminar este registro?') {
    return confirm(message);
}

// Get URL params
function getUrlParam(param) {
    const params = new URLSearchParams(window.location.search);
    return params.get(param);
}

// Populate select
async function populateSelect(selectId, endpoint, valueField, textField, selectedValue = null) {
    const select = document.getElementById(selectId);
    if (!select) return;

    try {
        const result = await api.get(endpoint);
        if (result.success) {
            select.innerHTML = '<option value="">Seleccione...</option>' +
                result.data.map(item => `<option value="${item[valueField]}" ${item[valueField] == selectedValue ? 'selected' : ''}>${item[textField]}</option>`).join('');
        }
    } catch (err) {
        console.error('Error loading select:', err);
    }
}
