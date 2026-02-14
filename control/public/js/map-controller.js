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
        // 1. Frequency Chips
        document.querySelectorAll('.filter-chip').forEach(btn => {
            // Set initial state based on default filters
            const freq = btn.dataset.freq;
            this.updateChipVisuals(btn, this.filters.frequencies.has(freq));

            btn.addEventListener('click', (e) => {
                const freq = e.target.dataset.freq;
                if (this.filters.frequencies.has(freq)) {
                    this.filters.frequencies.delete(freq);
                    this.updateChipVisuals(e.target, false);
                } else {
                    this.filters.frequencies.add(freq);
                    this.updateChipVisuals(e.target, true);
                }
                this.applyFilters();
            });
        });

        // 2. Search Input (Google Places Autocomplete)
        const searchInput = document.getElementById('mapSearchInput');
        if (searchInput) {
            const autocomplete = new this.Autocomplete(searchInput, {
                componentRestrictions: { country: "pe" },
                fields: ["formatted_address", "geometry", "name"],
                strictBounds: false,
            });
            autocomplete.bindTo("bounds", this.map);
            autocomplete.addListener("place_changed", () => {
                const place = autocomplete.getPlace();
                this.handlePlaceSelect(place);
            });
        }

        // 3. Map Click -> Place Reference Pin + Auto Nearby
        this.map.addListener('click', (e) => {
            if (e.latLng) {
                const pos = { lat: e.latLng.lat(), lng: e.latLng.lng() };

                // Activate Nearby Mode automatically
                this.activateNearbyMode(pos, "Ubicación seleccionada");
            }
        });

        // 4. Nearby Toggle
        const nearbyToggle = document.getElementById('nearbyToggle');
        if (nearbyToggle) {
            nearbyToggle.addEventListener('change', (e) => {
                this.filters.nearby = e.target.checked;
                this.toggleRadarControls(e.target.checked);
                this.applyFilters();

                if (e.target.checked && !this.referenceLocation && !this.filters.userLocation) {
                    showToast('Haz clic en el mapa para establecer el centro', 'info');
                }
            });
        }

        // 5. Radius Slider
        const radiusRange = document.getElementById('radiusRange');
        if (radiusRange) {
            radiusRange.addEventListener('input', (e) => {
                this.filters.radius = parseInt(e.target.value);
                document.getElementById('radiusValue').textContent = this.filters.radius;
                // Debounce filter application for slider? Or live? Live is fine for < 1000 items
                this.applyFilters();
            });
        }

        // 6. Clear Districts
        document.getElementById('clearDistrictsBtn')?.addEventListener('click', () => {
            this.filters.districts.clear();
            document.querySelectorAll('.filter-district').forEach(cb => cb.checked = false);
            this.applyFilters();
        });

        // Custom Zoom Controls
        document.getElementById('zoomIn')?.addEventListener('click', () => this.map.setZoom(this.map.getZoom() + 1));
        document.getElementById('zoomOut')?.addEventListener('click', () => this.map.setZoom(this.map.getZoom() - 1));

        // My Location
        document.getElementById('btnMyLocation')?.addEventListener('click', () => this.locateUser());
    }

    updateChipVisuals(btn, isActive) {
        if (isActive) {
            btn.classList.remove('btn-light', 'text-dark');
            btn.classList.add('btn-success', 'text-white');
        } else {
            btn.classList.remove('btn-success', 'text-white');
            btn.classList.add('btn-light', 'text-dark');
        }
    }

    toggleRadarControls(enabled) {
        const controls = document.getElementById('radarControls');
        const range = document.getElementById('radiusRange');
        if (enabled) {
            controls.classList.remove('opacity-50');
            range.disabled = false;
        } else {
            controls.classList.add('opacity-50');
            range.disabled = true;
        }
    }

    activateNearbyMode(pos, title) {
        // Set State
        this.filters.nearby = true;

        // Update UI
        const toggle = document.getElementById('nearbyToggle');
        if (toggle && !toggle.checked) toggle.checked = true;
        this.toggleRadarControls(true);

        // Set Reference and Filter
        this.setReferenceLocation(pos, title);
        // setReference calls applyFilters if nearby is true
    }

    handlePlaceSelect(place) {
        if (!place.geometry || !place.geometry.location) {
            showToast("No se encontraron detalles para: " + place.name, 'warning');
            return;
        }

        const pos = {
            lat: place.geometry.location.lat(),
            lng: place.geometry.location.lng()
        };

        if (place.geometry.viewport) {
            this.map.fitBounds(place.geometry.viewport);
        } else {
            this.map.setCenter(pos);
            this.map.setZoom(15);
        }

        // Auto-Enable Nearby
        this.activateNearbyMode(pos, place.name || place.formatted_address);

        // Reset text search filter to allow seeing nearby items
        this.filters.search = '';
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

        // Apply filters
        if (this.filters.nearby) {
            this.applyFilters();
        }
    }

    applyFilters() {
        if (!this.sedes) return;

        const filtered = this.sedes.filter(s => {
            // 1. Frequency Filter
            if (s.frecuencia) {
                const normalizedFreq = s.frecuencia.trim().toLowerCase();
                const activeFilters = Array.from(this.filters.frequencies).map(f => f.toLowerCase());
                if (!activeFilters.includes(normalizedFreq)) return false;
            }

            // 2. District Filter
            if (this.filters.districts.size > 0) {
                if (!s.distrito || !this.filters.districts.has(s.distrito)) return false;
            }

            // 3. Nearby Filter
            let centerPoint = this.referenceLocation || this.filters.userLocation;

            if (this.filters.nearby && centerPoint && s.coordenadas_gps) {
                const [lat, lng] = s.coordenadas_gps.split(',').map(Number);
                if (!isNaN(lat) && !isNaN(lng)) {
                    const distance = this.calculateDistance(
                        centerPoint.lat,
                        centerPoint.lng,
                        lat,
                        lng
                    );
                    if (distance > this.filters.radius) return false;
                }
            }

            return true;
        });

        document.getElementById('totalSedes').textContent = filtered.length;

        // Only fit bounds if searching or if nearby is OFF (if nearby is ON, we usually want to stay focused on the center)
        // Actually, if nearby is ON, it's nice to see what's found. 
        // Let's rely on standard fitBounds logic but maybe not re-fit every single time we toggle a chip?
        // For now, consistent behavior:
        this.renderMarkers(filtered, false);
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
