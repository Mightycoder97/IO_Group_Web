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
        const searchInput = document.getElementById('mapSearchInput');
        if (searchInput) {
            searchInput.addEventListener('input', (e) => {
                clearTimeout(this.searchDebounce);
                this.searchDebounce = setTimeout(() => this.filterSedes(e.target.value), 300);
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
                this.renderMarkers(this.sedes);
            }
        } catch (error) {
            console.error('Error loading sedes:', error);
            showToast('Error cargando mapa', 'danger');
        }
    }

    renderMarkers(sedesToRender) {
        // Clear existing markers
        if (this.markerCluster) {
            this.markerCluster.clearMarkers();
        }
        this.markers.forEach(m => m.map = null);
        this.markers = [];

        const bounds = new google.maps.LatLngBounds();

        this.markers = sedesToRender.map(sede => {
            if (!sede.coordenadas_gps) return null;

            const [lat, lng] = sede.coordenadas_gps.split(',').map(Number);
            if (isNaN(lat) || isNaN(lng)) return null;

            const position = { lat, lng };
            bounds.extend(position);

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
        } else {
            // No action needed as map is set properly in constructor
        }

        // Fit bounds only on initial load or empty search
        if (!this.hasFitBounds && this.markers.length > 0) {
            this.map.fitBounds(bounds);
            this.hasFitBounds = true;
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

    filterSedes(query) {
        query = query.toLowerCase().trim();
        if (!query) {
            this.renderMarkers(this.sedes);
            return;
        }

        const filtered = this.sedes.filter(s =>
            (s.nombre_comercial && s.nombre_comercial.toLowerCase().includes(query)) ||
            (s.direccion && s.direccion.toLowerCase().includes(query)) ||
            (s.distrito && s.distrito.toLowerCase().includes(query))
        );

        this.renderMarkers(filtered);
    }

    locateUser() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                (position) => {
                    const pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude,
                    };

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
                            radius: position.coords.accuracy,
                        });
                    } else {
                        this.userMarker.position = pos;
                        this.userCircle.setCenter(pos);
                        this.userCircle.setRadius(position.coords.accuracy);
                    }

                    this.map.panTo(pos);
                    this.map.setZoom(15);
                },
                () => {
                    showToast('Error al obtener ubicación', 'warning');
                }
            );
        } else {
            showToast('Tu navegador no soporta geolocalización', 'warning');
        }
    }
}

// Instantiate
window.mapController = new MapController();
