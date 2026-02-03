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
        this.userCircle = null;
        this.defaultLocation = { lat: -12.0464, lng: -77.0428 }; // Lima
        this.searchDebounce = null;
        this.MarkerClass = null; // Store Marker class

        // Filter State
        this.filters = {
            search: '',
            frequencies: new Set(['Diario', 'Interdiario', 'Semanal', 'Quincenal']),
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
        const { Map } = await google.maps.importLibrary("maps");
        const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary("marker");
        // Also ensure libraries needed for MarkerClusterer or other features are ready if implicit.

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

        this.setupEventListeners();
        await this.loadSedes();
    }

    setupEventListeners() {
        // Search Input
        // Search Input
        const searchInput = document.getElementById('mapSearchInput');
        if (searchInput) {
            searchInput.addEventListener('input', (e) => {
                this.filters.search = e.target.value.toLowerCase().trim();
                this.applyFilters();
            });
        }

        // Custom Zoom Controls
        document.getElementById('zoomIn')?.addEventListener('click', () => this.map.setZoom(this.map.getZoom() + 1));
        document.getElementById('zoomOut')?.addEventListener('click', () => this.map.setZoom(this.map.getZoom() - 1));

        // My Location
        document.getElementById('btnMyLocation')?.addEventListener('click', () => this.locateUser());
    }

    async loadSedes() {
        try {
            const response = await api.get('/sedes?mapa=1');
            if (response.success) {
                this.sedes = response.data;
                this.applyFilters();
            }
        } catch (error) {
            console.error('Error loading sedes:', error);
            showToast('Error cargando mapa', 'danger');
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
