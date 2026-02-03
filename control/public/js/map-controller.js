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
            search: '', // Now used for CLIENT search (filter list)
            frequencies: new Set(['Diario', 'Interdiario', 'Semanal', 'Quincenal']),
            districts: new Set(),
            nearby: false,
            radius: 10, // km
            userLocation: null
        };
    }

    async init() {
        // Wait for Google Maps API
        if (!window.google || !window.google.maps) {
            console.error('Google Maps API not loaded');
            return;
        }

        // Import libraries (Required for loading=async)
        // Import libraries (Required for loading=async)
        const { Map } = await google.maps.importLibrary("maps");
        const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary("marker");
        const { Autocomplete } = await google.maps.importLibrary("places");

        // Initialize Geocoder
        this.geocoder = new google.maps.Geocoder();

        const mapOptions = {
            center: this.defaultLocation,
            zoom: 12,
            disableDefaultUI: true, // Custom UI for cleaner look
            zoomControl: false,      // We'll add custom zoom buttons
            mapId: "DEMO_MAP_ID",    // Required for AdvancedMarkerElement
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
        // Search Input (Google Places Autocomplete)
        const searchInput = document.getElementById('mapSearchInput');
        if (searchInput) {
            // Initialize Autocomplete
            const autocomplete = new this.Autocomplete(searchInput, {
                componentRestrictions: { country: "pe" },
                fields: ["formatted_address", "geometry", "name"],
                strictBounds: false,
            });

            // Bind to map bounds (bias results to current view)
            autocomplete.bindTo("bounds", this.map);

            // Listen for selection
            autocomplete.addListener("place_changed", () => {
                const place = autocomplete.getPlace();
                this.handlePlaceSelect(place);
            });

            // Keep local filter if user just types but doesn't select?
            // User requested: "una vez que seleccione una de la lista desplegable... se ubicara"
            // So we primarily rely on selection.
            // But if they type "Starbucks" and don't select, maybe we still want to filter local names?
            // Let's keep local filter on 'input' for simple text matching of existing pins.
            searchInput.addEventListener('input', (e) => {
                this.filters.search = e.target.value.toLowerCase().trim();
                this.applyFilters();
            });
        }

        // Map Click -> Place Reference Pin
        this.map.addListener('click', (e) => {
            if (e.latLng) {
                const pos = { lat: e.latLng.lat(), lng: e.latLng.lng() };
                this.setReferenceLocation(pos, "Ubicación seleccionada");
                // DO NOT auto-enable nearby on click unless requested.
                // User requirement: "que me deje poner un pin... y ver los clientes cercanos"
                // Usually implies they might want to toggle it manually or it auto-updates if already on.
                // Keeping current behavior: updates reference, if nearby is on it updates results.
            }
        });

        // Custom Zoom Controls
        document.getElementById('zoomIn')?.addEventListener('click', () => this.map.setZoom(this.map.getZoom() + 1));
        document.getElementById('zoomOut')?.addEventListener('click', () => this.map.setZoom(this.map.getZoom() - 1));

        // My Location
        document.getElementById('btnMyLocation')?.addEventListener('click', () => this.locateUser());
    }

    handlePlaceSelect(place) {
        if (!place.geometry || !place.geometry.location) {
            // User entered the name of a Place that was not suggested and passed the 'place_changed' event
            showToast("No se encontraron detalles para: " + place.name, 'warning');
            return;
        }

        const pos = {
            lat: place.geometry.location.lat(),
            lng: place.geometry.location.lng()
        };

        // 1. Set Reference Location
        this.setReferenceLocation(pos, place.name || place.formatted_address);

        // 2. Center Map
        if (place.geometry.viewport) {
            this.map.fitBounds(place.geometry.viewport);
        } else {
            this.map.setCenter(pos);
            this.map.setZoom(15);
        }

        // 3. Auto-Enable Nearby Filter
        const nearbyToggle = document.getElementById('nearbyToggle');
        if (nearbyToggle && !nearbyToggle.checked) {
            nearbyToggle.checked = true;
            this.filters.nearby = true;
            document.getElementById('radiusRange').disabled = false;
        }

        // 4. Apply Filters (Nearby filter usage is triggered by setReferenceLocation + this.filters.nearby update)
        this.applyFilters();

        // Clear search text filter so it doesn't hide nearby results that don't match the address string
        // (Use case: Search "Av Arequipa", select it. We want to see ALL clients near Av Arequipa, not clients named "Av Arequipa")
        this.filters.search = '';
        // We might want to keep the text in the input for visibility, but clear the *filter* logic
        // But setupEventListeners listens to 'input'. 
        // If we leave text in input, 'input' event won't fire automatically, so filters.search remains as is.
        // We should explicitly clear `this.filters.search`.
        // Optionally, clear the input or leave it? Leaving it is better UX for "Location: X".
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
        console.log('Populating district filter... Sedes count:', this.sedes ? this.sedes.length : 0);
        if (!this.sedes || this.sedes.length === 0) return;

        const container = document.getElementById('districtFilters');
        if (!container) {
            console.warn('District filter container not found');
            return;
        }

        // Extract and sort districts
        const districts = [...new Set(this.sedes.map(s => s.distrito).filter(d => d && d.trim().length > 0))].sort();

        if (districts.length === 0) {
            container.innerHTML = '<div class="text-muted small">No se encontraron distritos</div>';
            return;
        }

        container.innerHTML = ''; // Clear loading spinner

        districts.forEach(dist => {
            const safeId = dist.replace(/[^a-zA-Z0-9]/g, '_');
            const div = document.createElement('div');
            div.className = 'form-check';
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

        // Create or Update Blue Marker
        if (!this.referenceMarker) {
            const pin = new this.PinElement({
                scale: 1.2,
                background: '#0d6efd', // Blue
                borderColor: '#ffffff',
                glyphColor: '#ffffff',
                glyphText: '★'
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
                if (this.filters.nearby) this.applyFilters();
            });

        } else {
            this.referenceMarker.position = pos;
            this.referenceMarker.title = title;
        }

        // If nearby filter is ON, re-calc distances
        if (this.filters.nearby) {
            this.applyFilters();
        }
    }

    applyFilters() {
        if (!this.sedes) return;

        const filtered = this.sedes.filter(s => {
            // 1. Search Filter
            const matchesSearch = !this.filters.search ||
                (s.nombre_comercial && s.nombre_comercial.toLowerCase().includes(this.filters.search)) ||
                (s.direccion && s.direccion.toLowerCase().includes(this.filters.search)) ||
                (s.distrito && s.distrito.toLowerCase().includes(this.filters.search));

            if (!matchesSearch) return false;

            // 2. Frequency Filter (Case Insensitive)
            if (s.frecuencia) {
                const normalizedFreq = s.frecuencia.trim().toLowerCase();
                const activeFilters = Array.from(this.filters.frequencies).map(f => f.toLowerCase());
                if (!activeFilters.includes(normalizedFreq)) return false;
            }

            // 3. District Filter (New)
            if (this.filters.districts.size > 0) {
                if (!s.distrito || !this.filters.districts.has(s.distrito)) return false;
            }

            // 4. Nearby Filter
            if (this.filters.nearby && this.filters.userLocation && s.coordenadas_gps) {
                const [lat, lng] = s.coordenadas_gps.split(',').map(Number);
                if (!isNaN(lat) && !isNaN(lng)) {
                    const distance = this.calculateDistance(
                        this.filters.userLocation.lat,
                        this.filters.userLocation.lng,
                        lat,
                        lng
                    );
                    if (distance > this.filters.radius) return false;
                }
            }

            return true;
        });

        document.getElementById('totalSedes').textContent = filtered.length;

        // Pass 'true' for shouldFitBounds if there is an active search or filter that warrants it
        const hasActiveSearch = this.filters.search.length > 0;
        this.renderMarkers(filtered, hasActiveSearch);
    }

    renderMarkers(sedesToRender, shouldFitBounds = false) {
        // Clear existing markers
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

        // Add to Clusterer - AdvancedMarkerElement is supported by newer markerclusterer
        if (this.markerCluster) {
            this.markerCluster.addMarkers(this.markers);
        }

        // Fit bounds logic: Initial load OR explicit request (search)
        if ((!this.hasFitBounds || shouldFitBounds) && hasValidBounds && this.markers.length > 0) {
            this.map.fitBounds(bounds);
            this.hasFitBounds = true;

            // If only 1 marker, zoom out a bit so it's not too close
            if (this.markers.length === 1) {
                const listener = google.maps.event.addListener(this.map, "idle", () => {
                    if (this.map.getZoom() > 16) this.map.setZoom(16);
                    google.maps.event.removeListener(listener);
                });
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
        const R = 6371; // Radius of the earth in km
        const dLat = this.deg2rad(lat2 - lat1);
        const dLon = this.deg2rad(lon2 - lon1);
        const a =
            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(this.deg2rad(lat1)) * Math.cos(this.deg2rad(lat2)) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        const d = R * c; // Distance in km
        return d;
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
                radius: 500, // Default visual radius or derived from accuracy
            });
        } else {
            this.userMarker.position = pos;
            this.userCircle.setCenter(pos);
        }
    }
}

// Instantiate
window.mapController = new MapController();
