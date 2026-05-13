/**
 * Lightweight route assignment map.
 * Keeps route planning fast by rendering only the filtered operational set.
 */
class RouteAssignmentMap {
    constructor(options = {}) {
        this.options = options;
        this.map = null;
        this.infoWindow = null;
        this.markersById = new Map();
        this.iconCache = new Map();
        this.lastVisibleIds = new Set();
        this.pendingFrame = null;
        this.hasFit = false;
        this.maxMarkers = options.maxMarkers || 420;
        this.defaultCenter = { lat: -12.0464, lng: -77.0428 };
    }

    async init(container) {
        this.container = container;
        if (!container) return;

        try {
            await RouteAssignmentMap.loadGoogleMaps();
        } catch (error) {
            this.setStatus(error.message || 'Mapa no disponible');
            return;
        }

        this.map = new google.maps.Map(container, {
            center: this.defaultCenter,
            zoom: 11,
            disableDefaultUI: true,
            clickableIcons: false,
            gestureHandling: 'greedy',
            keyboardShortcuts: false,
            restriction: {
                latLngBounds: {
                    north: -10.1,
                    south: -15.6,
                    west: -78.2,
                    east: -74.4
                },
                strictBounds: false
            }
        });
        this.infoWindow = new google.maps.InfoWindow();
        this.setStatus('');
    }

    static loadGoogleMaps() {
        if (window.google?.maps) return Promise.resolve();
        if (window.__routeAssignmentMapsLoading) return window.__routeAssignmentMapsLoading;

        const key = window.API_CONFIG?.GOOGLE_MAPS_API_KEY;
        if (!key || key.includes('YOUR_GOOGLE_MAPS_API_KEY')) {
            return Promise.reject(new Error('Configura Google Maps para activar el mapa'));
        }

        window.__routeAssignmentMapsLoading = new Promise((resolve, reject) => {
            window.__routeAssignmentMapsReady = () => resolve();
            const script = document.createElement('script');
            script.src = `https://maps.googleapis.com/maps/api/js?key=${encodeURIComponent(key)}&callback=__routeAssignmentMapsReady&v=weekly&language=es&region=PE`;
            script.async = true;
            script.defer = true;
            script.onerror = () => reject(new Error('No se pudo cargar Google Maps'));
            document.head.appendChild(script);
        });

        return window.__routeAssignmentMapsLoading;
    }

    render(sedes = [], context = {}) {
        this.lastRender = { sedes, context };
        if (!this.map) {
            const count = sedes.filter(s => this.parsePosition(s.coordenadas_gps)).length;
            this.setStatus(count ? `${count} sedes con GPS listas` : 'Sin sedes con GPS en el filtro');
            return;
        }

        if (this.pendingFrame) return;
        this.pendingFrame = requestAnimationFrame(() => {
            this.pendingFrame = null;
            this.renderNow(this.lastRender.sedes, this.lastRender.context);
        });
    }

    renderNow(sedes, context) {
        const selectedId = context.selectedSedeId ? String(context.selectedSedeId) : null;
        const withPosition = [];

        for (const sede of sedes) {
            const position = this.parsePosition(sede.coordenadas_gps);
            if (!position) continue;
            withPosition.push({ sede, position });
        }

        const selectedItem = selectedId
            ? withPosition.find(item => String(item.sede.id_sede) === selectedId)
            : null;
        const visible = withPosition.slice(0, this.maxMarkers);
        if (selectedItem && !visible.some(item => String(item.sede.id_sede) === selectedId)) {
            visible.push(selectedItem);
        }

        const nextIds = new Set();
        for (const item of visible) {
            const id = String(item.sede.id_sede);
            nextIds.add(id);
            const marker = this.getOrCreateMarker(item.sede, item.position);
            marker.setIcon(this.getIcon(this.getStatus(item.sede, context)));
            marker.setTitle(item.sede.nombre_comercial || '');
            if (!this.lastVisibleIds.has(id)) marker.setMap(this.map);
        }

        for (const id of this.lastVisibleIds) {
            if (!nextIds.has(id)) {
                const marker = this.markersById.get(id);
                if (marker) marker.setMap(null);
            }
        }
        this.lastVisibleIds = nextIds;

        const hidden = withPosition.length - visible.length;
        this.setStatus(hidden > 0
            ? `${visible.length} de ${withPosition.length} sedes en mapa; ajusta filtros para ver mas`
            : `${visible.length} sedes en mapa`);

        if (!this.hasFit || context.forceFit || selectedId) {
            this.fitVisible(visible, selectedId);
        }
    }

    getOrCreateMarker(sede, position) {
        const id = String(sede.id_sede);
        if (this.markersById.has(id)) {
            const marker = this.markersById.get(id);
            marker.setPosition(position);
            return marker;
        }

        const marker = new google.maps.Marker({
            position,
            optimized: true,
            clickable: true
        });
        marker.addListener('click', () => {
            if (this.options.onSelect) this.options.onSelect(sede);
            this.openInfo(marker, sede);
        });
        marker.addListener('dblclick', () => {
            if (this.options.onQuickAdd) this.options.onQuickAdd(sede);
        });
        this.markersById.set(id, marker);
        return marker;
    }

    getStatus(sede, context) {
        if (String(context.selectedSedeId || '') === String(sede.id_sede)) return 'selected';
        if (context.statusForSede) return context.statusForSede(sede);
        return 'pending';
    }

    getIcon(status) {
        if (this.iconCache.has(status)) return this.iconCache.get(status);
        const colors = {
            pending: '#2563eb',
            selected: '#f59e0b',
            assignedActive: '#166534',
            assignedOther: '#64748b'
        };
        const icon = {
            path: google.maps.SymbolPath.CIRCLE,
            fillColor: colors[status] || colors.pending,
            fillOpacity: 0.95,
            strokeColor: '#ffffff',
            strokeOpacity: 1,
            strokeWeight: status === 'selected' ? 3 : 1.5,
            scale: status === 'selected' ? 8 : 6
        };
        this.iconCache.set(status, icon);
        return icon;
    }

    openInfo(marker, sede) {
        const action = this.options.actionForSede ? this.options.actionForSede(sede) : null;
        const button = action
            ? `<button class="btn btn-sm ${action.kind === 'reassign' ? 'btn-warning' : 'btn-success'} w-100 mt-2" id="routeMapAction">${this.escapeHtml(action.label)}</button>`
            : '<div class="small text-muted mt-2">Selecciona un camion para asignar</div>';
        const content = `
            <div style="max-width:260px">
                <div class="fw-bold">${this.escapeHtml(sede.nombre_comercial || '-')}</div>
                <div class="small text-muted">${this.escapeHtml(sede.empresa_ruc || '')}</div>
                <div class="small">${this.escapeHtml(sede.distrito || '')}</div>
                <div class="small text-muted">${this.escapeHtml(sede.frecuencia || 'Sin frecuencia')}</div>
                ${button}
            </div>`;

        this.infoWindow.setContent(content);
        this.infoWindow.open(this.map, marker);
        google.maps.event.addListenerOnce(this.infoWindow, 'domready', () => {
            const btn = document.getElementById('routeMapAction');
            if (btn && action?.handler) btn.addEventListener('click', action.handler);
        });
    }

    fitVisible(visible, selectedId = null) {
        if (!visible.length) return;
        if (selectedId) {
            const selected = visible.find(item => String(item.sede.id_sede) === String(selectedId));
            if (selected) {
                this.map.panTo(selected.position);
                this.map.setZoom(Math.max(this.map.getZoom(), 14));
                this.hasFit = true;
                return;
            }
        }

        const bounds = new google.maps.LatLngBounds();
        visible.slice(0, 80).forEach(item => bounds.extend(item.position));
        if (visible.length === 1) {
            this.map.setCenter(visible[0].position);
            this.map.setZoom(14);
        } else {
            this.map.fitBounds(bounds, 60);
        }
        this.hasFit = true;
    }

    parsePosition(value) {
        if (!value) return null;
        const [lat, lng] = String(value).split(',').map(Number);
        if (!Number.isFinite(lat) || !Number.isFinite(lng)) return null;
        if ((lat < -15.6 || lat > -10.1) || (lng < -78.2 || lng > -74.4)) return null;
        return { lat, lng };
    }

    setStatus(message) {
        const el = document.getElementById('routeMapStatus');
        if (!el) return;
        el.textContent = message || '';
        el.classList.toggle('d-none', !message);
    }

    escapeHtml(value) {
        return String(value ?? '').replace(/[&<>"']/g, char => ({
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#39;'
        }[char]));
    }
}

window.RouteAssignmentMap = RouteAssignmentMap;
