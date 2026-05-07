/**
 * IO Group - Map Controller
 * Map tools for address search, active nearby sedes, frequency and district filters.
 */

class MapController {
    constructor() {
        this.map = null;
        this.markers = [];
        this.markerById = new Map();
        this.sedeById = new Map();
        this.visibleMarkerIds = new Set();
        this.markerIconCache = new Map();
        this.markerCluster = null;
        this.sedes = [];
        this.filteredSedes = [];
        this.loadPromise = null;
        this.pendingFilterFrame = null;
        this.pendingFilterOptions = null;
        this.infoWindow = null;
        this.userMarker = null;
        this.userCircle = null;
        this.referenceMarker = null;
        this.referenceCircle = null;
        this.referenceLocation = null;
        this.hasFitBounds = false;

        this.defaultLocation = { lat: -12.0464, lng: -77.0428 };
        this.allFrequencies = ['diario', 'interdiario', 'semanal', 'quincenal', 'mensual', 'bimestral', 'trimestral', 'eventual'];
        this.frequencyLabels = {
            diario: 'Diario',
            interdiario: 'Interdiario',
            semanal: 'Semanal',
            quincenal: 'Quincenal',
            mensual: 'Mensual',
            bimestral: 'Bimestral',
            trimestral: 'Trimestral',
            eventual: 'Eventual'
        };
        this.frequencyColors = {
            diario: '#0d6efd',
            interdiario: '#20c997',
            semanal: '#198754',
            quincenal: '#fd7e14',
            mensual: '#6f42c1',
            bimestral: '#0dcaf0',
            trimestral: '#795548',
            eventual: '#dc3545'
        };

        this.filters = {
            frequencies: new Set(this.allFrequencies),
            districts: new Set(),
            nearby: false,
            radius: 10,
            userLocation: null
        };
        this.selectedSedes = new Set();
    }

    async init() {
        if (!window.google || !window.google.maps) {
            console.error('Google Maps API not loaded');
            return;
        }

        const [{ Map }, markerLibrary, { Autocomplete }] = await Promise.all([
            google.maps.importLibrary('maps'),
            google.maps.importLibrary('marker'),
            google.maps.importLibrary('places')
        ]);

        this.Marker = markerLibrary.Marker || google.maps.Marker;
        this.AdvancedMarkerElement = markerLibrary.AdvancedMarkerElement;
        this.PinElement = markerLibrary.PinElement;
        this.Autocomplete = Autocomplete;
        this.geocoder = new google.maps.Geocoder();

        this.map = new Map(document.getElementById('map'), {
            center: this.defaultLocation,
            zoom: 11,
            disableDefaultUI: true,
            clickableIcons: false,
            gestureHandling: 'greedy',
            keyboardShortcuts: false,
            mapId: 'DEMO_MAP_ID'
        });
        this.infoWindow = new google.maps.InfoWindow();

        if (window.markerClusterer?.MarkerClusterer) {
            this.markerCluster = new window.markerClusterer.MarkerClusterer({
                map: this.map,
                markers: []
            });
        }

        this.setupEventListeners();
        this.setupResizeObserver();
        await this.loadSedes();
    }

    setupEventListeners() {
        document.querySelectorAll('.filter-freq').forEach(btn => {
            const freq = this.normalizeFrequency(btn.dataset.freq);
            this.updateFreqBtnVisuals(btn, this.filters.frequencies.has(freq));

            btn.addEventListener('click', (event) => {
                const button = event.currentTarget;
                const value = this.normalizeFrequency(button.dataset.freq);

                if (this.filters.frequencies.has(value)) {
                    this.filters.frequencies.delete(value);
                } else {
                    this.filters.frequencies.add(value);
                }

                this.updateFreqBtnVisuals(button, this.filters.frequencies.has(value));
                this.scheduleApplyFilters({ forceFit: this.filters.nearby });
            });
        });

        const addressInput = document.getElementById('addressSearch');
        if (addressInput) {
            const autocomplete = new this.Autocomplete(addressInput, {
                componentRestrictions: { country: 'pe' },
                fields: ['geometry', 'name', 'formatted_address'],
                strictBounds: false
            });

            autocomplete.bindTo('bounds', this.map);
            autocomplete.addListener('place_changed', () => {
                this.handleAddressSelect(autocomplete.getPlace());
            });

            addressInput.addEventListener('input', () => {
                if (!addressInput.value.trim()) {
                    this.clearNearbySearch();
                }
            });
        }

        const sedeInput = document.getElementById('sedeSearch');
        const resultsContainer = document.getElementById('sedeSearchResults');
        if (sedeInput && resultsContainer) {
            const searchHandler = this.debounce((event) => {
                this.handleSedeSearch(event.target.value.toLowerCase(), resultsContainer);
            }, 120);
            sedeInput.addEventListener('input', searchHandler);

            document.addEventListener('click', (event) => {
                if (!sedeInput.contains(event.target) && !resultsContainer.contains(event.target)) {
                    resultsContainer.classList.add('d-none');
                }
            });
        }

        document.getElementById('clearMapBtn')?.addEventListener('click', () => this.clearMapSelection());
        document.getElementById('clearNearbyBtn')?.addEventListener('click', () => this.clearNearbySearch());
        document.getElementById('clearDistrictsBtn')?.addEventListener('click', () => this.clearDistricts());
        document.getElementById('btnMyLocation')?.addEventListener('click', () => this.getUserLocation());
        document.getElementById('zoomIn')?.addEventListener('click', () => this.map.setZoom(this.map.getZoom() + 1));
        document.getElementById('zoomOut')?.addEventListener('click', () => this.map.setZoom(this.map.getZoom() - 1));
        document.getElementById('fitResultsBtn')?.addEventListener('click', () => this.fitCurrentResults());

        const nearbyToggle = document.getElementById('nearbyToggle');
        nearbyToggle?.addEventListener('change', (event) => {
            this.filters.nearby = event.target.checked;
            this.updateNearbyControls();

            if (this.filters.nearby && !this.getReferenceCenter()) {
                this.getUserLocation(false, true);
                return;
            }

            this.scheduleApplyFilters({ forceFit: this.filters.nearby });
        });

        const radiusRange = document.getElementById('radiusRange');
        radiusRange?.addEventListener('input', (event) => {
            this.filters.radius = Number(event.target.value) || 10;
            this.updateRadiusLabel();
            this.updateReferenceCircle();
            if (this.filters.nearby) this.scheduleApplyFilters({ forceFit: true });
        });

        this.map.addListener('click', (event) => {
            if (!this.filters.nearby) return;
            this.setReferenceLocation({ lat: event.latLng.lat(), lng: event.latLng.lng() }, 'Punto de busqueda');
            this.scheduleApplyFilters({ forceFit: true });
        });
    }

    async loadSedes() {
        if (this.loadPromise) return this.loadPromise;

        this.loadPromise = (async () => {
            const response = await api.get('/sedes?mapa=1', { cache: true });
            if (response.success) {
                this.prepareSedes(response.data || []);
                this.clearMarkerCache();
                this.populateDistrictFilter();
                this.applyFilters({ forceFit: !this.hasFitBounds });
            }
        })();

        try {
            await this.loadPromise;
        } catch (error) {
            console.error('Error loading sedes:', error);
            showToast('Error cargando mapa', 'danger');
        } finally {
            this.loadPromise = null;
        }
    }

    prepareSedes(rawSedes) {
        this.sedeById.clear();

        this.sedes = rawSedes
            .map(sede => {
                const position = this.parseSedePosition(sede.coordenadas_gps);
                if (!position) return null;

                const id = String(sede.id_sede);
                const frequency = this.normalizeFrequency(sede.frecuencia);
                const district = (sede.distrito || '').trim();
                const normalized = {
                    ...sede,
                    _id: id,
                    _position: position,
                    _frequency: frequency,
                    _district: district,
                    _active: String(sede.activo) !== '0',
                    _distanceKm: null,
                    _searchText: [
                        sede.nombre_comercial,
                        sede.direccion,
                        sede.empresa_razon_social,
                        sede.empresa_ruc
                    ].join(' ').toLowerCase()
                };

                this.sedeById.set(id, normalized);
                return normalized;
            })
            .filter(Boolean);
    }

    handleAddressSelect(place) {
        if (!place?.geometry?.location) {
            showToast('No se encontraron detalles de ubicacion', 'warning');
            return;
        }

        const pos = {
            lat: place.geometry.location.lat(),
            lng: place.geometry.location.lng()
        };

        this.clearSelectedSedes();
        this.setReferenceLocation(pos, place.name || place.formatted_address || 'Direccion');
        this.filters.nearby = true;
        this.updateNearbyControls();
        this.applyFilters({ forceFit: true });
    }

    handleSedeSearch(query, container) {
        if (query.length < 2) {
            container.classList.add('d-none');
            return;
        }

        const matches = [];
        for (const sede of this.sedes) {
            if (sede._searchText.includes(query)) {
                matches.push(sede);
                if (matches.length === 12) break;
            }
        }

        if (!matches.length) {
            container.innerHTML = '<div class="list-group-item small text-muted">No se encontraron resultados</div>';
        } else {
            container.innerHTML = matches.map(sede => `
                <button class="list-group-item list-group-item-action suggestion-item border-0 border-bottom text-start"
                    data-sede-id="${this.escapeHtml(sede.id_sede)}">
                    <div class="fw-semibold text-dark">${this.escapeHtml(sede.nombre_comercial)}</div>
                    <div class="text-muted small">${this.escapeHtml(sede.direccion || '')}</div>
                    <div class="text-muted" style="font-size: 0.72rem;">${this.escapeHtml(sede.empresa_ruc || '')}</div>
                </button>
            `).join('');

            container.querySelectorAll('[data-sede-id]').forEach(btn => {
                btn.addEventListener('click', () => {
                    const sede = this.sedeById.get(String(btn.dataset.sedeId));
                    if (!sede) return;
                    this.addSedeToSelection(sede);
                    container.classList.add('d-none');
                    const input = document.getElementById('sedeSearch');
                    if (input) input.value = '';
                });
            });
        }

        container.classList.remove('d-none');
    }

    addSedeToSelection(sede) {
        const id = String(sede.id_sede);
        if (this.selectedSedes.has(id)) return;

        this.filters.nearby = false;
        this.updateNearbyControls();
        this.selectedSedes.add(id);
        this.renderSelectedSedes();
        this.applyFilters({ forceFit: true });
    }

    removeSedeFromSelection(id) {
        this.selectedSedes.delete(String(id));
        this.renderSelectedSedes();
        this.applyFilters({ forceFit: true });
    }

    clearMapSelection() {
        this.clearSelectedSedes();
        this.clearNearbySearch({ skipApply: true });
        this.clearDistricts({ skipApply: true });
        this.filters.frequencies = new Set(this.allFrequencies);
        document.querySelectorAll('.filter-freq').forEach(btn => {
            const freq = this.normalizeFrequency(btn.dataset.freq);
            this.updateFreqBtnVisuals(btn, this.filters.frequencies.has(freq));
        });
        this.applyFilters({ forceFit: true });
    }

    clearSelectedSedes() {
        this.selectedSedes.clear();
        this.renderSelectedSedes();
    }

    renderSelectedSedes() {
        const chipContainer = document.getElementById('selectedSedesContainer');
        if (!chipContainer) return;

        const sedes = Array.from(this.selectedSedes)
            .map(id => this.sedeById.get(String(id)))
            .filter(Boolean);
        chipContainer.innerHTML = sedes.map(sede => `
            <span class="sede-chip">
                ${this.escapeHtml(sede.nombre_comercial)}
                <button type="button" class="btn-close" aria-label="Quitar" data-sede-id="${this.escapeHtml(sede.id_sede)}"></button>
            </span>
        `).join('');

        chipContainer.querySelectorAll('[data-sede-id]').forEach(btn => {
            btn.addEventListener('click', () => this.removeSedeFromSelection(btn.dataset.sedeId));
        });
    }

    populateDistrictFilter() {
        const container = document.getElementById('districtFilters');
        if (!container || !this.sedes.length) return;

        const counts = new Map();
        this.sedes.forEach(sede => {
            const district = sede._district;
            if (!district) return;
            counts.set(district, (counts.get(district) || 0) + 1);
        });

        const districts = Array.from(counts.keys()).sort((a, b) => a.localeCompare(b));
        if (!districts.length) {
            container.innerHTML = '<div class="text-muted small">No se encontraron distritos</div>';
            return;
        }

        container.innerHTML = districts.map(dist => {
            const safeId = `dist_${dist.replace(/[^a-zA-Z0-9]/g, '_')}`;
            const checked = this.filters.districts.has(dist) ? 'checked' : '';
            return `
                <div class="form-check district-row">
                    <input class="form-check-input filter-district" type="checkbox" value="${this.escapeHtml(dist)}"
                        id="${this.escapeHtml(safeId)}" ${checked}>
                    <label class="form-check-label small d-flex justify-content-between gap-2" for="${this.escapeHtml(safeId)}">
                        <span>${this.escapeHtml(dist)}</span>
                        <span class="text-muted">${counts.get(dist)}</span>
                    </label>
                </div>
            `;
        }).join('');

        container.querySelectorAll('.filter-district').forEach(cb => {
            cb.addEventListener('change', (event) => {
                if (event.target.checked) {
                    this.filters.districts.add(event.target.value);
                } else {
                    this.filters.districts.delete(event.target.value);
                }
                this.updateDistrictSummary();
                this.scheduleApplyFilters({ forceFit: this.filters.nearby });
            });
        });

        this.updateDistrictSummary();
    }

    clearDistricts(options = {}) {
        this.filters.districts.clear();
        document.querySelectorAll('.filter-district').forEach(cb => { cb.checked = false; });
        this.updateDistrictSummary();
        if (!options.skipApply) this.applyFilters({ forceFit: this.filters.nearby });
    }

    scheduleApplyFilters(options = {}) {
        this.pendingFilterOptions = {
            forceFit: Boolean(this.pendingFilterOptions?.forceFit || options.forceFit)
        };

        if (this.pendingFilterFrame) return;
        this.pendingFilterFrame = requestAnimationFrame(() => {
            const pendingOptions = this.pendingFilterOptions || {};
            this.pendingFilterFrame = null;
            this.pendingFilterOptions = null;
            this.applyFilters(pendingOptions);
        });
    }

    debounce(fn, ms = 150) {
        let timer = null;
        return (...args) => {
            window.clearTimeout(timer);
            timer = window.setTimeout(() => fn.apply(this, args), ms);
        };
    }

    setupResizeObserver() {
        const mapEl = document.getElementById('map');
        if (!mapEl || typeof ResizeObserver === 'undefined') return;

        const notifyResize = this.debounce(() => {
            if (!this.map) return;
            google.maps.event.trigger(this.map, 'resize');
        }, 120);

        this.resizeObserver = new ResizeObserver(notifyResize);
        this.resizeObserver.observe(mapEl);
    }

    applyFilters(options = {}) {
        if (!this.sedes) return;

        const sourceSet = this.selectedSedes.size
            ? Array.from(this.selectedSedes).map(id => this.sedeById.get(String(id))).filter(Boolean)
            : this.sedes;
        const center = this.getReferenceCenter();
        const keepNoFrequency = this.filters.frequencies.size === this.allFrequencies.length;
        const hasDistrictFilter = this.filters.districts.size > 0;
        const useNearby = this.filters.nearby && center;
        const radius = this.filters.radius;
        const filtered = [];
        let latLimit = 0;
        let lngLimit = 0;

        if (useNearby) {
            latLimit = radius / 111.32;
            const cosLat = Math.max(Math.cos(this.deg2rad(center.lat)), 0.01);
            lngLimit = radius / (111.32 * cosLat);
        }

        for (const sede of sourceSet) {
            if (!sede) continue;
            sede._distanceKm = null;

            const frequency = sede._frequency;
            if (frequency && !this.filters.frequencies.has(frequency)) continue;
            if (!frequency && !keepNoFrequency) continue;

            if (hasDistrictFilter && !this.filters.districts.has(sede._district)) continue;

            if (this.filters.nearby) {
                if (!useNearby || !this.isActive(sede)) continue;

                const position = sede._position;
                if (!position) continue;
                if (Math.abs(position.lat - center.lat) > latLimit || Math.abs(position.lng - center.lng) > lngLimit) {
                    continue;
                }

                const distance = this.calculateDistance(center.lat, center.lng, position.lat, position.lng);
                if (distance > radius) continue;
                sede._distanceKm = distance;
            }

            filtered.push(sede);
        }

        if (this.filters.nearby) {
            filtered.sort((a, b) => (a._distanceKm ?? 9999) - (b._distanceKm ?? 9999));
        } else {
            filtered.sort((a, b) => (a.nombre_comercial || '').localeCompare(b.nombre_comercial || ''));
        }

        this.filteredSedes = filtered;
        this.updateCounters(filtered);
        this.renderNearbyList(filtered);
        this.renderMarkers(filtered, options.forceFit || false);
    }

    renderMarkers(sedesToRender, forceFit = false) {
        const nextVisibleIds = new Set();
        const visibleMarkers = [];

        for (const sede of sedesToRender) {
            const marker = this.getOrCreateSedeMarker(sede);
            if (!marker) continue;
            nextVisibleIds.add(sede._id);
            visibleMarkers.push(marker);
        }

        if (this.markerCluster) {
            this.markerCluster.clearMarkers();
            this.markerCluster.addMarkers(visibleMarkers);
        } else {
            for (const id of this.visibleMarkerIds) {
                if (!nextVisibleIds.has(id)) {
                    const marker = this.markerById.get(id);
                    if (marker) this.setMarkerMap(marker, null);
                }
            }

            for (const marker of visibleMarkers) {
                this.setMarkerMap(marker, this.map);
            }
        }

        this.markers = visibleMarkers;
        this.visibleMarkerIds = nextVisibleIds;

        if ((forceFit || !this.hasFitBounds) && visibleMarkers.length) {
            this.fitSedes(sedesToRender);
        }
    }

    getOrCreateSedeMarker(sede) {
        if (!sede?._position) return null;

        const cached = this.markerById.get(sede._id);
        if (cached) return cached;

        const color = this.isActive(sede) ? (this.frequencyColors[sede._frequency] || '#198754') : '#6c757d';
        let marker = null;

        if (this.Marker) {
            marker = new this.Marker({
                position: sede._position,
                title: sede.nombre_comercial || '',
                icon: this.getMarkerIcon(color),
                optimized: true,
                clickable: true
            });
            marker.addListener('click', () => this.showInfoWindow(marker, sede));
        } else if (this.AdvancedMarkerElement && this.PinElement) {
            const pin = new this.PinElement({
                scale: 0.85,
                background: color,
                borderColor: '#ffffff',
                glyphColor: '#ffffff'
            });

            marker = new this.AdvancedMarkerElement({
                position: sede._position,
                title: sede.nombre_comercial || '',
                content: pin.element
            });
            marker.addListener('gmp-click', () => this.showInfoWindow(marker, sede));
        }

        if (marker) this.markerById.set(sede._id, marker);
        return marker;
    }

    getMarkerIcon(color) {
        if (this.markerIconCache.has(color)) return this.markerIconCache.get(color);

        const icon = {
            path: google.maps.SymbolPath.CIRCLE,
            fillColor: color,
            fillOpacity: 0.92,
            strokeColor: '#ffffff',
            strokeOpacity: 1,
            strokeWeight: 1.5,
            scale: 6
        };

        this.markerIconCache.set(color, icon);
        return icon;
    }

    createUtilityMarker(position, title, color, draggable = false) {
        if (this.Marker) {
            return new this.Marker({
                position,
                map: this.map,
                title,
                icon: this.getMarkerIcon(color),
                optimized: true,
                draggable
            });
        }

        const pin = new this.PinElement({
            scale: 1,
            background: color,
            borderColor: '#ffffff',
            glyphColor: '#ffffff'
        });

        return new this.AdvancedMarkerElement({
            position,
            map: this.map,
            title,
            content: pin.element,
            gmpDraggable: draggable
        });
    }

    setMarkerMap(marker, map) {
        if (!marker) return;
        if (typeof marker.setMap === 'function') {
            marker.setMap(map);
        } else {
            marker.map = map;
        }
    }

    setMarkerPosition(marker, position) {
        if (!marker || !position) return;
        if (typeof marker.setPosition === 'function') {
            marker.setPosition(position);
        } else {
            marker.position = position;
        }
    }

    getMarkerPosition(marker) {
        if (!marker) return null;
        if (typeof marker.getPosition === 'function') {
            const position = marker.getPosition();
            return position ? { lat: position.lat(), lng: position.lng() } : null;
        }

        const position = marker.position;
        if (!position) return null;
        return typeof position.lat === 'function'
            ? { lat: position.lat(), lng: position.lng() }
            : position;
    }

    clearMarkerCache() {
        if (this.markerCluster) this.markerCluster.clearMarkers();
        for (const marker of this.markerById.values()) {
            this.setMarkerMap(marker, null);
        }
        this.markers = [];
        this.markerById.clear();
        this.visibleMarkerIds.clear();
        this.infoWindow?.close();
    }

    fitSedes(sedes) {
        const bounds = new google.maps.LatLngBounds();
        let count = 0;
        let lastPosition = null;

        for (const sede of sedes) {
            const position = this.getSedePosition(sede);
            if (!position) continue;
            bounds.extend(position);
            lastPosition = position;
            count += 1;
        }

        if (!count) return;
        if (count === 1) {
            this.map.setCenter(lastPosition);
            this.map.setZoom(16);
        } else {
            this.map.fitBounds(bounds, 80);
        }
        this.hasFitBounds = true;
    }

    renderNearbyList(sedes) {
        const panel = document.getElementById('nearbyResultsPanel');
        const list = document.getElementById('nearbySedesList');
        const summary = document.getElementById('nearbySummary');
        if (!panel || !list || !summary) return;

        if (!this.filters.nearby || !this.getReferenceCenter()) {
            panel.classList.add('d-none');
            list.innerHTML = '';
            summary.textContent = '';
            return;
        }

        panel.classList.remove('d-none');
        summary.textContent = `${sedes.length} activas en ${this.filters.radius} km`;

        if (!sedes.length) {
            list.innerHTML = '<div class="nearby-empty">Sin sedes activas en este radio.</div>';
            return;
        }

        list.innerHTML = sedes.slice(0, 10).map(sede => `
            <button class="nearby-item" data-sede-id="${this.escapeHtml(sede.id_sede)}">
                <span>
                    <strong>${this.escapeHtml(sede.nombre_comercial)}</strong>
                    <small>${this.escapeHtml(sede.distrito || '')} &middot; ${this.escapeHtml(this.frequencyLabels[sede._frequency] || sede.frecuencia || 'Sin frecuencia')}</small>
                </span>
                <b>${this.formatDistance(sede._distanceKm)}</b>
            </button>
        `).join('');

        list.querySelectorAll('[data-sede-id]').forEach(btn => {
            btn.addEventListener('click', () => {
                const sede = sedes.find(item => String(item.id_sede) === String(btn.dataset.sedeId));
                if (sede) this.focusSede(sede);
            });
        });
    }

    showInfoWindow(marker, sede) {
        const distance = sede._distanceKm !== null && sede._distanceKm !== undefined
            ? `<span class="badge bg-primary-subtle text-primary border border-primary-subtle rounded-pill ms-1">${this.formatDistance(sede._distanceKm)}</span>`
            : '';

        const content = `
            <div class="map-info-window">
                <h6 class="mb-1">${this.escapeHtml(sede.nombre_comercial)}</h6>
                ${sede.empresa_razon_social ? `<p class="mb-1 text-muted small">${this.escapeHtml(sede.empresa_razon_social)}</p>` : ''}
                <p class="mb-1 text-muted small"><i class="bi bi-geo-alt"></i> ${this.escapeHtml(sede.direccion || '')}</p>
                ${sede.frecuencia ? `<span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill">Frec: ${this.escapeHtml(sede.frecuencia)}</span>` : ''}
                ${distance}
                ${!this.isActive(sede) ? '<span class="badge bg-secondary-subtle text-secondary border border-secondary-subtle rounded-pill ms-1">Inactiva</span>' : ''}
                <div class="mt-2 text-end">
                    <a href="../sedes/cartilla.html?id=${this.escapeHtml(sede.id_sede)}" class="btn btn-sm btn-primary rounded-pill px-3">Ver detalle</a>
                </div>
            </div>
        `;

        this.infoWindow.setContent(content);
        this.infoWindow.open(this.map, marker);
    }

    focusSede(sede) {
        const marker = this.getOrCreateSedeMarker(sede);
        const position = this.getSedePosition(sede);
        if (!position) return;

        this.map.panTo(position);
        this.map.setZoom(Math.max(this.map.getZoom(), 15));
        if (marker) this.showInfoWindow(marker, sede);
    }

    fitCurrentResults() {
        this.fitSedes(this.filteredSedes);
    }

    setReferenceLocation(pos, title = 'Referencia') {
        this.referenceLocation = pos;

        if (!pos) {
            if (this.referenceMarker) {
                this.setMarkerMap(this.referenceMarker, null);
                this.referenceMarker = null;
            }
            if (this.referenceCircle) {
                this.referenceCircle.setMap(null);
                this.referenceCircle = null;
            }
            return;
        }

        if (!this.referenceMarker) {
            this.referenceMarker = this.createUtilityMarker(pos, title, '#dc3545', true);
            this.referenceMarker.addListener('dragend', (event) => {
                this.referenceLocation = { lat: event.latLng.lat(), lng: event.latLng.lng() };
                this.updateReferenceCircle();
                this.scheduleApplyFilters({ forceFit: true });
            });
        } else {
            this.setMarkerPosition(this.referenceMarker, pos);
            if (typeof this.referenceMarker.setTitle === 'function') {
                this.referenceMarker.setTitle(title);
            } else {
                this.referenceMarker.title = title;
            }
        }

        this.updateReferenceCircle();
    }

    updateReferenceCircle() {
        const center = this.getReferenceCenter();
        if (!center || !this.filters.nearby) {
            if (this.referenceCircle) this.referenceCircle.setMap(null);
            return;
        }

        if (!this.referenceCircle) {
            this.referenceCircle = new google.maps.Circle({
                strokeColor: '#dc3545',
                strokeOpacity: 0.75,
                strokeWeight: 1,
                fillColor: '#dc3545',
                fillOpacity: 0.08,
                map: this.map,
                center,
                radius: this.filters.radius * 1000
            });
        } else {
            this.referenceCircle.setMap(this.map);
            this.referenceCircle.setCenter(center);
            this.referenceCircle.setRadius(this.filters.radius * 1000);
        }
    }

    clearNearbySearch(options = {}) {
        this.filters.nearby = false;
        this.referenceLocation = null;
        this.setReferenceLocation(null);
        this.updateNearbyControls();
        const input = document.getElementById('addressSearch');
        if (input) input.value = '';
        if (!options.skipApply) this.applyFilters({ forceFit: true });
    }

    updateNearbyControls() {
        const nearbyToggle = document.getElementById('nearbyToggle');
        const radiusRange = document.getElementById('radiusRange');
        const radarControls = document.getElementById('radarControls');

        if (nearbyToggle) nearbyToggle.checked = this.filters.nearby;
        if (radiusRange) {
            radiusRange.disabled = !this.filters.nearby;
            radiusRange.value = this.filters.radius;
        }
        if (radarControls) {
            radarControls.classList.toggle('opacity-50', !this.filters.nearby);
        }

        this.updateRadiusLabel();
        this.updateReferenceCircle();
    }

    updateRadiusLabel() {
        const radiusValue = document.getElementById('radiusValue');
        if (radiusValue) radiusValue.textContent = this.filters.radius;
    }

    updateFreqBtnVisuals(btn, isActive) {
        btn.classList.toggle('is-active', isActive);
        btn.classList.toggle('btn-secondary', isActive);
        btn.classList.toggle('text-white', isActive);
        btn.classList.toggle('btn-outline-secondary', !isActive);
    }

    updateDistrictSummary() {
        const count = this.filters.districts.size;
        const districtCount = document.getElementById('selectedDistrictCount');
        const districtSummary = document.getElementById('districtSummary');
        if (districtCount) districtCount.textContent = count;
        if (districtSummary) districtSummary.textContent = count ? `${count} distritos` : 'Todos';
    }

    updateCounters(sedes) {
        const total = document.getElementById('totalSedes');
        const active = document.getElementById('activeSedesCount');
        const mode = document.getElementById('mapModeLabel');
        const visibleCount = document.getElementById('visibleSedesCount');

        if (total) total.textContent = sedes.length;
        if (visibleCount) visibleCount.textContent = sedes.length;
        if (active) {
            let activeCount = 0;
            for (const sede of sedes) {
                if (this.isActive(sede)) activeCount += 1;
            }
            active.textContent = activeCount;
        }
        if (mode) mode.textContent = this.filters.nearby ? 'Cercanas activas' : 'Sedes filtradas';
    }

    getReferenceCenter() {
        return this.referenceLocation || this.filters.userLocation;
    }

    getSedePosition(sede) {
        if (sede?._position) return sede._position;
        return this.parseSedePosition(sede?.coordenadas_gps);
    }

    parseSedePosition(value) {
        if (!value) return null;
        const [lat, lng] = String(value).split(',').map(Number);
        if (Number.isNaN(lat) || Number.isNaN(lng)) return null;
        return { lat, lng };
    }

    isActive(sede) {
        if (typeof sede?._active === 'boolean') return sede._active;
        return String(sede.activo) !== '0';
    }

    normalizeFrequency(value) {
        return (value || '').toString().trim().toLowerCase();
    }

    formatDistance(value) {
        if (value === null || value === undefined) return '';
        if (value < 1) return `${Math.round(value * 1000)} m`;
        return `${value.toFixed(1)} km`;
    }

    calculateDistance(lat1, lon1, lat2, lon2) {
        const R = 6371;
        const dLat = this.deg2rad(lat2 - lat1);
        const dLon = this.deg2rad(lon2 - lon1);
        const a =
            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(this.deg2rad(lat1)) * Math.cos(this.deg2rad(lat2)) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return R * c;
    }

    deg2rad(deg) {
        return deg * (Math.PI / 180);
    }

    getUserLocation(silent = false, activateNearby = false) {
        if (!navigator.geolocation) {
            if (!silent) showToast('Tu navegador no soporta geolocalizacion', 'warning');
            return;
        }

        navigator.geolocation.getCurrentPosition(
            (position) => {
                const pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };

                this.filters.userLocation = pos;
                this.updateUserMarker(pos);

                if (activateNearby) {
                    this.filters.nearby = true;
                    this.updateNearbyControls();
                    this.scheduleApplyFilters({ forceFit: true });
                }

                if (!silent) {
                    this.map.panTo(pos);
                    this.map.setZoom(15);
                }
            },
            () => {
                if (!silent) showToast('Error al obtener ubicacion', 'warning');
                this.filters.nearby = false;
                this.updateNearbyControls();
            }
        );
    }

    updateUserMarker(pos) {
        if (!this.userMarker) {
            this.userMarker = this.createUtilityMarker(pos, 'Mi ubicacion', '#0d6efd');

            this.userCircle = new google.maps.Circle({
                strokeColor: '#0d6efd',
                strokeOpacity: 0.75,
                strokeWeight: 1,
                fillColor: '#0d6efd',
                fillOpacity: 0.12,
                map: this.map,
                center: pos,
                radius: 500
            });
        } else {
            this.setMarkerPosition(this.userMarker, pos);
            this.userCircle.setCenter(pos);
        }
    }

    escapeHtml(value) {
        return String(value ?? '')
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#039;');
    }
}

window.mapController = new MapController();
