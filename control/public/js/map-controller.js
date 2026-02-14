/**
 * IO Group - Map Controller
 * Optimized for performance using MarkerClusterer and efficient DOM updates.
 */

class MapController {
    constructor() {
        this.map = null;
        this.markers = [];
        this.markerCluster = null;
        this.sedes = [];
        this.infoWindow = null;
        this.userMarker = null;
        // Locations
        this.userMarker = null;
        this.userCircle = null;
        this.referenceMarker = null; // Blue pin for "Center"
        this.referenceLocation = null; // { lat, lng }

        this.defaultLocation = { lat: -12.0464, lng: -77.0428 }; // Lima
        this.searchDebounce = null;
        this.MarkerClass = null;

        // Services
        this.geocoder = null;

        // Filter State
        this.filters = {
            search: '',
            frequencies: new Set(['Diario', 'Interdiario', 'Semanal', 'Quincenal', 'Mensual']),
            districts: new Set(),
            nearby: false,
            radius: 10, // km
            userLocation: null
        };
        this.selectedSedes = new Set(); // Multi-select state
    }

    async init() {
        // Wait for Google Maps API
        if (!window.google || !window.google.maps) {
            console.error('Google Maps API not loaded');
            return;
        }

        const { Map } = await google.maps.importLibrary("maps");
        const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary("marker");
        const { Autocomplete } = await google.maps.importLibrary("places");

        this.geocoder = new google.maps.Geocoder();

        const mapOptions = {
            center: this.defaultLocation,
            zoom: 12,
            disableDefaultUI: true,
            zoomControl: false,
            mapId: "DEMO_MAP_ID",
            clickableIcons: false, // Reduce clutter
        };

        this.map = new Map(document.getElementById('map'), mapOptions);
        this.infoWindow = new google.maps.InfoWindow();

        this.AdvancedMarkerElement = AdvancedMarkerElement;
        this.PinElement = PinElement;
        this.Autocomplete = Autocomplete;

        this.setupEventListeners();
        await this.loadSedes();
    }

    setupEventListeners() {
        // 1. Frequency Filters
        document.querySelectorAll('.filter-freq').forEach(btn => {
            const freq = btn.dataset.freq;
            // Initial State check
            if (this.filters.frequencies.has(freq)) {
                this.updateFreqBtnVisuals(btn, true);
            }

            btn.addEventListener('click', (e) => {
                const freq = e.target.dataset.freq;
                if (this.filters.frequencies.has(freq)) {
                    this.filters.frequencies.delete(freq);
                    this.updateFreqBtnVisuals(e.target, false);
                } else {
                    this.filters.frequencies.add(freq);
                    this.updateFreqBtnVisuals(e.target, true);
                }
                this.applyFilters();
            });
        });

        // 2. Address Search (Google Places)
        const addressInput = document.getElementById('addressSearch');
        if (addressInput) {
            const autocomplete = new this.Autocomplete(addressInput, {
                componentRestrictions: { country: "pe" },
                fields: ["geometry", "name", "formatted_address"],
            });
            autocomplete.bindTo("bounds", this.map);
            autocomplete.addListener("place_changed", () => {
                const place = autocomplete.getPlace();
                this.handleAddressSelect(place);
                addressInput.value = ''; // Clear after selection
            });
        }

        // 3. Smart Sede Search (Input)
        const sedeInput = document.getElementById('sedeSearch');
        const resultsContainer = document.getElementById('sedeSearchResults');

        if (sedeInput) {
            sedeInput.addEventListener('input', (e) => {
                const query = e.target.value.toLowerCase();
                this.handleSedeSearch(query, resultsContainer);
            });

            // Close results when clicking outside
            document.addEventListener('click', (e) => {
                if (!sedeInput.contains(e.target) && !resultsContainer.contains(e.target)) {
                    resultsContainer.classList.add('d-none');
                }
            });
        }

        // 4. Clear Map Button
        document.getElementById('clearMapBtn')?.addEventListener('click', () => {
            this.clearMapSelection();
        });
    }

    updateFreqBtnVisuals(btn, isActive) {
        if (isActive) {
            btn.classList.remove('btn-outline-secondary');
            btn.classList.add('btn-secondary', 'text-white');
        } else {
            btn.classList.remove('btn-secondary', 'text-white');
            btn.classList.add('btn-outline-secondary');
        }
    }

    handleAddressSelect(place) {
        if (!place.geometry || !place.geometry.location) {
            showToast("No se encontraron detalles de ubicación", 'warning');
            return;
        }

        const pos = {
            lat: place.geometry.location.lat(),
            lng: place.geometry.location.lng()
        };

        // Create Reference Pin
        this.setReferenceLocation(pos, place.name || place.formatted_address);

        // View: fit bounds or center
        if (place.geometry.viewport) {
            this.map.fitBounds(place.geometry.viewport);
        } else {
            this.map.setCenter(pos);
            this.map.setZoom(15);
        }
    }

    handleSedeSearch(query, container) {
        if (query.length < 2) {
            container.classList.add('d-none');
            return;
        }

        const matches = this.sedes.filter(s =>
            s.nombre_comercial.toLowerCase().includes(query) ||
            s.direccion.toLowerCase().includes(query)
        ).slice(0, 10); // Limit to 10 suggestions

        if (matches.length === 0) {
            container.innerHTML = '<div class="list-group-item small text-muted">No se encontraron resultados</div>';
        } else {
            container.innerHTML = '';
            matches.forEach(sede => {
                const item = document.createElement('button');
                item.className = 'list-group-item list-group-item-action suggestion-item small border-0 border-bottom';
                item.innerHTML = `
                    <div class="fw-bold text-dark">${sede.nombre_comercial}</div>
                    <div class="text-muted" style="font-size: 0.75rem;">${sede.direccion}</div>
                `;
                item.onclick = () => {
                    this.addSedeToSelection(sede);
                    container.classList.add('d-none');
                    document.getElementById('sedeSearch').value = '';
                };
                container.appendChild(item);
            });
        }
        container.classList.remove('d-none');
    }

    addSedeToSelection(sede) {
        // Avoid duplicates
        if (this.selectedSedes.has(sede.id_sede)) return;

        this.selectedSedes.add(sede.id_sede);

        // Add Chip Visual
        const chipContainer = document.getElementById('selectedSedesContainer');
        const chip = document.createElement('div');
        chip.className = 'sede-chip';
        chip.innerHTML = `
            ${sede.nombre_comercial}
            <button type="button" class="btn-close" aria-label="Remove"></button>
        `;
        chip.querySelector('.btn-close').onclick = () => {
            this.removeSedeFromSelection(sede.id_sede);
            chip.remove();
        };
        chipContainer.appendChild(chip);

        // Update Map
        this.applyFilters({ forceFit: true });
    }

    removeSedeFromSelection(id) {
        this.selectedSedes.delete(id);
        this.applyFilters();
    }

    clearMapSelection() {
        this.selectedSedes.clear();
        document.getElementById('selectedSedesContainer').innerHTML = '';
        this.referenceMarker = null; // Also clear address pin? Maybe.
        this.setReferenceLocation(null); // Clear ref
        this.applyFilters();
    }

    async loadSedes() {
        try {
            const response = await api.get('/sedes?mapa=1');
            if (response.success) {
                this.sedes = response.data;
                this.populateDistrictFilter();
                this.applyFilters();
            }
        } catch (error) {
            console.error('Error loading sedes:', error);
            showToast('Error cargando mapa', 'danger');
        }
    }

    populateDistrictFilter() {
        if (!this.sedes || this.sedes.length === 0) return;

        const container = document.getElementById('districtFilters');
        if (!container) return;

        const districts = [...new Set(this.sedes.map(s => s.distrito).filter(d => d && d.trim().length > 0))].sort();

        if (districts.length === 0) {
            container.innerHTML = '<div class="text-muted small">No se encontraron distritos</div>';
            return;
        }

        container.innerHTML = '';

        districts.forEach(dist => {
            const safeId = dist.replace(/[^a-zA-Z0-9]/g, '_');
            const div = document.createElement('div');
            div.className = 'form-check mb-1';
            div.innerHTML = `
                <input class="form-check-input filter-district" type="checkbox" value="${dist}" id="dist_${safeId}">
                <label class="form-check-label small" for="dist_${safeId}">${dist}</label>
            `;
            container.appendChild(div);
        });

        // Listeners
        container.querySelectorAll('.filter-district').forEach(cb => {
            cb.addEventListener('change', (e) => {
                if (e.target.checked) {
                    this.filters.districts.add(e.target.value);
                } else {
                    this.filters.districts.delete(e.target.value);
                }
                this.applyFilters();
            });
        });
    }

    setReferenceLocation(pos, title = "Referencia") {
        this.referenceLocation = pos;

        if (!pos) {
            if (this.referenceMarker) {
                this.referenceMarker.map = null;
                this.referenceMarker = null;
            }
            return;
        }

        // Create or Update Blue Marker
        if (!this.referenceMarker) {
            const pin = new this.PinElement({
                scale: 1.2,
                background: '#dc3545', // Red for address
                borderColor: '#ffffff',
                glyphColor: '#ffffff',
                glyphHtml: '<i class="bi bi-geo-alt-fill"></i>'
            });

            this.referenceMarker = new this.AdvancedMarkerElement({
                position: pos,
                map: this.map,
                title: title,
                content: pin,
                gmpDraggable: true
            });

            // Update on drag end
            this.referenceMarker.addListener('dragend', (e) => {
                this.referenceLocation = { lat: e.latLng.lat(), lng: e.latLng.lng() };
                // Logic based on drag?
            });

        } else {
            this.referenceMarker.position = pos;
            this.referenceMarker.title = title;
        }
    }

    applyFilters(options = {}) {
        if (!this.sedes) return;

        // Logic:
        // 1. If NO sedes selected and NO address search (referenceLocation) -> Show ALL (clustered) filtered by Frequency.
        // 2. If sedes selected -> Show ONLY selected sedes (filtered by Frequency).
        // 3. If address selected -> Show ALL nearby (filtered by Frequency).

        // Wait, User asked for "Sedes listing NO LONGER WANTED". 
        // Interpretation: Default view could be either EMPTY or CLUSTERED. 
        // "Minimalist" usually implies clean map. 
        // Let's go with: 
        // - If nothing selected -> Show NOTHING? Or Show Clusters?
        // - "Smart search of sedes... allow selecting several". This implies the map builds up as you select.
        // - Let's Default to SHOWING ALL CLUSTERED (it's better for context) but allow cleaning.

        // Refined Logic (Pro):
        // Base set: If 'selectedSedes' has items, use those. ELSE use ALL.
        // Filter that base set by Frequency.

        let sourceSet = this.sedes;
        const isSelectionMode = this.selectedSedes.size > 0;

        if (isSelectionMode) {
            sourceSet = this.sedes.filter(s => this.selectedSedes.has(s.id_sede));
        }

        const filtered = sourceSet.filter(s => {
            // Frequency Filter
            if (s.frecuencia) {
                const normalizedFreq = s.frecuencia.trim().toLowerCase();
                const activeFilters = Array.from(this.filters.frequencies).map(f => f.toLowerCase());
                if (!activeFilters.includes(normalizedFreq)) return false;
            }
            return true;
        });

        // Visible Count Update
        const countSpan = document.getElementById('visibleSedesCount');
        if (countSpan) countSpan.textContent = filtered.length;

        this.renderMarkers(filtered, options.forceFit || false);
    }

    renderMarkers(sedesToRender, forceFit = false) {
        // Clear existing
        if (this.markerCluster) {
            this.markerCluster.clearMarkers();
        }
        this.markers.forEach(m => m.map = null);
        this.markers = [];

        const bounds = new google.maps.LatLngBounds();
        let hasValidBounds = false;

        this.markers = sedesToRender.map(sede => {
            if (!sede.coordenadas_gps) return null;
            const [lat, lng] = sede.coordenadas_gps.split(',').map(Number);
            if (isNaN(lat) || isNaN(lng)) return null;

            const position = { lat, lng };
            bounds.extend(position);
            hasValidBounds = true;

            const pin = new this.PinElement({
                scale: 1,
                background: '#1B5E20',
                borderColor: '#ffffff',
                glyphColor: '#ffffff'
            });

            const marker = new this.AdvancedMarkerElement({
                position,
                map: this.map,
                title: sede.nombre_comercial,
                content: pin
            });

            marker.addListener('gmp-click', () => {
                this.showInfoWindow(marker, sede);
            });

            return marker;
        }).filter(m => m !== null);

        if (this.markerCluster) {
            this.markerCluster.addMarkers(this.markers);
        }

        // Re-fit logic
        // If it's a "Force Fit" (search result) -> Do it.
        // If it's the first load -> Do it.
        // If we are filtering, we generally might not want to jump around unless results are 0 or changed drastically?
        // Simpler: fit bounds if forceFit is true OR if we have not fit yet.
        if (forceFit || !this.hasFitBounds) {
            if (hasValidBounds && this.markers.length > 0) {
                this.map.fitBounds(bounds);
                this.hasFitBounds = true;
            }
        }
    }

    showInfoWindow(marker, sede) {
        const content = `
            <div class="map-info-window">
                <h6 class="mb-1">${sede.nombre_comercial}</h6>
                <p class="mb-1 text-muted small"><i class="bi bi-geo-alt"></i> ${sede.direccion}</p>
                ${sede.frecuencia ? `<span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill">Frec: ${sede.frecuencia}</span>` : ''}
                <div class="mt-2 text-end">
                    <a href="../sedes/cartilla.html?id=${sede.id_sede}" class="btn btn-sm btn-primary rounded-pill px-3">Ver Detalle</a>
                </div>
            </div>
        `;
        this.infoWindow.setContent(content);
        this.infoWindow.open(this.map, marker);
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

    getUserLocation(silent = false) {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                (position) => {
                    const pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude,
                    };

                    this.filters.userLocation = pos;
                    this.updateUserMarker(pos);

                    if (!silent) {
                        this.map.panTo(pos);
                        this.map.setZoom(15);
                        // If nearby toggle is on, re-apply filters now that we have location
                        if (this.filters.nearby) this.applyFilters();
                    }
                },
                () => {
                    if (!silent) showToast('Error al obtener ubicación', 'warning');
                }
            );
        } else {
            if (!silent) showToast('Tu navegador no soporta geolocalización', 'warning');
        }
    }

    updateUserMarker(pos) {
        if (!this.userMarker) {
            const pin = new this.PinElement({
                scale: 1,
                background: '#4285F4',
                borderColor: '#ffffff',
                glyphColor: '#ffffff'
            });

            this.userMarker = new this.AdvancedMarkerElement({
                position: pos,
                map: this.map,
                title: "Mi ubicación",
                content: pin
            });

            this.userCircle = new google.maps.Circle({
                strokeColor: "#4285F4",
                strokeOpacity: 0.8,
                strokeWeight: 1,
                fillColor: "#4285F4",
                fillOpacity: 0.15,
                map: this.map,
                center: pos,
                radius: 500,
            });
        } else {
            this.userMarker.position = pos;
            this.userCircle.setCenter(pos);
        }
    }
}

// Instantiate
window.mapController = new MapController();
