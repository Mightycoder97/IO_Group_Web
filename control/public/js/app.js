/**
 * IO Group - Main Application JS
 * Optimized with memoization and global utilities
 */

// Global debounce utility - reusable across pages
function debounce(fn, ms = 300) {
    let timer;
    return function (...args) {
        clearTimeout(timer);
        timer = setTimeout(() => fn.apply(this, args), ms);
    };
}

// Global throttle utility - for scroll/resize events
function throttle(fn, ms = 100) {
    let lastCall = 0;
    return function (...args) {
        const now = Date.now();
        if (now - lastCall >= ms) {
            lastCall = now;
            fn.apply(this, args);
        }
    };
}

// Sidebar template with permission filtering and memoization
const SIDEBAR_COLLAPSED_KEY = 'io.sidebarCollapsed';
const SIDEBAR_DESKTOP_QUERY = '(min-width: 993px)';

const SIDEBAR_SECTIONS = [
    {
        id: 'dashboard',
        title: 'Dashboard',
        icon: 'speedometer2',
        items: [
            { href: 'dashboard.html', icon: 'speedometer2', label: 'Dashboard', modulo: 'dashboard' }
        ]
    },
    {
        id: 'clientes',
        title: 'Clientes',
        icon: 'people',
        items: [
            { href: 'clientes/listar.html', icon: 'people', label: 'Clientes', modulo: 'clientes' },
            { href: 'empresas/listar.html', icon: 'building', label: 'Empresas', modulo: 'empresas' },
            { href: 'sedes/listar.html', icon: 'geo-alt', label: 'Sedes', modulo: 'sedes' },
            { href: 'contratos/listar.html', icon: 'file-earmark-text', label: 'Contratos', modulo: 'contratos' },
            { href: 'prospectos/listar.html', icon: 'person-hearts', label: 'Prospectos', modulo: 'prospectos' },
            { href: 'altas/index.html', icon: 'person-plus', label: 'Nuevas Altas', modulo: 'sedes' }
        ]
    },
    {
        id: 'logistico',
        title: 'Log&iacute;stico',
        icon: 'truck',
        items: [
            { href: 'calendario/index.html', icon: 'calendar3', label: 'Calendario', modulo: 'rutas' },
            { href: 'rutas/listar.html', icon: 'truck', label: 'Asignar Rutas', modulo: 'rutas' },
            { href: 'rutas/historial.html', icon: 'clock-history', label: 'Historial Rutas', modulo: 'rutas' },
            { href: 'rutas/control.html', icon: 'clipboard2-check-fill', label: 'Control de Ruta', modulo: 'rutas' },
            { href: 'servicios/listar.html', icon: 'tools', label: 'Servicios', modulo: 'rutas' },
            { href: 'manifiestos/listar.html', icon: 'journal-text', label: 'Manifiestos', modulo: 'manifiestos' },
            { href: 'guias/listar.html', icon: 'file-earmark-arrow-up', label: 'Gu&iacute;as', modulo: 'guias' },

        ]
    },
    {
        id: 'financiero',
        title: 'Financiero',
        icon: 'cash-stack',
        items: [
            { href: 'ingresos/index.html', icon: 'cash-stack', label: 'Ingresos', modulo: 'ingresos' },
            { href: 'egresos/index.html', icon: 'wallet2', label: 'Egresos', modulo: 'egresos' },
            { href: 'facturas/listar.html', icon: 'receipt', label: 'Facturas', modulo: 'facturas' },
            { href: 'cobranza/index.html', icon: 'cash-coin', label: 'Cobranza', modulo: 'cobranza' }
        ]
    },
    {
        id: 'configuracion',
        title: 'Configuraci&oacute;n',
        icon: 'sliders',
        items: [
            { href: 'vehiculos/listar.html', icon: 'truck', label: 'Veh&iacute;culos', modulo: 'vehiculos' },
            { href: 'plantas/listar.html', icon: 'factory', label: 'Plantas', modulo: 'plantas' },
            { href: 'empleados/listar.html', icon: 'person-badge', label: 'Empleados', modulo: 'empleados' }
        ]
    },
    {
        id: 'herramientas',
        title: 'Herramientas',
        icon: 'wrench-adjustable',
        items: [
            { href: 'mapa/index.html', icon: 'map', label: 'Mapa de Sedes', modulo: 'mapa' },
            { href: 'reportes/index.html', icon: 'graph-up', label: 'Reportes', modulo: 'reportes' },
            { href: 'alertas/index.html', icon: 'bell', label: 'Alertas', modulo: 'alertas' }
        ]
    },
    {
        id: 'administracion',
        title: 'Administraci&oacute;n',
        icon: 'shield-lock',
        adminOnly: true,
        items: [
            { href: 'usuarios/listar.html', icon: 'people-fill', label: 'Usuarios', modulo: 'usuarios' }
        ]
    }
];

let _sidebarCache = { html: null, userId: null, role: null, permisosKey: null };
let _sidebarResizeBound = false;
let _controlPageInitialized = false;

function isDesktopSidebar() {
    return window.matchMedia(SIDEBAR_DESKTOP_QUERY).matches;
}

function getStoredSidebarCollapsed() {
    try {
        return localStorage.getItem(SIDEBAR_COLLAPSED_KEY) === 'true';
    } catch (err) {
        return false;
    }
}

function setStoredSidebarCollapsed(collapsed) {
    try {
        localStorage.setItem(SIDEBAR_COLLAPSED_KEY, collapsed ? 'true' : 'false');
    } catch (err) { }
}

function setSidebarCollapsed(collapsed, persist = true) {
    document.body.classList.toggle('sidebar-collapsed', collapsed && isDesktopSidebar());
    if (persist) {
        setStoredSidebarCollapsed(collapsed);
    }
}

function applySidebarCollapsedState() {
    if (!isDesktopSidebar()) {
        document.body.classList.remove('sidebar-collapsed');
        return;
    }

    document.body.classList.add('sidebar-collapsed');
}

function getSidebarMatchPath(pathname = window.location.pathname) {
    let path = pathname.replace(/\\/g, '/').replace(/\/+$/, '');
    const pagesIndex = path.toLowerCase().lastIndexOf('/pages/');
    if (pagesIndex >= 0) {
        path = path.slice(pagesIndex + '/pages/'.length);
    } else {
        path = path.split('/').filter(Boolean).slice(-2).join('/');
    }

    return path.replace(/\.html$/i, '').replace(/^\/+|\/+$/g, '').toLowerCase();
}

function getSidebarItemRoot(matchPath) {
    return matchPath.split('/')[0] || matchPath;
}

function inferControlModuleFromPath(pathname = window.location.pathname) {
    const root = getSidebarItemRoot(getSidebarMatchPath(pathname));
    const moduleByRoot = {
        altas: 'sedes',
        calendario: 'rutas',
        servicios: 'rutas'
    };

    return moduleByRoot[root] || root || 'dashboard';
}

function getSidebarHTML() {
    const user = getUser();
    const userId = user?.id_usuario || null;
    const role = user?.rol || null;
    const permisosKey = JSON.stringify(user?.permisos || {});

    // Return cached version if user hasn't changed
    if (_sidebarCache.html && _sidebarCache.userId === userId && _sidebarCache.role === role && _sidebarCache.permisosKey === permisosKey) {
        return _sidebarCache.html;
    }

    const isAdmin = user?.rol === 'admin';
    const base = getBasePath() + '/pages/';
    const canView = (modulo) => isAdmin || user?.permisos?.[modulo]?.ver === true;

    const sectionHTML = SIDEBAR_SECTIONS.map(section => {
        if (section.adminOnly && !isAdmin) return '';

        const visibleItems = section.items.filter(item => canView(item.modulo));
        if (visibleItems.length === 0) return '';

        const panelId = `sidebar-panel-${section.id}`;
        const links = visibleItems.map(item => {
            const match = getSidebarMatchPath(item.href);
            const root = getSidebarItemRoot(match);
            return `
                <a href="${base}${item.href}" class="sidebar-link" data-section="${section.id}" data-match="${match}" data-root="${root}" title="${item.label}">
                    <i class="bi bi-${item.icon}" aria-hidden="true"></i>
                    <span class="sidebar-link-label">${item.label}</span>
                </a>
            `;
        }).join('');

        return `
            <div class="sidebar-section" data-section-id="${section.id}">
                <button class="sidebar-section-toggle" type="button" aria-expanded="false" aria-controls="${panelId}" title="${section.title}">
                    <i class="bi bi-${section.icon} sidebar-section-icon" aria-hidden="true"></i>
                    <span class="sidebar-section-label">${section.title}</span>
                    <i class="bi bi-chevron-down sidebar-section-chevron" aria-hidden="true"></i>
                </button>
                <div class="sidebar-section-panel" id="${panelId}">
                    ${links}
                </div>
            </div>
        `;
    }).join('');

    const html = `
        <div class="sidebar-brand">
            <i class="bi bi-recycle sidebar-brand-icon" aria-hidden="true"></i>
            <h2 class="sidebar-brand-title">IO Control</h2>
        </div>
        <nav class="sidebar-nav" aria-label="Menu principal">
            ${sectionHTML}
        </nav>
    `;

    _sidebarCache = { html, userId, role, permisosKey };
    return html;
}

function findActiveSidebarLink() {
    const currentPath = getSidebarMatchPath();
    const currentRoot = getSidebarItemRoot(currentPath);
    let exactMatch = null;
    let exactLength = 0;
    let rootMatch = null;

    document.querySelectorAll('.sidebar-link').forEach(link => {
        const matchPath = link.dataset.match || '';
        if (currentPath === matchPath || currentPath.endsWith(`/${matchPath}`)) {
            if (matchPath.length > exactLength) {
                exactMatch = link;
                exactLength = matchPath.length;
            }
        }

        if (!rootMatch && link.dataset.root === currentRoot) {
            rootMatch = link;
        }
    });

    return exactMatch || rootMatch;
}

function updateSidebarActiveState() {
    const sidebar = document.getElementById('sidebar');
    if (!sidebar) return;

    sidebar.querySelectorAll('.sidebar-link').forEach(link => link.classList.remove('active'));
    sidebar.querySelectorAll('.sidebar-section').forEach(section => {
        section.classList.remove('sidebar-section-active', 'sidebar-section-open');
        const button = section.querySelector('.sidebar-section-toggle');
        if (button) button.setAttribute('aria-expanded', 'false');
    });

    const activeLink = findActiveSidebarLink();
    if (!activeLink) return;

    activeLink.classList.add('active');
    const activeSection = activeLink.closest('.sidebar-section');
    if (!activeSection) return;

    activeSection.classList.add('sidebar-section-active', 'sidebar-section-open');
    const button = activeSection.querySelector('.sidebar-section-toggle');
    if (button) button.setAttribute('aria-expanded', 'true');
}

function openSidebarSection(section) {
    const sidebar = document.getElementById('sidebar');
    if (!sidebar || !section) return;

    sidebar.querySelectorAll('.sidebar-section').forEach(item => {
        const isCurrent = item === section;
        item.classList.toggle('sidebar-section-open', isCurrent);
        const button = item.querySelector('.sidebar-section-toggle');
        if (button) button.setAttribute('aria-expanded', isCurrent ? 'true' : 'false');
    });
}

function setupSidebarInteractions() {
    const sidebar = document.getElementById('sidebar');
    if (!sidebar || sidebar.dataset.interactionsBound === 'true') return;

    sidebar.dataset.interactionsBound = 'true';
    sidebar.addEventListener('click', event => {
        const toggle = event.target.closest('.sidebar-section-toggle');
        if (toggle) {
            const section = toggle.closest('.sidebar-section');
            const isOpen = section?.classList.contains('sidebar-section-open');

            if (section) {
                if (isOpen) {
                    section.classList.remove('sidebar-section-open');
                    toggle.setAttribute('aria-expanded', 'false');
                } else {
                    openSidebarSection(section);
                }
            }
            return;
        }

        const link = event.target.closest('.sidebar-link');
        if (link && isDesktopSidebar()) {
            setSidebarCollapsed(true);
        }
    });

    if (!_sidebarResizeBound) {
        _sidebarResizeBound = true;
        window.addEventListener('resize', throttle(applySidebarCollapsedState, 150));
    }
}

function ensureSidebarRendered() {
    const sidebar = document.getElementById('sidebar');
    if (!sidebar) return null;

    if (!sidebar.querySelector('.sidebar-section')) {
        sidebar.innerHTML = getSidebarHTML();
    }

    return sidebar;
}

function bootControlPage(moduleName = inferControlModuleFromPath()) {
    ensureSidebarRendered();
    initPage(moduleName);
}

// Initialize page
function initPage(moduleName = inferControlModuleFromPath()) {
    if (_controlPageInitialized) return;
    _controlPageInitialized = true;

    checkAuth();

    ensureSidebarRendered();

    // Set user name
    const user = getUser();
    const userNameEl = document.getElementById('userName');
    if (userNameEl && user) {
        userNameEl.textContent = user.nombre || user.username;
    }

    setupSidebarInteractions();
    updateSidebarActiveState();
    applySidebarCollapsedState();

    // Initialize password change modal
    initPasswordModal();

    // Load alert count
    loadAlertCount();

    // Keep list/detail/map pages fresh without a manual browser refresh.
    startRealtimeSync(moduleName);
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

// Lightweight realtime sync via polling. Shared hosting usually cannot keep
// WebSocket/SSE workers alive reliably, so this asks for a cheap DB version hash.
const REALTIME_SYNC_INTERVAL_MS = 10000;
const REALTIME_SCOPE_BY_MODULE = {
    dashboard: 'dashboard',
    mapa: 'mapa',
    clientes: 'clientes',
    empresas: 'empresas',
    sedes: 'sedes',
    contratos: 'contratos',
    rutas: 'rutas',
    calendario: 'calendario',
    servicios: 'servicios',
    facturas: 'facturas',
    guias: 'guias',
    manifiestos: 'manifiestos',
    cobranza: 'cobranza',
    ingresos: 'ingresos',
    egresos: 'egresos',
    prospectos: 'prospectos',
    altas: 'altas',
    alertas: 'alertas',
    reportes: 'reportes',
    empleados: 'empleados',
    vehiculos: 'vehiculos',
    plantas: 'plantas',
    usuarios: 'usuarios'
};

let _realtimeSync = {
    timer: null,
    lastVersion: null,
    inFlight: false,
    scope: null
};

function startRealtimeSync(moduleName, options = {}) {
    stopRealtimeSync();

    if (typeof api === 'undefined' || !api.getToken || !api.getToken()) return;

    const path = window.location.pathname.toLowerCase();
    const isFormPage = path.includes('/formulario.html');
    if (options.enabled === false || (isFormPage && options.allowForms !== true)) {
        return;
    }

    _realtimeSync.scope = options.scope || REALTIME_SCOPE_BY_MODULE[moduleName] || 'all';
    _realtimeSync.lastVersion = null;
    const interval = options.interval || REALTIME_SYNC_INTERVAL_MS;

    const tick = async () => {
        if (_realtimeSync.inFlight || document.hidden) return;
        _realtimeSync.inFlight = true;

        try {
            const result = await api.get(`/realtime?scope=${encodeURIComponent(_realtimeSync.scope)}`, { cache: false });
            const payload = result?.data;
            if (!result?.success || !payload?.version) return;

            if (_realtimeSync.lastVersion === null) {
                _realtimeSync.lastVersion = payload.version;
                return;
            }

            if (_realtimeSync.lastVersion !== payload.version) {
                _realtimeSync.lastVersion = payload.version;
                await handleRealtimeUpdate(payload, moduleName);
            }
        } catch (err) {
            console.warn('Realtime sync failed:', err);
        } finally {
            _realtimeSync.inFlight = false;
        }
    };

    tick();
    _realtimeSync.timer = setInterval(tick, interval);
}

function stopRealtimeSync() {
    if (_realtimeSync.timer) {
        clearInterval(_realtimeSync.timer);
    }
    _realtimeSync.timer = null;
    _realtimeSync.inFlight = false;
}

async function handleRealtimeUpdate(payload, moduleName) {
    if (typeof api !== 'undefined' && typeof api.clearCache === 'function') {
        api.clearCache();
    }

    window.dispatchEvent(new CustomEvent('io:db-change', { detail: payload }));

    if (typeof window.onRealtimeDataChange === 'function') {
        await window.onRealtimeDataChange(payload);
        return;
    }

    if (moduleName === 'mapa' && window.mapController && typeof window.mapController.loadSedes === 'function') {
        await window.mapController.loadSedes();
        return;
    }

    if (typeof window.loadData === 'function') {
        await window.loadData();
    }
}

window.startRealtimeSync = startRealtimeSync;
window.stopRealtimeSync = stopRealtimeSync;
window.bootControlPage = bootControlPage;

// Toggle sidebar
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    if (!sidebar) return;

    if (!isDesktopSidebar()) {
        sidebar.classList.toggle('show');
        return;
    }
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

// Get user menu HTML with change password option
function getUserMenuHTML() {
    const user = getUser();
    return `
        <a href="#" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#changePasswordModal">
            <i class="bi bi-key"></i> Cambiar Contraseña
        </a>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#" onclick="logout()"><i class="bi bi-box-arrow-right"></i> Cerrar Sesión</a></li>
    `;
}

// Get password modal HTML
function getPasswordModalHTML() {
    return `
        <div class="modal fade" id="changePasswordModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="bi bi-key"></i> Cambiar Contraseña</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <form id="changePasswordForm">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Contraseña Actual <span class="text-danger">*</span></label>
                                <input type="password" class="form-control" id="currentPassword" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nueva Contraseña <span class="text-danger">*</span></label>
                                <input type="password" class="form-control" id="newPassword" required minlength="6">
                                <small class="text-muted">Mínimo 6 caracteres</small>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Confirmar Nueva Contraseña <span class="text-danger">*</span></label>
                                <input type="password" class="form-control" id="confirmPassword" required minlength="6">
                            </div>
                            <div id="passwordError" class="alert alert-danger d-none"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary"><i class="bi bi-check-lg"></i> Cambiar Contraseña</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    `;
}

// Initialize password modal
function initPasswordModal() {
    // Add modal to body if not exists
    if (!document.getElementById('changePasswordModal')) {
        document.body.insertAdjacentHTML('beforeend', getPasswordModalHTML());

        // Handle form submit
        document.getElementById('changePasswordForm').addEventListener('submit', async function (e) {
            e.preventDefault();

            const currentPassword = document.getElementById('currentPassword').value;
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const errorDiv = document.getElementById('passwordError');

            // Validate passwords match
            if (newPassword !== confirmPassword) {
                errorDiv.textContent = 'Las contraseñas no coinciden';
                errorDiv.classList.remove('d-none');
                return;
            }

            // Hide error
            errorDiv.classList.add('d-none');

            try {
                const result = await api.put('/auth?action=change-password', {
                    currentPassword,
                    newPassword
                });

                if (result.success) {
                    showToast('Contraseña actualizada exitosamente', 'success');
                    // Close modal
                    bootstrap.Modal.getInstance(document.getElementById('changePasswordModal')).hide();
                    // Clear form
                    document.getElementById('changePasswordForm').reset();
                } else {
                    errorDiv.textContent = result.message || 'Error al cambiar contraseña';
                    errorDiv.classList.remove('d-none');
                }
            } catch (err) {
                errorDiv.textContent = 'Error al cambiar contraseña';
                errorDiv.classList.remove('d-none');
            }
        });
    }
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

/**
 * Global TableSorter Utility
 * Reusable sorting functionality for any data table
 * 
 * Usage:
 * const sorter = new TableSorter({
 *     data: myDataArray,
 *     defaultSort: { column: 'fecha', direction: 'desc' },
 *     columns: {
 *         'fecha': { type: 'date', field: 'fecha_servicio' },
 *         'nombre': { type: 'string', field: 'nombre' },
 *         'monto': { type: 'number', field: 'tarifa' }
 *     },
 *     onSort: (sortedData) => renderTable(sortedData)
 * });
 * sorter.init();
 */
class TableSorter {
    constructor(options) {
        this.data = options.data || [];
        this.currentSort = options.defaultSort || { column: null, direction: 'asc' };
        this.columns = options.columns || {};
        this.onSort = options.onSort || (() => { });
        this.tableSelector = options.tableSelector || 'table';
    }

    init() {
        this.bindHeaders();
        if (this.currentSort.column) {
            this.updateHeaderStyles();
        }
    }

    setData(data) {
        this.data = data;
    }

    bindHeaders() {
        const headers = document.querySelectorAll(`${this.tableSelector} th.sortable`);
        headers.forEach(header => {
            header.onclick = () => this.sortColumn(header.dataset.sort);
        });
    }

    sortColumn(column) {
        if (!column) return;

        if (this.currentSort.column === column) {
            this.currentSort.direction = this.currentSort.direction === 'asc' ? 'desc' : 'asc';
        } else {
            this.currentSort.column = column;
            const colConfig = this.columns[column];
            this.currentSort.direction = (colConfig?.type === 'string') ? 'asc' : 'desc';
        }

        this.updateHeaderStyles();
        const sortedData = this.getSortedData();
        this.onSort(sortedData);
    }

    updateHeaderStyles() {
        const headers = document.querySelectorAll(`${this.tableSelector} th.sortable`);
        headers.forEach(h => {
            h.classList.remove('active', 'asc', 'desc');
            if (h.dataset.sort === this.currentSort.column) {
                h.classList.add('active', this.currentSort.direction);
            }
        });
    }

    getSortedData() {
        if (!this.currentSort.column) return [...this.data];

        const column = this.currentSort.column;
        const direction = this.currentSort.direction;
        const colConfig = this.columns[column] || {};
        const field = colConfig.field || column;
        const type = colConfig.type || 'string';

        return [...this.data].sort((a, b) => {
            let valA = a[field];
            let valB = b[field];

            // Handle nulls
            if (valA === null || valA === undefined) valA = type === 'number' ? 0 : '';
            if (valB === null || valB === undefined) valB = type === 'number' ? 0 : '';

            let comparison = 0;

            if (type === 'date') {
                valA = valA ? new Date(valA) : new Date(0);
                valB = valB ? new Date(valB) : new Date(0);
                comparison = valA - valB;
            } else if (type === 'number') {
                comparison = parseFloat(valA) - parseFloat(valB);
            } else {
                comparison = String(valA).toLowerCase().localeCompare(String(valB).toLowerCase());
            }

            return direction === 'desc' ? -comparison : comparison;
        });
    }
}

// Export for global use
window.TableSorter = TableSorter;
