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
        this.isFallback = false;
        this.fallbackLayer = null;
        this.fallbackInfo = null;
        this.fallbackBounds = null;
        this.maxMarkers = options.maxMarkers || 420;
        this.defaultCenter = { lat: -12.0464, lng: -77.0428 };
        this.mapStyles = options.mapStyles || RouteAssignmentMap.darkMapStyles();
    }

    async init(container) {
        this.container = container;
        if (!container) return;

        try {
            await RouteAssignmentMap.loadGoogleMaps();
        } catch (error) {
            this.initFallback(container, error.message || 'Mapa simplificado activo');
            return;
        }

        this.map = new google.maps.Map(container, {
            center: this.defaultCenter,
            zoom: 11,
            styles: this.mapStyles,
            backgroundColor: '#1d2c4d',
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

    static darkMapStyles() {
        return [
            { elementType: 'geometry', stylers: [{ color: '#1d2c4d' }] },
            { elementType: 'labels.text.fill', stylers: [{ color: '#8ec3b9' }] },
            { elementType: 'labels.text.stroke', stylers: [{ color: '#1a3646' }] },
            { featureType: 'administrative.country', elementType: 'geometry.stroke', stylers: [{ color: '#4b6878' }] },
            { featureType: 'administrative.land_parcel', elementType: 'labels.text.fill', stylers: [{ color: '#64779e' }] },
            { featureType: 'administrative.province', elementType: 'geometry.stroke', stylers: [{ color: '#4b6878' }] },
            { featureType: 'landscape.man_made', elementType: 'geometry.stroke', stylers: [{ color: '#334e87' }] },
            { featureType: 'landscape.natural', elementType: 'geometry', stylers: [{ color: '#023e58' }] },
            { featureType: 'poi', elementType: 'geometry', stylers: [{ color: '#283d6a' }] },
            { featureType: 'poi', elementType: 'labels.text.fill', stylers: [{ color: '#6f9ba5' }] },
            { featureType: 'poi', elementType: 'labels.text.stroke', stylers: [{ color: '#1d2c4d' }] },
            { featureType: 'poi.park', elementType: 'geometry.fill', stylers: [{ color: '#023e58' }] },
            { featureType: 'poi.park', elementType: 'labels.text.fill', stylers: [{ color: '#3C7680' }] },
            { featureType: 'road', elementType: 'geometry', stylers: [{ color: '#304a7d' }] },
            { featureType: 'road', elementType: 'labels.text.fill', stylers: [{ color: '#98a5be' }] },
            { featureType: 'road', elementType: 'labels.text.stroke', stylers: [{ color: '#1d2c4d' }] },
            { featureType: 'road.highway', elementType: 'geometry', stylers: [{ color: '#2c6675' }] },
            { featureType: 'road.highway', elementType: 'geometry.stroke', stylers: [{ color: '#255763' }] },
            { featureType: 'road.highway', elementType: 'labels.text.fill', stylers: [{ color: '#b0d5ce' }] },
            { featureType: 'road.highway', elementType: 'labels.text.stroke', stylers: [{ color: '#023e58' }] },
            { featureType: 'transit', elementType: 'labels.text.fill', stylers: [{ color: '#98a5be' }] },
            { featureType: 'transit', elementType: 'labels.text.stroke', stylers: [{ color: '#1d2c4d' }] },
            { featureType: 'transit.line', elementType: 'geometry.fill', stylers: [{ color: '#283d6a' }] },
            { featureType: 'transit.station', elementType: 'geometry', stylers: [{ color: '#3a4762' }] },
            { featureType: 'water', elementType: 'geometry', stylers: [{ color: '#0e1626' }] },
            { featureType: 'water', elementType: 'labels.text.fill', stylers: [{ color: '#4e6d70' }] }
        ];
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
        if (this.isFallback) {
            this.renderFallback(sedes, context);
            return;
        }

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

    initFallback(container, reason) {
        this.isFallback = true;
        this.map = null;
        this.infoWindow = null;
        container.innerHTML = `
            <div class="route-fallback-map" aria-label="Mapa simplificado de sedes">
                <div class="route-fallback-water water-ocean"></div>
                <div class="route-fallback-water water-bay"></div>
                <div class="route-fallback-park park-north"></div>
                <div class="route-fallback-park park-south"></div>
                <svg class="route-fallback-roads" viewBox="0 0 1000 600" preserveAspectRatio="none" aria-hidden="true">
                    <path class="arterial" d="M70 520 C190 430 250 380 360 348 S540 292 670 238 840 170 960 96" />
                    <path class="arterial" d="M122 120 C250 180 345 246 420 334 S540 448 686 520 848 585 980 610" />
                    <path class="highway" d="M470 600 C468 520 486 452 506 390 S530 270 526 190 500 82 508 -20" />
                    <path class="highway" d="M292 594 C342 506 404 438 474 374 S642 256 742 186 848 116 968 50" />
                    <path class="minor" d="M42 300 H930" />
                    <path class="minor" d="M130 210 H870" />
                    <path class="minor" d="M185 404 H980" />
                    <path class="minor" d="M230 72 V560" />
                    <path class="minor" d="M382 20 V586" />
                    <path class="minor" d="M620 10 V570" />
                    <path class="minor" d="M780 28 V592" />
                </svg>
                <div class="route-fallback-label label-lima">Lima</div>
                <div class="route-fallback-label label-callao">Callao</div>
                <div class="route-fallback-label label-ica">Ica</div>
                <div class="route-fallback-layer"></div>
                <div class="route-fallback-info d-none"></div>
            </div>
        `;
        this.ensureFallbackStyles();
        this.fallbackLayer = container.querySelector('.route-fallback-layer');
        this.fallbackInfo = container.querySelector('.route-fallback-info');
        this.setStatus(reason ? `${reason}. Usando mapa rapido sin tiles.` : 'Mapa rapido sin tiles activo.');
    }

    ensureFallbackStyles() {
        if (document.getElementById('routeFallbackMapStyles')) return;
        const style = document.createElement('style');
        style.id = 'routeFallbackMapStyles';
        style.textContent = `
            .route-fallback-map {
                position: absolute;
                inset: 0;
                overflow: hidden;
                isolation: isolate;
                background:
                    radial-gradient(circle at 58% 42%, rgba(48, 74, 125, 0.42), transparent 30%),
                    radial-gradient(circle at 32% 62%, rgba(2, 62, 88, 0.34), transparent 24%),
                    linear-gradient(135deg, #0e1626 0%, #172849 45%, #1d2c4d 100%);
            }

            .route-fallback-map::before {
                content: "";
                position: absolute;
                inset: 0;
                background-image:
                    linear-gradient(rgba(80, 112, 168, 0.13) 1px, transparent 1px),
                    linear-gradient(90deg, rgba(80, 112, 168, 0.13) 1px, transparent 1px);
                background-size: 54px 54px;
                opacity: 0.55;
                z-index: 0;
            }

            .route-fallback-map::after {
                content: "";
                position: absolute;
                inset: 0;
                background:
                    radial-gradient(ellipse at 18% 48%, rgba(14, 22, 38, 0.86) 0 18%, transparent 18.5%),
                    radial-gradient(ellipse at 76% 28%, rgba(14, 22, 38, 0.62) 0 12%, transparent 12.5%);
                pointer-events: none;
                z-index: 0;
            }

            .route-fallback-water,
            .route-fallback-park {
                position: absolute;
                pointer-events: none;
                z-index: 0;
            }

            .route-fallback-water {
                background: rgba(14, 22, 38, 0.86);
                filter: blur(1px);
            }

            .route-fallback-water.water-ocean {
                border-radius: 42% 58% 48% 52%;
                height: 64%;
                left: -12%;
                top: 7%;
                transform: rotate(-10deg);
                width: 32%;
            }

            .route-fallback-water.water-bay {
                border-radius: 54% 46% 48% 52%;
                height: 34%;
                right: 9%;
                top: 22%;
                transform: rotate(18deg);
                width: 18%;
            }

            .route-fallback-park {
                background: rgba(2, 62, 88, 0.72);
                border-radius: 22px;
            }

            .route-fallback-park.park-north {
                height: 72px;
                left: 64%;
                top: 12%;
                width: 118px;
            }

            .route-fallback-park.park-south {
                height: 92px;
                left: 18%;
                top: 68%;
                width: 152px;
            }

            .route-fallback-roads {
                inset: 0;
                opacity: 0.9;
                position: absolute;
                z-index: 1;
            }

            .route-fallback-roads path {
                fill: none;
                stroke-linecap: round;
                stroke-linejoin: round;
                vector-effect: non-scaling-stroke;
            }

            .route-fallback-roads .minor {
                stroke: rgba(48, 74, 125, 0.58);
                stroke-width: 1;
            }

            .route-fallback-roads .arterial {
                stroke: rgba(48, 74, 125, 0.82);
                stroke-width: 2;
            }

            .route-fallback-roads .highway {
                stroke: rgba(44, 102, 117, 0.9);
                stroke-width: 4;
            }

            .route-fallback-label {
                color: rgba(142, 195, 185, 0.78);
                font-size: 0.84rem;
                font-weight: 800;
                letter-spacing: 0.02em;
                position: absolute;
                text-shadow: 0 2px 4px rgba(26, 54, 70, 0.95);
                user-select: none;
                z-index: 2;
            }

            .route-fallback-label.label-lima {
                font-size: 1.7rem;
                left: 34%;
                top: 37%;
            }

            .route-fallback-label.label-callao {
                left: 20%;
                top: 31%;
            }

            .route-fallback-label.label-ica {
                right: 18%;
                bottom: 22%;
            }

            .route-fallback-layer {
                position: absolute;
                inset: 20px;
                z-index: 3;
            }

            .route-fallback-marker {
                align-items: center;
                border: 2px solid #fff;
                border-radius: 999px;
                box-shadow: 0 5px 14px rgba(0, 0, 0, 0.36);
                cursor: pointer;
                display: inline-flex;
                height: 14px;
                justify-content: center;
                margin-left: -7px;
                margin-top: -7px;
                position: absolute;
                transition: transform 0.12s ease, box-shadow 0.12s ease;
                width: 14px;
            }

            .route-fallback-marker:hover,
            .route-fallback-marker.is-selected {
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.46);
                transform: scale(1.35);
                z-index: 4;
            }

            .route-fallback-marker.assignedActive { background: #22c55e; }
            .route-fallback-marker.assignedOther { background: #98a5be; }
            .route-fallback-marker.pending { background: #38bdf8; }
            .route-fallback-marker.selected,
            .route-fallback-marker.is-selected { background: #f59e0b; }

            .route-fallback-info {
                background: rgba(29, 44, 77, 0.96);
                border: 1px solid rgba(142, 195, 185, 0.28);
                border-radius: 8px;
                box-shadow: 0 14px 34px rgba(0, 0, 0, 0.32);
                color: #d9f3ef;
                max-width: 280px;
                padding: 10px;
                position: absolute;
                right: 12px;
                top: 12px;
                z-index: 5;
            }

            .route-fallback-info .text-muted {
                color: #8ec3b9 !important;
            }
        `;
        document.head.appendChild(style);
    }

    renderFallback(sedes = [], context = {}) {
        if (!this.fallbackLayer) return;

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

        if (!this.fallbackBounds || context.forceFit || !this.hasFit) {
            this.fallbackBounds = this.computeFallbackBounds(visible);
            this.hasFit = true;
        }

        const hidden = withPosition.length - visible.length;
        this.fallbackLayer.innerHTML = visible.map(item => {
            const point = this.projectFallbackPoint(item.position, this.fallbackBounds);
            const status = this.getStatus(item.sede, context);
            const selected = String(item.sede.id_sede) === selectedId;
            return `
                <button type="button"
                    class="route-fallback-marker ${status} ${selected ? 'is-selected' : ''}"
                    style="left:${point.x}%;top:${point.y}%"
                    title="${this.escapeHtml(item.sede.nombre_comercial || '')}"
                    data-sede-id="${this.escapeHtml(item.sede.id_sede)}"></button>
            `;
        }).join('');

        this.fallbackLayer.querySelectorAll('[data-sede-id]').forEach(marker => {
            const sede = visible.find(item => String(item.sede.id_sede) === String(marker.dataset.sedeId))?.sede;
            if (!sede) return;
            marker.addEventListener('click', () => {
                if (this.options.onSelect) this.options.onSelect(sede);
                this.openFallbackInfo(sede);
            });
            marker.addEventListener('dblclick', () => {
                if (this.options.onQuickAdd) this.options.onQuickAdd(sede);
            });
        });

        this.setStatus(hidden > 0
            ? `${visible.length} de ${withPosition.length} sedes en mapa rapido`
            : `${visible.length} sedes en mapa rapido`);
    }

    computeFallbackBounds(items) {
        if (!items.length) {
            return { north: -10.1, south: -15.6, west: -78.2, east: -74.4 };
        }

        let north = -90;
        let south = 90;
        let east = -180;
        let west = 180;
        for (const item of items) {
            north = Math.max(north, item.position.lat);
            south = Math.min(south, item.position.lat);
            east = Math.max(east, item.position.lng);
            west = Math.min(west, item.position.lng);
        }

        const latPad = Math.max((north - south) * 0.18, 0.018);
        const lngPad = Math.max((east - west) * 0.18, 0.018);
        return {
            north: Math.min(-10.1, north + latPad),
            south: Math.max(-15.6, south - latPad),
            east: Math.min(-74.4, east + lngPad),
            west: Math.max(-78.2, west - lngPad)
        };
    }

    projectFallbackPoint(position, bounds) {
        const lngSpan = Math.max(bounds.east - bounds.west, 0.0001);
        const latSpan = Math.max(bounds.north - bounds.south, 0.0001);
        const x = ((position.lng - bounds.west) / lngSpan) * 100;
        const y = ((bounds.north - position.lat) / latSpan) * 100;
        return {
            x: Math.max(2, Math.min(98, x)),
            y: Math.max(2, Math.min(98, y))
        };
    }

    openFallbackInfo(sede) {
        if (!this.fallbackInfo) return;
        const action = this.options.actionForSede ? this.options.actionForSede(sede) : null;
        const actionHtml = action
            ? `<button class="btn btn-sm ${action.kind === 'reassign' ? 'btn-warning' : 'btn-success'} w-100 mt-2" data-map-action="1">${this.escapeHtml(action.label)}</button>`
            : '<div class="small text-muted mt-2">Selecciona un camion para asignar</div>';
        this.fallbackInfo.innerHTML = `
            <div class="fw-bold">${this.escapeHtml(sede.nombre_comercial || '-')}</div>
            <div class="small text-muted">${this.escapeHtml(sede.empresa_ruc || '')}</div>
            <div class="small">${this.escapeHtml(sede.distrito || '')}</div>
            <div class="small text-muted">${this.escapeHtml(sede.frecuencia || 'Sin frecuencia')}</div>
            ${actionHtml}
        `;
        this.fallbackInfo.classList.remove('d-none');
        const btn = this.fallbackInfo.querySelector('[data-map-action]');
        if (btn && action?.handler) btn.addEventListener('click', action.handler);
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
