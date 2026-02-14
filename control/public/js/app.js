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

// Sidebar template with permission filtering and memoization
let _sidebarCache = { html: null, userId: null };

function getSidebarHTML() {
    const user = getUser();
    const userId = user?.id_usuario || null;

    // Return cached version if user hasn't changed
    if (_sidebarCache.html && _sidebarCache.userId === userId) {
        return _sidebarCache.html;
    }

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

    const html = `
        <div class="sidebar-brand">
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


    ])}
            
            ${section('Financiero', [
        navItem('ingresos/index.html', 'cash-stack', 'Ingresos', 'ingresos'),
        navItem('egresos/index.html', 'wallet2', 'Egresos', 'egresos'),
        navItem('facturas/listar.html', 'receipt', 'Facturas', 'facturas'),
        navItem('cobranza/index.html', 'cash-coin', 'Cobranza', 'cobranza')
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

    // Cache the result
    _sidebarCache = { html: html, userId };
    return html;
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

    // Initialize password change modal
    initPasswordModal();

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
