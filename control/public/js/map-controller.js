/**
 * IO Group - Map Controller
 * Map tools for address search, active nearby sedes, frequency and district filters.
 */

class MapController {
    constructor() {
        this.map = null;
        this.markers = [];
        this.markerById = new Map();
        this.markerCluster = null;
        this.sedes = [];
        this.filteredSedes = [];
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

        const { Map } = await google.maps.importLibrary('maps');
        const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary('marker');
        const { Autocomplete } = await google.maps.importLibrary('places');

        this.AdvancedMarkerElement = AdvancedMarkerElement;
        this.PinElement = PinElement;
        this.Autocomplete = Autocomplete;
        this.geocoder = new google.maps.Geocoder();

        this.map = new Map(document.getElementById('map'), {
            center: this.defaultLocation,
            zoom: 11,
            disableDefaultUI: true,
            clickableIcons: false,
            gestureHandling: 'greedy',
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
                this.applyFilters({ forceFit: this.filters.nearby });
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
            sedeInput.addEventListener('input', (event) => {
                this.handleSedeSearch(event.target.value.toLowerCase(), resultsContainer);
            });

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

            this.applyFilters({ forceFit: this.filters.nearby });
        });

        const radiusRange = document.getElementById('radiusRange');
        radiusRange?.addEventListener('input', (event) => {
            this.filters.radius = Number(event.target.value) || 10;
            this.updateRadiusLabel();
            this.updateReferenceCircle();
            if (this.filters.nearby) this.applyFilters({ forceFit: true });
        });

        this.map.addListener('click', (event) => {
            if (!this.filters.nearby) return;
            this.setReferenceLocation({ lat: event.latLng.lat(), lng: event.latLng.lng() }, 'Punto de busqueda');
            this.applyFilters({ forceFit: true });
        });
    }

    async loadSedes() {
        try {
            const response = await api.get('/sedes?mapa=1', { cache: false });
            if (response.success) {
                this.sedes = response.data || [];
                this.populateDistrictFilter();
                this.applyFilters({ forceFit: !this.hasFitBounds });
            }
        } catch (error) {
            console.error('Error loading sedes:', error);
            showToast('Error cargando mapa', 'danger');
        }
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

        const matches = this.sedes
            .filter(s => (
                (s.nombre_comercial || '').toLowerCase().includes(query) ||
                (s.direccion || '').toLowerCase().includes(query) ||
                (s.empresa_razon_social || '').toLowerCase().includes(query) ||
                (s.empresa_ruc || '').toLowerCase().includes(query)
            ))
            .slice(0, 12);

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
                    const sede = this.sedes.find(item => String(item.id_sede) === String(btn.dataset.sedeId));
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
        if (this.selectedSedes.has(sede.id_sede)) return;

        this.filters.nearby = false;
        this.updateNearbyControls();
        this.selectedSedes.add(sede.id_sede);
        this.renderSelectedSedes();
        this.applyFilters({ forceFit: true });
    }

    removeSedeFromSelection(id) {
        this.selectedSedes.delete(id);
        this.renderSelectedSedes();
        this.applyFilters({ forceFit: true });
    }

    clearMapSelection() {
        this.clearSelectedSedes();
        this.clearNearbySearch();
        this.clearDistricts();
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

        const sedes = this.sedes.filter(sede => this.selectedSedes.has(sede.id_sede));
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
            const district = (sede.distrito || '').trim();
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
                this.applyFilters({ forceFit: this.filters.nearby });
            });
        });

        this.updateDistrictSummary();
    }

    clearDistricts() {
        this.filters.districts.clear();
        document.querySelectorAll('.filter-district').forEach(cb => { cb.checked = false; });
        this.updateDistrictSummary();
        this.applyFilters({ forceFit: this.filters.nearby });
    }

    applyFilters(options = {}) {
        if (!this.sedes) return;

        let sourceSet = this.selectedSedes.size
            ? this.sedes.filter(s => this.selectedSedes.has(s.id_sede))
            : [...this.sedes];

        const center = this.getReferenceCenter();
        const keepNoFrequency = this.filters.frequencies.size === this.allFrequencies.length;

        let filtered = sourceSet
            .map(sede => ({ ...sede, _distanceKm: null }))
            .filter(sede => {
                const frequency = this.normalizeFrequency(sede.frecuencia);
                if (frequency && !this.filters.frequencies.has(frequency)) return false;
                if (!frequency && !keepNoFrequency) return false;

                if (this.filters.districts.size > 0) {
                    const district = (sede.distrito || '').trim();
                    if (!this.filters.districts.has(district)) return false;
                }

                if (this.filters.nearby) {
                    if (!center || !this.isActive(sede)) return false;
                    const position = this.getSedePosition(sede);
                    if (!position) return false;
                    const distance = this.calculateDistance(center.lat, center.lng, position.lat, position.lng);
                    if (distance > this.filters.radius) return false;
                    sede._distanceKm = distance;
                }

                return true;
            });

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
        if (this.markerCluster) this.markerCluster.clearMarkers();
        this.markers.forEach(marker => { marker.map = null; });
        this.markers = [];
        this.markerById.clear();

        const bounds = new google.maps.LatLngBounds();
        let hasValidBounds = false;

        this.markers = sedesToRender.map(sede => {
            const position = this.getSedePosition(sede);
            if (!position) return null;

            bounds.extend(position);
            hasValidBounds = true;

            const frequency = this.normalizeFrequency(sede.frecuencia);
            const pin = new this.PinElement({
                scale: this.filters.nearby ? 1.05 : 0.95,
                background: this.isActive(sede) ? (this.frequencyColors[frequency] || '#198754') : '#6c757d',
                borderColor: '#ffffff',
                glyphColor: '#ffffff'
            });

            const markerOptions = {
                position,
                title: sede.nombre_comercial,
                content: pin.element
            };
            if (!this.markerCluster) markerOptions.map = this.map;

            const marker = new this.AdvancedMarkerElement(markerOptions);
            marker.addListener('gmp-click', () => this.showInfoWindow(marker, sede));
            this.markerById.set(String(sede.id_sede), marker);
            return marker;
        }).filter(Boolean);

        if (this.markerCluster) {
            this.markerCluster.addMarkers(this.markers);
        }

        if ((forceFit || !this.hasFitBounds) && hasValidBounds && this.markers.length) {
            if (this.markers.length === 1) {
                this.map.setCenter(this.markers[0].position);
                this.map.setZoom(16);
            } else {
                this.map.fitBounds(bounds, 80);
            }
            this.hasFitBounds = true;
        }
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
                    <small>${this.escapeHtml(sede.distrito || '')} · ${this.escapeHtml(this.frequencyLabels[this.normalizeFrequency(sede.frecuencia)] || sede.frecuencia || 'Sin frecuencia')}</small>
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
        const marker = this.markerById.get(String(sede.id_sede));
        const position = this.getSedePosition(sede);
        if (!position) return;

        this.map.panTo(position);
        this.map.setZoom(Math.max(this.map.getZoom(), 15));
        if (marker) this.showInfoWindow(marker, sede);
    }

    fitCurrentResults() {
        this.renderMarkers(this.filteredSedes, true);
    }

    setReferenceLocation(pos, title = 'Referencia') {
        this.referenceLocation = pos;

        if (!pos) {
            if (this.referenceMarker) {
                this.referenceMarker.map = null;
                this.referenceMarker = null;
            }
            if (this.referenceCircle) {
                this.referenceCircle.setMap(null);
                this.referenceCircle = null;
            }
            return;
        }

        if (!this.referenceMarker) {
            const pin = new this.PinElement({
                scale: 1.15,
                background: '#dc3545',
                borderColor: '#ffffff',
                glyphColor: '#ffffff'
            });

            this.referenceMarker = new this.AdvancedMarkerElement({
                position: pos,
                map: this.map,
                title,
                content: pin.element,
                gmpDraggable: true
            });

            this.referenceMarker.addListener('dragend', (event) => {
                this.referenceLocation = { lat: event.latLng.lat(), lng: event.latLng.lng() };
                this.updateReferenceCircle();
                this.applyFilters({ forceFit: true });
            });
        } else {
            this.referenceMarker.position = pos;
            this.referenceMarker.title = title;
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

    clearNearbySearch() {
        this.filters.nearby = false;
        this.referenceLocation = null;
        this.setReferenceLocation(null);
        this.updateNearbyControls();
        const input = document.getElementById('addressSearch');
        if (input) input.value = '';
        this.applyFilters({ forceFit: true });
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
        if (active) active.textContent = sedes.filter(sede => this.isActive(sede)).length;
        if (mode) mode.textContent = this.filters.nearby ? 'Cercanas activas' : 'Sedes filtradas';
    }

    getReferenceCenter() {
        return this.referenceLocation || this.filters.userLocation;
    }

    getSedePosition(sede) {
        if (!sede?.coordenadas_gps) return null;
        const [lat, lng] = sede.coordenadas_gps.split(',').map(Number);
        if (Number.isNaN(lat) || Number.isNaN(lng)) return null;
        return { lat, lng };
    }

    isActive(sede) {
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
                    this.applyFilters({ forceFit: true });
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
            const pin = new this.PinElement({
                scale: 1,
                background: '#0d6efd',
                borderColor: '#ffffff',
                glyphColor: '#ffffff'
            });

            this.userMarker = new this.AdvancedMarkerElement({
                position: pos,
                map: this.map,
                title: 'Mi ubicacion',
                content: pin.element
            });

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
            this.userMarker.position = pos;
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
