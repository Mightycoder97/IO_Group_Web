/**
 * IO Group - API Client
 * Optimized with caching, abort handling, and request deduplication
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

// Simple cache for GET requests
const _apiCache = new Map();
const _pendingRequests = new Map();
const CACHE_TTL = 30000; // 30 seconds

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
        let [path, queryString] = endpoint.split('?');
        const parts = path.split('/').filter(p => p);

        if (parts.length === 0) return API_BASE;

        const entity = parts[0];
        const id = parts[1];
        let url = `${API_BASE}/${entity}.php`;
        const params = new URLSearchParams(queryString || '');

        if (id && !isNaN(id)) {
            params.set('id', id);
        } else if (id) {
            params.set('action', id);
        }

        const queryStr = params.toString();
        return queryStr ? `${url}?${queryStr}` : url;
    },

    /**
     * Clear cache for a specific endpoint or all cache
     */
    clearCache(endpoint = null) {
        if (endpoint) {
            const url = this.buildUrl(endpoint);
            _apiCache.delete(url);
        } else {
            _apiCache.clear();
        }
    },

    async request(method, endpoint, data = null, options = {}) {
        const url = this.buildUrl(endpoint);
        const cacheKey = `${method}:${url}`;
        const { cache = method === 'GET', signal } = options;

        // Check cache for GET requests
        if (cache && method === 'GET') {
            const cached = _apiCache.get(cacheKey);
            if (cached && Date.now() - cached.timestamp < CACHE_TTL) {
                return cached.data;
            }
        }

        // Deduplicate concurrent identical GET requests
        if (method === 'GET' && _pendingRequests.has(cacheKey)) {
            return _pendingRequests.get(cacheKey);
        }

        const fetchOptions = {
            method,
            headers: this.getHeaders()
        };

        if (signal) fetchOptions.signal = signal;
        if (data && (method === 'POST' || method === 'PUT')) {
            fetchOptions.body = JSON.stringify(data);
        }

        const requestPromise = (async () => {
            try {
                const response = await fetch(url, fetchOptions);

                if (response.status === 401) {
                    localStorage.removeItem('token');
                    localStorage.removeItem('user');
                    window.location.href = getBasePath() + '/pages/login.html';
                    return { success: false, message: 'Sesión expirada' };
                }

                const result = await response.json();

                // Cache successful GET responses
                if (cache && method === 'GET' && result.success !== false) {
                    _apiCache.set(cacheKey, { data: result, timestamp: Date.now() });
                }

                // Invalidate related cache on mutations
                if (method !== 'GET') {
                    const entity = endpoint.split('/')[1]?.split('?')[0];
                    if (entity) {
                        for (const key of _apiCache.keys()) {
                            if (key.includes(entity)) _apiCache.delete(key);
                        }
                    }
                }

                return result;
            } finally {
                _pendingRequests.delete(cacheKey);
            }
        })();

        if (method === 'GET') {
            _pendingRequests.set(cacheKey, requestPromise);
        }

        return requestPromise;
    },

    get(endpoint, options) { return this.request('GET', endpoint, null, options); },
    post(endpoint, data) { return this.request('POST', endpoint, data); },
    put(endpoint, data) { return this.request('PUT', endpoint, data); },
    delete(endpoint) { return this.request('DELETE', endpoint); }
};

// Get base path helper (works for both server and local file access)
function getBasePath() {
    const path = window.location.pathname;
    const isLocal = window.location.protocol === 'file:';

    if (isLocal) {
        // For local file access, find the path up to /control/public
        const match = path.match(/^(.*\/control\/public)/);
        if (match) {
            return match[1];
        }
    }

    // For server access
    if (path.includes('/control/')) {
        return '/control/public';
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

/**
 * Check if user can view specific module
 */
function canViewModule(modulo) {
    const user = getUser();
    if (!user) return false;
    if (user.rol === 'admin') return true;
    if (!user.permisos) return false;
    return user.permisos[modulo]?.ver === true;
}

/**
 * Check if user can edit specific module
 */
function canEditModule(modulo) {
    const user = getUser();
    if (!user) return false;
    if (user.rol === 'admin') return true;
    if (!user.permisos) return false;
    return user.permisos[modulo]?.editar === true;
}

/**
 * Get list of modules user can view
 */
function getAllowedModules() {
    const user = getUser();
    if (!user) return [];
    if (user.rol === 'admin') return null; // null = all modules
    if (!user.permisos) return [];
    return Object.entries(user.permisos)
        .filter(([_, perm]) => perm.ver)
        .map(([modulo, _]) => modulo);
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
    container.style.cssText = 'position:fixed;top:1rem;right:1rem;z-index:9999;display:flex;flex-direction:column;gap:0.5rem;min-width:280px;max-width:380px;';
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
