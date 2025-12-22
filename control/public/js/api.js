/**
 * IO Group - API Client
 * Updated for PHP backend
 */

// Detect base path for API
const getApiBase = () => {
    const path = window.location.pathname;
    if (path.includes('/control/')) {
        return '/control/api';
    }
    return '/api';
};

const API_BASE = getApiBase();

const api = {
    getToken() {
        return localStorage.getItem('token');
    },

    getHeaders() {
        const headers = { 'Content-Type': 'application/json' };
        const token = this.getToken();
        if (token) headers['Authorization'] = `Bearer ${token}`;
        return headers;
    },

    /**
     * Build PHP-compatible URL
     * Converts /entity/123 to /entity.php?id=123
     * Converts /entity?action=stats to /entity.php?action=stats
     */
    buildUrl(endpoint) {
        // Parse the endpoint
        let [path, queryString] = endpoint.split('?');
        const parts = path.split('/').filter(p => p);

        if (parts.length === 0) return API_BASE;

        const entity = parts[0];
        const id = parts[1];

        // Build base URL with .php extension
        let url = `${API_BASE}/${entity}.php`;

        // Build query parameters
        const params = new URLSearchParams(queryString || '');

        // Add ID if present
        if (id && !isNaN(id)) {
            params.set('id', id);
        } else if (id) {
            // It's an action like /auth/login
            params.set('action', id);
        }

        const queryStr = params.toString();
        return queryStr ? `${url}?${queryStr}` : url;
    },

    async request(method, endpoint, data = null) {
        const url = this.buildUrl(endpoint);
        const options = {
            method,
            headers: this.getHeaders()
        };

        if (data && (method === 'POST' || method === 'PUT')) {
            options.body = JSON.stringify(data);
        }

        const response = await fetch(url, options);

        if (response.status === 401) {
            localStorage.removeItem('token');
            localStorage.removeItem('user');
            window.location.href = getBasePath() + '/pages/login.html';
            return;
        }

        return response.json();
    },

    get(endpoint) { return this.request('GET', endpoint); },
    post(endpoint, data) { return this.request('POST', endpoint, data); },
    put(endpoint, data) { return this.request('PUT', endpoint, data); },
    delete(endpoint) { return this.request('DELETE', endpoint); }
};

// Get base path helper
function getBasePath() {
    const path = window.location.pathname;
    if (path.includes('/control/')) {
        return '/control';
    }
    return '';
}

// Auth helpers
function checkAuth() {
    if (!localStorage.getItem('token')) {
        window.location.href = getBasePath() + '/pages/login.html';
        return false;
    }
    return true;
}

function getUser() {
    const user = localStorage.getItem('user');
    return user ? JSON.parse(user) : null;
}

function logout() {
    api.post('/auth/logout').catch(() => { });
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    window.location.href = getBasePath() + '/pages/login.html';
}

function hasRole(...roles) {
    const user = getUser();
    if (!user) return false;
    if (user.rol === 'admin') return true;
    return roles.includes(user.rol);
}

function canEdit() {
    return hasRole('admin', 'editor');
}

// UI Helpers
function showToast(message, type = 'success') {
    const container = document.querySelector('.toast-container') || createToastContainer();
    const toast = document.createElement('div');
    toast.className = `toast show align-items-center text-white bg-${type} border-0`;
    toast.innerHTML = `
        <div class="d-flex">
            <div class="toast-body">${message}</div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    `;
    container.appendChild(toast);
    setTimeout(() => toast.remove(), 5000);
}

function createToastContainer() {
    const container = document.createElement('div');
    container.className = 'toast-container';
    document.body.appendChild(container);
    return container;
}

function showLoading() {
    if (!document.querySelector('.loading-overlay')) {
        const overlay = document.createElement('div');
        overlay.className = 'loading-overlay';
        overlay.innerHTML = '<div class="spinner-grow"></div>';
        document.body.appendChild(overlay);
    }
}

function hideLoading() {
    const overlay = document.querySelector('.loading-overlay');
    if (overlay) overlay.remove();
}

function formatDate(date) {
    if (!date) return '-';
    return new Date(date).toLocaleDateString('es-PE');
}

function formatCurrency(amount) {
    if (!amount) return 'S/ 0.00';
    return `S/ ${parseFloat(amount).toFixed(2)}`;
}

function formatStatus(status) {
    const labels = {
        programado: 'Programado',
        en_curso: 'En Curso',
        completado: 'Completado',
        cancelado: 'Cancelado',
        emitida: 'Emitida',
        pagada: 'Pagada',
        anulada: 'Anulada',
        vencido: 'Vencido',
        critico: 'Crítico',
        advertencia: 'Advertencia',
        ok: 'OK'
    };
    return labels[status?.toLowerCase()] || status;
}

function getStatusBadge(status) {
    const normalized = status?.toLowerCase().replace(' ', '_');
    return `<span class="badge-status badge-${normalized}">${formatStatus(status)}</span>`;
}
