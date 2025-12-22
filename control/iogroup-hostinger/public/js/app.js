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

// Sidebar template for all pages
function getSidebarHTML() {
    return `
        <div class="sidebar-header">
            <i class="bi bi-recycle" style="font-size: 2rem;"></i>
            <h2>IO Group</h2>
        </div>
        <nav class="sidebar-nav">
            <a href="../dashboard.html" class="nav-item"><i class="bi bi-speedometer2"></i> Dashboard</a>
            
            <div class="nav-section"><div class="nav-section-title">Clientes</div></div>
            <a href="../clientes/listar.html" class="nav-item"><i class="bi bi-people"></i> Clientes</a>
            <a href="../empresas/listar.html" class="nav-item"><i class="bi bi-building"></i> Empresas</a>
            <a href="../sedes/listar.html" class="nav-item"><i class="bi bi-geo-alt"></i> Sedes</a>
            <a href="../contratos/listar.html" class="nav-item"><i class="bi bi-file-earmark-text"></i> Contratos</a>
            
            <div class="nav-section"><div class="nav-section-title">Personal</div></div>
            <a href="../empleados/listar.html" class="nav-item"><i class="bi bi-person-badge"></i> Empleados</a>
            <a href="../vehiculos/listar.html" class="nav-item"><i class="bi bi-truck"></i> Vehículos</a>
            <a href="../plantas/listar.html" class="nav-item"><i class="bi bi-hospital"></i> Plantas</a>
            
            <div class="nav-section"><div class="nav-section-title">Operaciones</div></div>
            <a href="../rutas/listar.html" class="nav-item"><i class="bi bi-signpost-2"></i> Rutas</a>
            <a href="../servicios/listar.html" class="nav-item"><i class="bi bi-box-seam"></i> Servicios</a>
            <a href="../manifiestos/listar.html" class="nav-item"><i class="bi bi-journal-text"></i> Manifiestos</a>
            <a href="../guias/listar.html" class="nav-item"><i class="bi bi-file-earmark"></i> Guías</a>
            <a href="../facturas/listar.html" class="nav-item"><i class="bi bi-receipt"></i> Facturas</a>
            
            <div class="nav-section"><div class="nav-section-title">Reportes</div></div>
            <a href="../reportes/index.html" class="nav-item"><i class="bi bi-graph-up"></i> Reportes</a>
            <a href="../alertas/index.html" class="nav-item"><i class="bi bi-bell"></i> Alertas</a>
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
