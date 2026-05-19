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
    this.leafletMap = null;
    this.leafletMarkersById = new Map();
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
    this.mapStyles =
      options.mapStyles || RouteAssignmentMap.minimalLightMapStyles();
    this.tileSize = 256;
    this.tileZoom = 12;
    this.tileCenter = this.defaultCenter;
    this.tilePane = null;
    this.tileDragging = null;
    this.routePolyline = null;
    this.routeArrows = [];
  }

  async init(container) {
    this.container = container;
    if (!container) return;

    try {
      await RouteAssignmentMap.loadGoogleMaps();
    } catch (error) {
      await this.initFallback(
        container,
        error.message || "Mapa alternativo activo",
      );
      return;
    }

    this.map = new google.maps.Map(container, {
      center: this.defaultCenter,
      zoom: 11,
      styles: this.mapStyles,
      backgroundColor: "#f8fafc",
      disableDefaultUI: true,
      clickableIcons: false,
      gestureHandling: "greedy",
      keyboardShortcuts: false,
      // mapId intentionally omitted because custom styles are in use
      // When using a mapId, styles must be configured in Cloud Console.
      colorScheme: "LIGHT",
      restriction: {
        latLngBounds: {
          north: -10.1,
          south: -15.6,
          west: -78.2,
          east: -74.4,
        },
        strictBounds: false,
      },
    });
    this.infoWindow = new google.maps.InfoWindow();
    this.setStatus("");
  }

  static minimalLightMapStyles() {
    return [
      { featureType: "poi", stylers: [{ visibility: "off" }] },
      { featureType: "transit", stylers: [{ visibility: "off" }] },
      { featureType: "landscape.man_made", stylers: [{ visibility: "off" }] },
      {
        featureType: "landscape.natural",
        elementType: "labels",
        stylers: [{ visibility: "off" }],
      },
      {
        featureType: "water",
        elementType: "labels",
        stylers: [{ visibility: "off" }],
      },
      {
        featureType: "administrative.neighborhood",
        stylers: [{ visibility: "off" }],
      },
      {
        featureType: "administrative.land_parcel",
        elementType: "labels",
        stylers: [{ visibility: "off" }],
      },
    ];
  }

  static darkMapStyles() {
    return [
      { elementType: "geometry", stylers: [{ color: "#1d2c4d" }] },
      { elementType: "labels.text.fill", stylers: [{ color: "#8ec3b9" }] },
      { elementType: "labels.text.stroke", stylers: [{ color: "#1a3646" }] },
      {
        featureType: "administrative.country",
        elementType: "geometry.stroke",
        stylers: [{ color: "#4b6878" }],
      },
      {
        featureType: "administrative.land_parcel",
        elementType: "labels.text.fill",
        stylers: [{ color: "#64779e" }],
      },
      {
        featureType: "administrative.province",
        elementType: "geometry.stroke",
        stylers: [{ color: "#4b6878" }],
      },
      {
        featureType: "landscape.man_made",
        elementType: "geometry.stroke",
        stylers: [{ color: "#334e87" }],
      },
      {
        featureType: "landscape.natural",
        elementType: "geometry",
        stylers: [{ color: "#023e58" }],
      },
      {
        featureType: "poi",
        elementType: "geometry",
        stylers: [{ color: "#283d6a" }],
      },
      {
        featureType: "poi",
        elementType: "labels.text.fill",
        stylers: [{ color: "#6f9ba5" }],
      },
      {
        featureType: "poi",
        elementType: "labels.text.stroke",
        stylers: [{ color: "#1d2c4d" }],
      },
      {
        featureType: "poi.park",
        elementType: "geometry.fill",
        stylers: [{ color: "#023e58" }],
      },
      {
        featureType: "poi.park",
        elementType: "labels.text.fill",
        stylers: [{ color: "#3C7680" }],
      },
      {
        featureType: "road",
        elementType: "geometry",
        stylers: [{ color: "#304a7d" }],
      },
      {
        featureType: "road",
        elementType: "labels.text.fill",
        stylers: [{ color: "#98a5be" }],
      },
      {
        featureType: "road",
        elementType: "labels.text.stroke",
        stylers: [{ color: "#1d2c4d" }],
      },
      {
        featureType: "road.highway",
        elementType: "geometry",
        stylers: [{ color: "#2c6675" }],
      },
      {
        featureType: "road.highway",
        elementType: "geometry.stroke",
        stylers: [{ color: "#255763" }],
      },
      {
        featureType: "road.highway",
        elementType: "labels.text.fill",
        stylers: [{ color: "#b0d5ce" }],
      },
      {
        featureType: "road.highway",
        elementType: "labels.text.stroke",
        stylers: [{ color: "#023e58" }],
      },
      {
        featureType: "transit",
        elementType: "labels.text.fill",
        stylers: [{ color: "#98a5be" }],
      },
      {
        featureType: "transit",
        elementType: "labels.text.stroke",
        stylers: [{ color: "#1d2c4d" }],
      },
      {
        featureType: "transit.line",
        elementType: "geometry.fill",
        stylers: [{ color: "#283d6a" }],
      },
      {
        featureType: "transit.station",
        elementType: "geometry",
        stylers: [{ color: "#3a4762" }],
      },
      {
        featureType: "water",
        elementType: "geometry",
        stylers: [{ color: "#0e1626" }],
      },
      {
        featureType: "water",
        elementType: "labels.text.fill",
        stylers: [{ color: "#4e6d70" }],
      },
    ];
  }

  static async loadGoogleMaps() {
    if (window.google?.maps) return Promise.resolve();
    if (window.__routeAssignmentMapsLoading)
      return window.__routeAssignmentMapsLoading;

    const key = await RouteAssignmentMap.resolveGoogleMapsKey();
    if (!key || key.includes("YOUR_GOOGLE_MAPS_API_KEY")) {
      return Promise.reject(
        new Error("Configura Google Maps para activar el mapa"),
      );
    }

    window.__routeAssignmentMapsLoading = new Promise((resolve, reject) => {
      window.__routeAssignmentMapsReady = () => resolve();
      const script = document.createElement("script");
      script.src = `https://maps.googleapis.com/maps/api/js?key=${encodeURIComponent(key)}&callback=__routeAssignmentMapsReady&v=weekly&language=es&region=PE&loading=async&libraries=marker`;
      script.async = true;
      script.defer = true;
      script.onerror = () => reject(new Error("No se pudo cargar Google Maps"));
      document.head.appendChild(script);
    });

    return window.__routeAssignmentMapsLoading;
  }

  static async resolveGoogleMapsKey() {
    const configuredKey = String(
      window.API_CONFIG?.GOOGLE_MAPS_API_KEY || "",
    ).trim();
    if (configuredKey && !configuredKey.includes("YOUR_GOOGLE_MAPS_API_KEY")) {
      return configuredKey;
    }

    if (window.__routeAssignmentGoogleMapsKey !== undefined) {
      return window.__routeAssignmentGoogleMapsKey;
    }

    try {
      const response =
        typeof api !== "undefined"
          ? await api.get("/maps-config")
          : await fetch("/api/maps-config.php").then((res) => res.json());
      const key = String(response?.data?.googleMapsApiKey || "").trim();
      window.__routeAssignmentGoogleMapsKey = key;
      if (key) {
        window.API_CONFIG = window.API_CONFIG || {};
        window.API_CONFIG.GOOGLE_MAPS_API_KEY = key;
      }
      return key;
    } catch (_error) {
      window.__routeAssignmentGoogleMapsKey = "";
      return "";
    }
  }

  static loadLeaflet() {
    if (window.L?.map) return Promise.resolve();
    if (window.__routeAssignmentLeafletLoading)
      return window.__routeAssignmentLeafletLoading;

    window.__routeAssignmentLeafletLoading = new Promise((resolve, reject) => {
      if (!document.getElementById("routeLeafletCss")) {
        const link = document.createElement("link");
        link.id = "routeLeafletCss";
        link.rel = "stylesheet";
        link.href =
          "https://cdn.jsdelivr.net/npm/leaflet@1.9.4/dist/leaflet.css";
        document.head.appendChild(link);
      }

      const script = document.createElement("script");
      script.src = "https://cdn.jsdelivr.net/npm/leaflet@1.9.4/dist/leaflet.js";
      script.async = true;
      script.onload = () => resolve();
      script.onerror = () => reject(new Error("No se pudo cargar Leaflet"));
      document.head.appendChild(script);
    });

    return window.__routeAssignmentLeafletLoading;
  }

  render(sedes = [], context = {}) {
    this.lastRender = { sedes, context };
    if (!context.routePath || !context.routePath.length) {
      this.clearRouteLine();
    }
    if (this.isFallback) {
      this.renderFallback(sedes, context);
      return;
    }

    if (!this.map) {
      const count = sedes.filter((s) =>
        this.parsePosition(s.coordenadas_gps),
      ).length;
      this.setStatus(
        count
          ? `${count} sedes con GPS listas`
          : "Sin sedes con GPS en el filtro",
      );
      return;
    }

    if (this.pendingFrame) return;
    this.pendingFrame = requestAnimationFrame(() => {
      this.pendingFrame = null;
      this.renderNow(this.lastRender.sedes, this.lastRender.context);
    });
  }

  renderNow(sedes, context) {
    const selectedId = context.selectedSedeId
      ? String(context.selectedSedeId)
      : null;
    const withPosition = [];

    for (const sede of sedes) {
      const position = this.parsePosition(sede.coordenadas_gps);
      if (!position) continue;
      withPosition.push({ sede, position });
    }

    const selectedItem = selectedId
      ? withPosition.find((item) => String(item.sede.id_sede) === selectedId)
      : null;

    // Clustering: group nearby markers at zoom <= 13
    const currentZoom = this.map.getZoom();
    const useClusters = currentZoom <= 13 && withPosition.length > 20;
    let visible;

    if (useClusters) {
      visible = this.clusterPoints(withPosition, currentZoom);
    } else {
      visible = withPosition.slice(0, this.maxMarkers);
      if (
        selectedItem &&
        !visible.some((item) => String(item.sede.id_sede) === selectedId)
      ) {
        visible.push(selectedItem);
      }
    }

    // Clear old markers
    const nextIds = new Set();
    for (const item of visible) {
      const isCluster = item.isCluster;
      const id = isCluster ? "cluster_" + item.id : String(item.sede.id_sede);
      nextIds.add(id);
      const marker = this.getOrCreateClusterMarker(
        item,
        id,
        isCluster,
        context,
      );
      if (isCluster) {
        this.updateIcon(
          marker._iconEl,
          "pending",
          marker._labelEl,
          String(item.count),
        );
      } else {
        const status = this.getStatus(item.sede, context);
        const labelText = context.showLabels
          ? this.getMarkerLabel(item.sede, context)
          : null;
        this.updateIcon(marker._iconEl, status, marker._labelEl, labelText);
        marker.title = item.sede.nombre_comercial || "";
      }
      if (!this.lastVisibleIds.has(id)) marker.map = this.map;
    }

    for (const id of this.lastVisibleIds) {
      if (!nextIds.has(id)) {
        const marker = this.markersById.get(id);
        if (marker) marker.map = null;
      }
    }
    this.lastVisibleIds = nextIds;

    const hidden =
      withPosition.length -
      (useClusters
        ? visible.reduce((s, c) => s + (c.count || 1), 0)
        : visible.length);
    this.setStatus(
      useClusters
        ? `${visible.length} grupos — ${withPosition.length} sedes (zoom para ver detalle)`
        : hidden > 0
          ? `${visible.length} de ${withPosition.length} sedes en mapa; ajusta filtros para ver mas`
          : `${visible.length} sedes en mapa`,
    );

    if (!this.hasFit || context.forceFit || selectedId) {
      this.fitVisible(
        useClusters ? visible.filter((v) => !v.isCluster) : visible,
        selectedId,
      );
    }

    // Draw route line for active vehicle
    this.drawRouteLine(context);
  }

  clusterPoints(points, zoom) {
    const cellSize = Math.max(0.008, 0.14 / Math.pow(2, zoom - 10));
    const grid = new Map();

    for (const item of points) {
      const cellX = Math.floor(item.position.lng / cellSize);
      const cellY = Math.floor(item.position.lat / cellSize);
      const key = `${cellX},${cellY}`;
      if (!grid.has(key)) grid.set(key, []);
      grid.get(key).push(item);
    }

    const clusters = [];
    for (const [key, items] of grid) {
      if (items.length === 1) {
        clusters.push(items[0]);
      } else {
        const avgLat =
          items.reduce((s, i) => s + i.position.lat, 0) / items.length;
        const avgLng =
          items.reduce((s, i) => s + i.position.lng, 0) / items.length;
        const assigned = items.filter((i) => {
          const s = this.getStatus(i.sede, {});
          return s !== "pending" && s !== "selected";
        }).length;
        clusters.push({
          isCluster: true,
          id: key,
          position: { lat: avgLat, lng: avgLng },
          count: items.length,
          assigned,
          items,
        });
      }
    }
    return clusters.slice(0, this.maxMarkers);
  }

  getOrCreateClusterMarker(item, id, isCluster, context) {
    if (this.markersById.has(id)) {
      const marker = this.markersById.get(id);
      if (!isCluster) marker.position = item.position;
      return marker;
    }

    const container = document.createElement("div");
    container.style.display = "flex";
    container.style.flexDirection = "column";
    container.style.alignItems = "center";
    container.style.gap = "1px";
    container.style.transform = "translate(0, 50%)";
    container.style.cursor = "pointer";

    const el = document.createElement("div");
    el.style.borderRadius = "50%";
    el.style.transition = "all 0.2s cubic-bezier(0.4, 0, 0.2, 1)";

    const label = document.createElement("span");
    label.style.cssText =
      "background:rgba(255,255,255,0.94);border:1px solid rgba(0,0,0,0.12);border-radius:4px;color:#0f172a;display:none;font-size:0.68rem;font-weight:700;line-height:1.15;max-width:120px;overflow:hidden;padding:1px 5px;text-align:center;text-overflow:ellipsis;white-space:nowrap;pointer-events:none;";

    container.appendChild(el);
    container.appendChild(label);

    if (isCluster) {
      el.style.width = "30px";
      el.style.height = "30px";
      el.style.backgroundColor = "#6366f1";
      el.style.border = "3px solid #ffffff";
      el.style.boxShadow = "0 3px 10px rgba(99,102,241,0.4)";
      el.style.display = "flex";
      el.style.alignItems = "center";
      el.style.justifyContent = "center";
      el.style.color = "#fff";
      el.style.fontSize = "0.7rem";
      el.style.fontWeight = "800";
      el.textContent = String(item.count);
      label.style.display = "none";
      container.addEventListener("click", () => {
        this.map.setZoom(Math.min(this.map.getZoom() + 2, 15));
        this.map.panTo(item.position);
      });
    } else {
      el.style.borderRadius = "50%";
      el.style.boxShadow = "0 2px 6px rgba(0,0,0,0.3)";
      el.addEventListener("dblclick", () => {
        if (this.options.onQuickAdd) this.options.onQuickAdd(item.sede);
      });
    }

    const marker = new google.maps.marker.AdvancedMarkerElement({
      position: item.position,
      gmpClickable: true,
      content: container,
    });
    marker._iconEl = el;
    marker._labelEl = label;

    if (!isCluster) {
      marker.addListener("gmp-click", () => {
        if (this.options.onSelect) this.options.onSelect(item.sede);
        this.openInfo(marker, item.sede);
      });
    }

    this.markersById.set(id, marker);
    return marker;
  }

  getMarkerLabel(sede, context) {
    if (!context.showLabels) return null;
    const activeVehicleIds = context.activeVehicleClientIds;
    if (!activeVehicleIds || !activeVehicleIds.has(String(sede.id_sede)))
      return null;
    const name = (sede.nombre_comercial || "").substring(0, 16);
    return name || null;
  }

  drawRouteLine(context) {
    // Clear previous route line
    if (this.routePolyline) {
      this.routePolyline.setMap(null);
      this.routePolyline = null;
    }
    if (this.routeArrows) {
      this.routeArrows.forEach((a) => a.setMap(null));
      this.routeArrows = [];
    }

    if (
      !context.routePath ||
      !context.routePath.length ||
      context.routePath.length < 2
    )
      return;

    const path = context.routePath.map((p) => ({ lat: p.lat, lng: p.lng }));
    const color = context.routeColor || "#ef4444";

    this.routePolyline = new google.maps.Polyline({
      path,
      geodesic: true,
      strokeColor: color,
      strokeOpacity: 0.7,
      strokeWeight: 3,
      zIndex: 5,
    });
    this.routePolyline.setMap(this.map);

    // Direction arrows at midpoints
    this.routeArrows = [];
    for (let i = 0; i < path.length - 1; i++) {
      const mid = {
        lat: (path[i].lat + path[i + 1].lat) / 2,
        lng: (path[i].lng + path[i + 1].lng) / 2,
      };
      const angle = this.computeHeading(path[i], path[i + 1]);
      const arrow = new google.maps.Marker({
        position: mid,
        icon: {
          path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
          scale: 2.5,
          fillColor: color,
          fillOpacity: 0.8,
          strokeColor: "#fff",
          strokeWeight: 1,
          rotation: angle,
        },
        clickable: false,
        zIndex: 6,
      });
      arrow.setMap(this.map);
      this.routeArrows.push(arrow);
    }
  }

  computeHeading(from, to) {
    const dLng = ((to.lng - from.lng) * Math.PI) / 180;
    const lat1 = (from.lat * Math.PI) / 180;
    const lat2 = (to.lat * Math.PI) / 180;
    const y = Math.sin(dLng) * Math.cos(lat2);
    const x =
      Math.cos(lat1) * Math.sin(lat2) -
      Math.sin(lat1) * Math.cos(lat2) * Math.cos(dLng);
    return (Math.atan2(y, x) * 180) / Math.PI;
  }

  clearRouteLine() {
    if (this.routePolyline) {
      this.routePolyline.setMap(null);
      this.routePolyline = null;
    }
    if (this.routeArrows) {
      this.routeArrows.forEach((a) => a.setMap(null));
      this.routeArrows = [];
    }
  }

  highlightMarker(sedeId, active) {
    const id = String(sedeId);
    const marker = this.markersById.get(id);
    if (!marker || !marker._iconEl) return;
    if (active) {
      marker._iconEl.style.transform = "scale(1.5)";
      marker._iconEl.style.boxShadow = "0 0 12px rgba(245,158,11,0.7)";
      marker._iconEl.style.zIndex = "200";
    } else {
      marker._iconEl.style.transform = "";
      marker._iconEl.style.boxShadow = "0 2px 6px rgba(0,0,0,0.3)";
      marker._iconEl.style.zIndex = "";
    }
  }

  async initFallback(container, reason) {
    this.isFallback = true;
    this.map = null;
    this.infoWindow = null;
    container.innerHTML = `
            <div class="route-fallback-map" aria-label="Mapa real de sedes">
                <div class="route-leaflet-map"></div>
                <div class="route-fallback-info d-none"></div>
            </div>
        `;
    this.ensureFallbackStyles();
    this.fallbackInfo = container.querySelector(".route-fallback-info");
    const mapEl = container.querySelector(".route-leaflet-map");

    try {
      await RouteAssignmentMap.loadLeaflet();
      this.leafletMap = L.map(mapEl, {
        attributionControl: true,
        preferCanvas: true,
        zoomControl: true,
        worldCopyJump: true,
      }).setView([this.defaultCenter.lat, this.defaultCenter.lng], 12);
      L.tileLayer(
        "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
        {
          maxZoom: 19,
          attribution: "&copy; OpenStreetMap contributors &copy; CARTO",
          subdomains: "abcd",
        },
      ).addTo(this.leafletMap);
      setTimeout(() => this.leafletMap?.invalidateSize(), 0);
      setTimeout(() => this.leafletMap?.invalidateSize(), 250);
      this.setStatus(
        reason
          ? `${reason}. Usando mapa OSM interactivo.`
          : "Mapa OSM interactivo activo.",
      );
    } catch (error) {
      this.setStatus(
        `${error.message || "No se pudo cargar el mapa alternativo"}. Configura Google Maps para activar el mapa operativo.`,
      );
    }
  }

  bindTileMapInteractions(mapEl) {
    if (!mapEl) return;

    mapEl
      .querySelector('[data-tile-zoom="in"]')
      ?.addEventListener("click", () => this.zoomTileMap(1));
    mapEl
      .querySelector('[data-tile-zoom="out"]')
      ?.addEventListener("click", () => this.zoomTileMap(-1));

    mapEl.addEventListener(
      "wheel",
      (event) => {
        event.preventDefault();
        this.zoomTileMap(event.deltaY < 0 ? 1 : -1);
      },
      { passive: false },
    );

    mapEl.addEventListener("pointerdown", (event) => {
      if (event.target.closest("button, a")) return;
      const centerPixel = this.latLngToPixel(this.tileCenter, this.tileZoom);
      this.tileDragging = {
        pointerId: event.pointerId,
        startX: event.clientX,
        startY: event.clientY,
        centerPixel,
      };
      mapEl.classList.add("is-dragging");
      mapEl.setPointerCapture?.(event.pointerId);
    });

    mapEl.addEventListener("pointermove", (event) => {
      if (!this.tileDragging || this.tileDragging.pointerId !== event.pointerId)
        return;
      const dx = event.clientX - this.tileDragging.startX;
      const dy = event.clientY - this.tileDragging.startY;
      this.tileCenter = this.pixelToLatLng(
        {
          x: this.tileDragging.centerPixel.x - dx,
          y: this.tileDragging.centerPixel.y - dy,
        },
        this.tileZoom,
      );
      if (this.lastRender) {
        this.renderFallback(this.lastRender.sedes, {
          ...this.lastRender.context,
          preserveView: true,
        });
      }
    });

    const endDrag = (event) => {
      if (!this.tileDragging || this.tileDragging.pointerId !== event.pointerId)
        return;
      this.tileDragging = null;
      mapEl.classList.remove("is-dragging");
      mapEl.releasePointerCapture?.(event.pointerId);
    };
    mapEl.addEventListener("pointerup", endDrag);
    mapEl.addEventListener("pointercancel", endDrag);
  }

  zoomTileMap(delta) {
    const nextZoom = Math.max(8, Math.min(18, this.tileZoom + delta));
    if (nextZoom === this.tileZoom) return;
    this.tileZoom = nextZoom;
    this.hasFit = true;
    if (this.lastRender) {
      this.renderFallback(this.lastRender.sedes, {
        ...this.lastRender.context,
        preserveView: true,
      });
    }
  }

  ensureFallbackStyles() {
    if (document.getElementById("routeFallbackMapStyles")) return;
    const style = document.createElement("style");
    style.id = "routeFallbackMapStyles";
    style.textContent = `
            .route-fallback-map {
                position: absolute;
                inset: 0;
                overflow: hidden;
                isolation: isolate;
                cursor: grab;
                touch-action: none;
                background:
                    radial-gradient(circle at 58% 42%, rgba(226, 232, 240, 0.42), transparent 30%),
                    radial-gradient(circle at 32% 62%, rgba(241, 245, 249, 0.34), transparent 24%),
                    linear-gradient(135deg, #f8fafc 0%, #f1f5f9 45%, #e2e8f0 100%);
            }

            .route-fallback-map.is-dragging {
                cursor: grabbing;
            }

            .route-leaflet-map {
                background: #f8fafc;
                height: 100%;
                inset: 0;
                position: absolute;
                width: 100%;
                z-index: 1;
            }

            .route-leaflet-map .leaflet-tile {
                filter: saturate(1.1) brightness(1.05);
            }

            .route-leaflet-map .leaflet-container,
            .route-leaflet-map .leaflet-pane,
            .route-leaflet-map .leaflet-top,
            .route-leaflet-map .leaflet-bottom {
                font-family: inherit;
            }

            .route-leaflet-map .leaflet-control-zoom a {
                color: #0f172a;
                font-weight: 800;
            }

            .route-leaflet-map .leaflet-control-attribution {
                background: rgba(15, 23, 42, 0.72);
                color: rgba(226, 232, 240, 0.9);
                font-size: 0.64rem;
            }

            .route-leaflet-map .leaflet-control-attribution a {
                color: #bfdbfe;
            }

            .route-leaflet-map .leaflet-tooltip {
                background: rgba(15, 23, 42, 0.92);
                border: 1px solid rgba(148, 163, 184, 0.42);
                color: #e2e8f0;
                font-size: 0.72rem;
                font-weight: 700;
            }

            .route-leaflet-map .leaflet-tooltip::before {
                border-top-color: rgba(15, 23, 42, 0.92);
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
                    radial-gradient(ellipse at 18% 48%, rgba(226, 232, 240, 0.86) 0 18%, transparent 18.5%),
                    radial-gradient(ellipse at 76% 28%, rgba(226, 232, 240, 0.62) 0 12%, transparent 12.5%);
                pointer-events: none;
                z-index: 0;
            }

            .route-fallback-water,
            .route-fallback-park {
                position: absolute;
                pointer-events: none;
                z-index: 0;
            }

            .route-tile-pane {
                background: #f8fafc;
                inset: 0;
                overflow: hidden;
                position: absolute;
                z-index: 1;
            }

            .route-tile-pane::after {
                content: "";
                inset: 0;
                pointer-events: none;
                position: absolute;
                background:
                    radial-gradient(circle at 50% 52%, rgba(56, 189, 248, 0.08), transparent 34%),
                    linear-gradient(180deg, rgba(241, 245, 249, 0.4), rgba(226, 232, 240, 0.6));
            }

            .route-tile-pane img {
                filter: saturate(1.1) brightness(1.05);
                height: 256px;
                opacity: 0.92;
                position: absolute;
                user-select: none;
                width: 256px;
            }

            .route-tile-controls {
                display: grid;
                gap: 6px;
                position: absolute;
                right: 12px;
                top: 12px;
                z-index: 6;
            }

            .route-tile-controls button {
                align-items: center;
                background: rgba(248, 250, 252, 0.96);
                border: 1px solid rgba(148, 163, 184, 0.5);
                border-radius: 6px;
                color: #0f172a;
                display: inline-flex;
                font-size: 1rem;
                font-weight: 800;
                height: 32px;
                justify-content: center;
                line-height: 1;
                width: 32px;
            }

            .route-tile-attribution {
                background: rgba(15, 23, 42, 0.72);
                border-radius: 4px 0 0 0;
                bottom: 0;
                color: rgba(226, 232, 240, 0.9);
                font-size: 0.64rem;
                line-height: 1;
                padding: 4px 6px;
                position: absolute;
                right: 0;
                z-index: 6;
            }

            .route-fallback-water {
                background: rgba(186, 230, 253, 0.6);
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
                background: rgba(187, 247, 208, 0.5);
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
                color: rgba(71, 85, 105, 0.78);
                font-size: 0.84rem;
                font-weight: 800;
                letter-spacing: 0.02em;
                position: absolute;
                text-shadow: 0 1px 2px rgba(255, 255, 255, 0.95);
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
                inset: 0;
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
                position: absolute;
                transform: translate(-50%, -50%);
                transition: transform 0.12s ease, box-shadow 0.12s ease;
                width: 14px;
            }

            .route-fallback-marker:hover,
            .route-fallback-marker.is-selected {
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.46);
                transform: translate(-50%, -50%) scale(1.35);
                z-index: 4;
            }

            .route-fallback-marker.assignedActive { background: #ef4444; transform: translate(-50%, -50%) scale(1.15); }
            .route-fallback-marker.assignedOther { background: #94a3b8; transform: translate(-50%, -50%) scale(0.85); opacity: 0.8; }
            .route-fallback-marker.pending { background: #3b82f6; }
            .route-fallback-marker.selected,
            .route-fallback-marker.is-selected { background: #f59e0b; z-index: 5; }

            .shape-circle  { clip-path: circle(50% at 50% 50%); border-radius: 50% !important; }
            .shape-square  { clip-path: none; border-radius: 4px !important; }
            .shape-diamond { clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%); border-radius: 0 !important; }
            .shape-triangle { clip-path: polygon(50% 0%, 100% 100%, 0% 100%); border-radius: 0 !important; }
            .shape-hexagon { clip-path: polygon(25% 0%, 75% 0%, 100% 50%, 75% 100%, 25% 100%, 0% 50%); border-radius: 0 !important; }
            .shape-pentagon { clip-path: polygon(50% 0%, 100% 38%, 82% 100%, 18% 100%, 0% 38%); border-radius: 0 !important; }
            .shape-star    { clip-path: polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%, 32% 57%, 2% 35%, 39% 35%); border-radius: 0 !important; }

            .route-fallback-info {
                background: rgba(255, 255, 255, 0.96);
                border: 1px solid rgba(226, 232, 240, 0.8);
                border-radius: 8px;
                box-shadow: 0 14px 34px rgba(15, 23, 42, 0.12);
                color: #0f172a;
                max-width: 280px;
                padding: 10px;
                position: absolute;
                right: 12px;
                top: 12px;
                z-index: 5;
            }

            .route-fallback-info .text-muted {
                color: #64748b !important;
            }

            .route-leaflet-shape-icon {
                background: transparent !important;
                border: none !important;
            }
            .route-leaflet-shape-icon > div {
                transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            }
        `;
    document.head.appendChild(style);
  }

  renderFallback(sedes = [], context = {}) {
    if (this.leafletMap) {
      this.renderLeaflet(sedes, context);
      return;
    }

    if (!this.fallbackLayer || !this.tilePane) return;

    const selectedId = context.selectedSedeId
      ? String(context.selectedSedeId)
      : null;
    const withPosition = [];
    for (const sede of sedes) {
      const position = this.parsePosition(sede.coordenadas_gps);
      if (!position) continue;
      withPosition.push({ sede, position });
    }

    const selectedItem = selectedId
      ? withPosition.find((item) => String(item.sede.id_sede) === selectedId)
      : null;
    const visible = withPosition.slice(0, this.maxMarkers);
    if (
      selectedItem &&
      !visible.some((item) => String(item.sede.id_sede) === selectedId)
    ) {
      visible.push(selectedItem);
    }

    if (!context.preserveView && (!this.hasFit || context.forceFit)) {
      this.fitTileViewport(visible, selectedId);
      this.hasFit = true;
    }

    const viewport = this.getTileViewport();
    this.renderTileImages(viewport);

    const hidden = withPosition.length - visible.length;
    this.fallbackLayer.innerHTML = visible
      .map((item) => {
        const point = this.projectTilePoint(item.position, viewport);
        if (!point.visible) return "";
        const statusObj = this.getStatus(item.sede, context);
        const statusId =
          typeof statusObj === "object" ? statusObj.id || "pending" : statusObj;
        const customColor =
          typeof statusObj === "object" && statusObj.color
            ? `background-color: ${statusObj.color} !important;`
            : "";
        const shape =
          typeof statusObj === "object" && statusObj.shape
            ? statusObj.shape
            : "circle";
        const selected = String(item.sede.id_sede) === selectedId;
        return `
                <button type="button"
                    class="route-fallback-marker ${statusId} shape-${shape} ${selected ? "is-selected" : ""}"
                    style="left:${point.x}px;top:${point.y}px;${customColor}"
                    title="${this.escapeHtml(item.sede.nombre_comercial || "")}"
                    data-sede-id="${this.escapeHtml(item.sede.id_sede)}"></button>
            `;
      })
      .join("");

    this.fallbackLayer.querySelectorAll("[data-sede-id]").forEach((marker) => {
      const sede = visible.find(
        (item) => String(item.sede.id_sede) === String(marker.dataset.sedeId),
      )?.sede;
      if (!sede) return;
      marker.addEventListener("click", () => {
        if (this.options.onSelect) this.options.onSelect(sede);
        this.openFallbackInfo(sede);
      });
      marker.addEventListener("dblclick", () => {
        if (this.options.onQuickAdd) this.options.onQuickAdd(sede);
      });
    });

    this.setStatus(
      hidden > 0
        ? `${visible.length} de ${withPosition.length} sedes en mapa real`
        : `${visible.length} sedes en mapa real`,
    );
  }

  renderLeaflet(sedes = [], context = {}) {
    const selectedId = context.selectedSedeId
      ? String(context.selectedSedeId)
      : null;
    const withPosition = [];
    for (const sede of sedes) {
      const position = this.parsePosition(sede.coordenadas_gps);
      if (!position) continue;
      withPosition.push({ sede, position });
    }

    const selectedItem = selectedId
      ? withPosition.find((item) => String(item.sede.id_sede) === selectedId)
      : null;
    const visible = withPosition.slice(0, this.maxMarkers);
    if (
      selectedItem &&
      !visible.some((item) => String(item.sede.id_sede) === selectedId)
    ) {
      visible.push(selectedItem);
    }

    const nextIds = new Set();
    for (const item of visible) {
      const id = String(item.sede.id_sede);
      nextIds.add(id);
      const marker = this.getOrCreateLeafletMarker(item.sede, item.position);
      const style = this.getLeafletStyle(
        this.getStatus(item.sede, context),
        id === selectedId,
      );
      marker.setIcon(this.createLeafletDivIcon(style));
    }

    for (const id of this.lastVisibleIds) {
      if (!nextIds.has(id)) {
        const marker = this.leafletMarkersById.get(id);
        if (marker) marker.removeFrom(this.leafletMap);
      }
    }
    this.lastVisibleIds = nextIds;

    const hidden = withPosition.length - visible.length;
    this.setStatus(
      hidden > 0
        ? `${visible.length} de ${withPosition.length} sedes en mapa OSM`
        : `${visible.length} sedes en mapa OSM`,
    );

    if (!this.hasFit || context.forceFit || selectedId) {
      this.fitLeaflet(visible, selectedId);
    }
  }

  getOrCreateLeafletMarker(sede, position) {
    const id = String(sede.id_sede);
    const latLng = [position.lat, position.lng];
    if (this.leafletMarkersById.has(id)) {
      const marker = this.leafletMarkersById.get(id);
      marker.setLatLng(latLng);
      if (!this.leafletMap.hasLayer(marker)) marker.addTo(this.leafletMap);
      return marker;
    }

    const marker = L.marker(latLng, {
      icon: this.createLeafletDivIcon(this.getLeafletStyle("pending", false)),
      opacity: 1,
    });
    marker.on("click", () => {
      if (this.options.onSelect) this.options.onSelect(sede);
      this.openFallbackInfo(sede);
    });
    marker.on("dblclick", () => {
      if (this.options.onQuickAdd) this.options.onQuickAdd(sede);
    });
    marker.bindTooltip(this.escapeHtml(sede.nombre_comercial || ""), {
      direction: "top",
      offset: [0, -8],
      opacity: 0.94,
    });
    marker.addTo(this.leafletMap);
    this.leafletMarkersById.set(id, marker);
    return marker;
  }

  createLeafletDivIcon(style) {
    const size = style.size || 14;
    const shape = style.shape || "circle";
    const shapeClip = {
      circle: "circle(50% at 50% 50%)",
      square: "none",
      diamond: "polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%)",
      triangle: "polygon(50% 0%, 100% 100%, 0% 100%)",
      hexagon: "polygon(25% 0%, 75% 0%, 100% 50%, 75% 100%, 25% 100%, 0% 50%)",
      pentagon: "polygon(50% 0%, 100% 38%, 82% 100%, 18% 100%, 0% 38%)",
      star: "polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%, 32% 57%, 2% 35%, 39% 35%)",
    };
    const shapeRadius = {
      circle: "50%",
      square: "4px",
      diamond: "0",
      triangle: "0",
      hexagon: "0",
      pentagon: "0",
      star: "0",
    };
    const html = `<div style="width:${size}px;height:${size}px;background:${style.fillColor};border:${style.weight}px solid ${style.color};opacity:${style.fillOpacity};border-radius:${shapeRadius[shape] || "50%"};clip-path:${shapeClip[shape] || shapeClip.circle};box-shadow:${style.shadow || "0 2px 8px rgba(0,0,0,0.3)"};"></div>`;
    return L.divIcon({
      className: "route-leaflet-shape-icon",
      html,
      iconSize: [size, size],
      iconAnchor: [size / 2, size / 2],
      popupAnchor: [0, -size / 2],
    });
  }

  getLeafletStyle(status, selected = false) {
    let stateId = typeof status === "object" ? status.id || "pending" : status;
    const shape =
      typeof status === "object" && status.shape ? status.shape : "circle";
    const colors = {
      pending: "#3b82f6",
      selected: "#f59e0b",
      assignedActive: "#ef4444",
      assignedOther: "#94a3b8",
    };
    const fillColor = selected
      ? colors.selected
      : typeof status === "object" && status.color
        ? status.color
        : colors[stateId] || colors.pending;
    let size = 14;
    let weight = 1.5;
    let fillOpacity = 0.95;
    let shadow = "0 2px 8px rgba(0,0,0,0.3)";
    if (selected) {
      size = 20;
      weight = 3;
      fillOpacity = 1;
      shadow = "0 4px 16px rgba(0,0,0,0.45)";
    } else if (stateId === "assignedActive") {
      size = 22;
      weight = 2;
      fillOpacity = 1;
    } else if (stateId === "assignedOther") {
      size = 19;
      weight = 2;
      fillOpacity = 0.9;
    }

    return {
      color: "#ffffff",
      fillColor,
      fillOpacity,
      size,
      weight,
      shape,
      shadow,
    };
  }

  fitLeaflet(visible, selectedId = null) {
    if (!visible.length) return;
    if (selectedId) {
      const selected = visible.find(
        (item) => String(item.sede.id_sede) === String(selectedId),
      );
      if (selected) {
        this.leafletMap.flyTo(
          [selected.position.lat, selected.position.lng],
          Math.max(this.leafletMap.getZoom(), 15),
          {
            animate: true,
            duration: 0.25,
          },
        );
        this.hasFit = true;
        return;
      }
    }

    if (visible.length === 1) {
      this.leafletMap.setView(
        [visible[0].position.lat, visible[0].position.lng],
        15,
      );
    } else {
      const bounds = L.latLngBounds(
        visible
          .slice(0, 120)
          .map((item) => [item.position.lat, item.position.lng]),
      );
      this.leafletMap.fitBounds(bounds, {
        padding: [50, 50],
        maxZoom: 15,
      });
    }
    this.hasFit = true;
  }

  fitTileViewport(visible, selectedId = null) {
    const selected = selectedId
      ? visible.find((item) => String(item.sede.id_sede) === String(selectedId))
      : null;
    if (selected) {
      this.tileCenter = selected.position;
      this.tileZoom = Math.max(this.tileZoom || 12, 14);
      return;
    }

    if (!visible.length) {
      this.tileCenter = this.defaultCenter;
      this.tileZoom = 11;
      return;
    }

    if (visible.length === 1) {
      this.tileCenter = visible[0].position;
      this.tileZoom = 14;
      return;
    }

    const rect = this.container?.getBoundingClientRect?.() || {
      width: 900,
      height: 520,
    };
    const width = Math.max(rect.width || 900, 320);
    const height = Math.max(rect.height || 520, 280);
    const points = visible
      .slice(0, this.maxMarkers)
      .map((item) => this.latLngToPixel(item.position, 0));
    const minX = Math.min(...points.map((point) => point.x));
    const maxX = Math.max(...points.map((point) => point.x));
    const minY = Math.min(...points.map((point) => point.y));
    const maxY = Math.max(...points.map((point) => point.y));
    const spanX = Math.max(maxX - minX, 0.00001);
    const spanY = Math.max(maxY - minY, 0.00001);
    const usableWidth = Math.max(width - 96, 180);
    const usableHeight = Math.max(height - 96, 180);
    const scale = Math.min(usableWidth / spanX, usableHeight / spanY);
    const zoom = Math.floor(Math.log2(scale));
    const centerAtZero = {
      x: (minX + maxX) / 2,
      y: (minY + maxY) / 2,
    };

    this.tileZoom = Math.max(8, Math.min(16, zoom));
    this.tileCenter = this.pixelToLatLng(
      {
        x: centerAtZero.x * 2 ** this.tileZoom,
        y: centerAtZero.y * 2 ** this.tileZoom,
      },
      this.tileZoom,
    );
  }

  getTileViewport() {
    const rect = this.container?.getBoundingClientRect?.() || {
      width: 900,
      height: 520,
    };
    const width = Math.max(Math.round(rect.width || 900), 320);
    const height = Math.max(Math.round(rect.height || 520), 280);
    const centerPixel = this.latLngToPixel(this.tileCenter, this.tileZoom);
    return {
      width,
      height,
      zoom: this.tileZoom,
      topLeft: {
        x: centerPixel.x - width / 2,
        y: centerPixel.y - height / 2,
      },
    };
  }

  renderTileImages(viewport) {
    const tileSize = this.tileSize;
    const tileCount = 2 ** viewport.zoom;
    const startX = Math.floor(viewport.topLeft.x / tileSize);
    const endX = Math.floor((viewport.topLeft.x + viewport.width) / tileSize);
    const startY = Math.max(0, Math.floor(viewport.topLeft.y / tileSize));
    const endY = Math.min(
      tileCount - 1,
      Math.floor((viewport.topLeft.y + viewport.height) / tileSize),
    );
    const tiles = [];

    for (let x = startX; x <= endX; x += 1) {
      for (let y = startY; y <= endY; y += 1) {
        const wrappedX = ((x % tileCount) + tileCount) % tileCount;
        tiles.push(`
                    <img
                        src="https://tile.openstreetmap.org/${viewport.zoom}/${wrappedX}/${y}.png"
                        alt=""
                        draggable="false"
                        loading="lazy"
                        decoding="async"
                        style="left:${Math.round(x * tileSize - viewport.topLeft.x)}px;top:${Math.round(y * tileSize - viewport.topLeft.y)}px">
                `);
      }
    }

    this.tilePane.innerHTML = tiles.join("");
  }

  projectTilePoint(position, viewport) {
    const point = this.latLngToPixel(position, viewport.zoom);
    const x = point.x - viewport.topLeft.x;
    const y = point.y - viewport.topLeft.y;
    return {
      x: Math.round(x),
      y: Math.round(y),
      visible:
        x >= -24 &&
        x <= viewport.width + 24 &&
        y >= -24 &&
        y <= viewport.height + 24,
    };
  }

  latLngToPixel(position, zoom) {
    const sin = Math.sin((position.lat * Math.PI) / 180);
    const normalizedSin = Math.max(-0.9999, Math.min(0.9999, sin));
    const scale = this.tileSize * 2 ** zoom;
    return {
      x: ((position.lng + 180) / 360) * scale,
      y:
        (0.5 -
          Math.log((1 + normalizedSin) / (1 - normalizedSin)) / (4 * Math.PI)) *
        scale,
    };
  }

  pixelToLatLng(point, zoom) {
    const scale = this.tileSize * 2 ** zoom;
    const lng = (point.x / scale) * 360 - 180;
    const n = Math.PI - (2 * Math.PI * point.y) / scale;
    const lat = (180 / Math.PI) * Math.atan(0.5 * (Math.exp(n) - Math.exp(-n)));
    return {
      lat: Math.max(-85, Math.min(85, lat)),
      lng,
    };
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
      west: Math.max(-78.2, west - lngPad),
    };
  }

  projectFallbackPoint(position, bounds) {
    const lngSpan = Math.max(bounds.east - bounds.west, 0.0001);
    const latSpan = Math.max(bounds.north - bounds.south, 0.0001);
    const x = ((position.lng - bounds.west) / lngSpan) * 100;
    const y = ((bounds.north - position.lat) / latSpan) * 100;
    return {
      x: Math.max(2, Math.min(98, x)),
      y: Math.max(2, Math.min(98, y)),
    };
  }

  openFallbackInfo(sede) {
    if (!this.fallbackInfo) return;
    const action = this.options.actionForSede
      ? this.options.actionForSede(sede)
      : null;
    const actionHtml = action
      ? `<button class="btn btn-sm ${action.kind === "reassign" ? "btn-warning" : "btn-success"} w-100 mt-2" data-map-action="1">${this.escapeHtml(action.label)}</button>`
      : '<div class="small text-muted mt-2">Selecciona un camion para asignar</div>';
    this.fallbackInfo.innerHTML = `
            <div class="fw-bold">${this.escapeHtml(sede.nombre_comercial || "-")}</div>
            <div class="small text-muted">${this.escapeHtml(sede.empresa_ruc || "")}</div>
            <div class="small">${this.escapeHtml(sede.distrito || "")}</div>
            <div class="small text-muted">${this.escapeHtml(sede.frecuencia || "Sin frecuencia")}</div>
            ${actionHtml}
        `;
    this.fallbackInfo.classList.remove("d-none");
    const btn = this.fallbackInfo.querySelector("[data-map-action]");
    if (btn && action?.handler) btn.addEventListener("click", action.handler);
  }

  getOrCreateMarker(sede, position) {
    const id = String(sede.id_sede);
    if (this.markersById.has(id)) {
      const marker = this.markersById.get(id);
      marker.position = position;
      return marker;
    }

    const container = document.createElement("div");
    container.style.display = "flex";
    container.style.flexDirection = "column";
    container.style.alignItems = "center";
    container.style.gap = "1px";
    container.style.transform = "translate(0, 50%)";

    const el = document.createElement("div");
    el.style.borderRadius = "50%";
    el.style.boxShadow = "0 2px 6px rgba(0,0,0,0.3)";
    el.style.transition = "all 0.2s cubic-bezier(0.4, 0, 0.2, 1)";
    el.addEventListener("dblclick", () => {
      if (this.options.onQuickAdd) this.options.onQuickAdd(sede);
    });

    const label = document.createElement("span");
    label.style.cssText =
      "background:rgba(255,255,255,0.94);border:1px solid rgba(0,0,0,0.12);border-radius:4px;color:#0f172a;display:none;font-size:0.68rem;font-weight:700;line-height:1.15;max-width:120px;overflow:hidden;padding:1px 5px;text-align:center;text-overflow:ellipsis;white-space:nowrap;pointer-events:none;";

    container.appendChild(el);
    container.appendChild(label);

    // Hover sync: map → search panel
    container.addEventListener("mouseenter", () => {
      if (this.options.onHover) this.options.onHover(sede, true);
      el.style.transform = "scale(1.3)";
      el.style.boxShadow = "0 0 10px rgba(245,158,11,0.6)";
    });
    container.addEventListener("mouseleave", () => {
      if (this.options.onHover) this.options.onHover(sede, false);
      el.style.transform = "";
      el.style.boxShadow = "0 2px 6px rgba(0,0,0,0.3)";
    });

    const marker = new google.maps.marker.AdvancedMarkerElement({
      position,
      gmpClickable: true,
      content: container,
    });
    marker._iconEl = el;
    marker._labelEl = label;
    marker.addListener("gmp-click", () => {
      if (this.options.onSelect) this.options.onSelect(sede);
      this.openInfo(marker, sede);
    });

    this.markersById.set(id, marker);
    return marker;
  }

  getStatus(sede, context) {
    if (String(context.selectedSedeId || "") === String(sede.id_sede))
      return "selected";
    if (context.statusForSede) return context.statusForSede(sede);
    return "pending";
  }

  updateIcon(el, status, labelEl, labelText) {
    if (!el) return;

    let stateId = typeof status === "object" ? status.id || "pending" : status;
    const shape =
      typeof status === "object" && status.shape ? status.shape : "circle";
    const colors = {
      pending: "#3b82f6",
      selected: "#f59e0b",
      assignedActive: "#ef4444",
      assignedOther: "#94a3b8",
    };
    const color =
      typeof status === "object" && status.color
        ? status.color
        : colors[stateId] || colors.pending;

    let size = 12;
    let border = 1.5;
    let opacity = 1;

    if (stateId === "selected") {
      size = 18;
      border = 3;
    } else if (stateId === "assignedActive") {
      size = 20;
      border = 2;
    } else if (stateId === "assignedOther") {
      size = 17;
      border = 2;
      opacity = 0.9;
    }

    const shapeStyles = {
      circle: { borderRadius: "50%", clipPath: "circle(50% at 50% 50%)" },
      square: { borderRadius: "4px", clipPath: "none" },
      diamond: {
        borderRadius: "0",
        clipPath: "polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%)",
      },
      triangle: {
        borderRadius: "0",
        clipPath: "polygon(50% 0%, 100% 100%, 0% 100%)",
      },
      hexagon: {
        borderRadius: "0",
        clipPath:
          "polygon(25% 0%, 75% 0%, 100% 50%, 75% 100%, 25% 100%, 0% 50%)",
      },
      pentagon: {
        borderRadius: "0",
        clipPath: "polygon(50% 0%, 100% 38%, 82% 100%, 18% 100%, 0% 38%)",
      },
      star: {
        borderRadius: "0",
        clipPath:
          "polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%, 32% 57%, 2% 35%, 39% 35%)",
      },
    };
    const s = shapeStyles[shape] || shapeStyles.circle;

    el.style.width = size + "px";
    el.style.height = size + "px";
    el.style.backgroundColor = color;
    el.style.border = border + "px solid #ffffff";
    el.style.borderRadius = s.borderRadius;
    el.style.clipPath = s.clipPath;
    el.style.opacity = opacity;
    el.style.zIndex =
      stateId === "selected" ? 100 : stateId === "pending" ? 10 : 20;

    el.className = el.className.replace(/\bshape-\S+/g, "");
    el.classList.add("shape-" + shape);

    if (labelEl) {
      if (labelText) {
        labelEl.textContent = labelText;
        labelEl.style.display = "block";
      } else {
        labelEl.style.display = "none";
      }
    }
  }

  openInfo(marker, sede) {
    const action = this.options.actionForSede
      ? this.options.actionForSede(sede)
      : null;
    const telefono = sede.telefono || sede.contacto_telefono || "";
    const direccion = sede.direccion || "";
    const distrito = sede.distrito || "";
    const frecuencia = sede.frecuencia || "Sin frecuencia";
    const tarifa = sede.tarifa ? `S/ ${sede.tarifa}` : "";

    const actionBtn = action
      ? `<button class="btn btn-sm ${action.kind === "reassign" ? "btn-warning" : "btn-success"} w-100 mt-1" id="routeMapAction">${this.escapeHtml(action.label)}</button>`
      : '<div class="small text-muted mt-1">Selecciona un camion para asignar</div>';

    const whatsappBtn = telefono
      ? `<a class="btn btn-sm btn-outline-success w-100 mt-1" href="https://wa.me/51${telefono.replace(/\D/g, "")}" target="_blank"><i class="bi bi-whatsapp"></i> WhatsApp</a>`
      : "";

    const content = `
            <div style="max-width:280px;font-size:0.88rem;">
                <div class="fw-bold mb-1" style="font-size:0.95rem;">${this.escapeHtml(sede.nombre_comercial || "-")}</div>
                <div class="small text-muted">RUC: ${this.escapeHtml(sede.empresa_ruc || "-")}</div>
                ${direccion ? `<div class="small mt-1"><i class="bi bi-geo-alt"></i> ${this.escapeHtml(direccion)}</div>` : ""}
                <div class="d-flex gap-3 mt-1 flex-wrap">
                    ${distrito ? `<span class="small text-muted">${this.escapeHtml(distrito)}</span>` : ""}
                    <span class="small text-muted">${this.escapeHtml(frecuencia)}</span>
                    ${tarifa ? `<span class="small fw-bold text-success">${tarifa}</span>` : ""}
                </div>
                ${telefono ? `<div class="small mt-1"><i class="bi bi-telephone"></i> ${this.escapeHtml(telefono)}</div>` : ""}
                ${actionBtn}
                ${whatsappBtn}
            </div>`;

    this.infoWindow.setContent(content);
    this.infoWindow.open(this.map, marker);
    google.maps.event.addListenerOnce(this.infoWindow, "domready", () => {
      const btn = document.getElementById("routeMapAction");
      if (btn && action?.handler) btn.addEventListener("click", action.handler);
    });
  }

  fitVisible(visible, selectedId = null) {
    if (!visible.length) return;
    if (selectedId) {
      const selected = visible.find(
        (item) => String(item.sede.id_sede) === String(selectedId),
      );
      if (selected) {
        this.map.panTo(selected.position);
        this.map.setZoom(Math.max(this.map.getZoom(), 14));
        this.hasFit = true;
        return;
      }
    }

    const bounds = new google.maps.LatLngBounds();
    visible.slice(0, 80).forEach((item) => bounds.extend(item.position));
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
    const [lat, lng] = String(value).split(",").map(Number);
    if (!Number.isFinite(lat) || !Number.isFinite(lng)) return null;
    if (lat < -15.6 || lat > -10.1 || lng < -78.2 || lng > -74.4) return null;
    return { lat, lng };
  }

  setStatus(message) {
    const el = document.getElementById("routeMapStatus");
    if (!el) return;
    el.textContent = message || "";
    el.classList.toggle("d-none", !message);
  }

  escapeHtml(value) {
    return String(value ?? "").replace(
      /[&<>"']/g,
      (char) =>
        ({
          "&": "&amp;",
          "<": "&lt;",
          ">": "&gt;",
          '"': "&quot;",
          "'": "&#39;",
        })[char],
    );
  }

  // ─── District Layer ───────────────────────────────────────────
  async loadDistrictLayer(geoJsonUrl) {
    if (this.districtLayer) return;
    try {
      const resp = await fetch(geoJsonUrl);
      if (!resp.ok) throw new Error("No se pudo cargar GeoJSON de distritos");
      const geoJson = await resp.json();
      this.districtData = geoJson;
      this.districtLayer = new google.maps.Data({
        map: this.map,
        style: { fillOpacity: 0, strokeWeight: 0 },
      });
      this.districtLayer.addGeoJson(geoJson);
      this.districtSedesMap = new Map();
      this._districtVisible = false;
    } catch (e) {
      console.warn("Capa de distritos no disponible:", e.message);
    }
  }

  toggleDistrictLayer(visible, sedesWithGPS = []) {
    if (!this.districtLayer || !this.districtData) return;
    this._districtVisible = visible;
    if (!visible) {
      this.districtLayer.setStyle({ fillOpacity: 0, strokeWeight: 0 });
      return;
    }

    // Build map: district name -> count of sedes
    const distCount = new Map();
    for (const s of sedesWithGPS) {
      const d = (s.distrito || "").toUpperCase().trim();
      if (d) distCount.set(d, (distCount.get(d) || 0) + 1);
    }
    const maxCount = Math.max(1, ...distCount.values());

    this.districtLayer.setStyle((feature) => {
      const name = (feature.getProperty("NOMBDIST") || "").toUpperCase().trim();
      const count = distCount.get(name) || 0;
      const alpha = count ? 0.12 + (count / maxCount) * 0.2 : 0;
      const color = count ? "#166534" : "#94a3b8";
      return {
        fillColor: color,
        fillOpacity: count ? alpha : 0.03,
        strokeColor: color,
        strokeWeight: count ? 1.5 : 0.5,
        strokeOpacity: count ? 0.6 : 0.2,
      };
    });

    // Hover: show district name
    this.districtLayer.addListener("mouseover", (e) => {
      const name = e.feature.getProperty("NOMBDIST") || "";
      const count = distCount.get(name.toUpperCase().trim()) || 0;
      this.setStatus(count ? `${name}: ${count} sedes` : name);
    });
    this.districtLayer.addListener("mouseout", () => this.setStatus(""));
  }

  updateDistrictSedes(sedesWithGPS = []) {
    if (this._districtVisible) this.toggleDistrictLayer(true, sedesWithGPS);
  }

  // ─── Heatmap ──────────────────────────────────────────────────
  toggleHeatmap(visible, sedes = []) {
    if (this.heatmapCircles) {
      this.heatmapCircles.forEach((c) => c.setMap(null));
      this.heatmapCircles = [];
    }
    if (this.heatmapActive === visible) {
      this.heatmapActive = !visible;
      visible = this.heatmapActive;
    }
    this.heatmapActive = visible;
    if (!visible || !sedes.length) return;

    const gridSize = 0.02; // ~2km cells
    const grid = new Map();
    for (const s of sedes) {
      const pos = this.parsePosition(s.coordenadas_gps);
      if (!pos) continue;
      const gx = Math.floor(pos.lng / gridSize);
      const gy = Math.floor(pos.lat / gridSize);
      const key = `${gx},${gy}`;
      if (!grid.has(key)) grid.set(key, { count: 0, lat: 0, lng: 0 });
      const cell = grid.get(key);
      cell.count++;
      cell.lat += pos.lat;
      cell.lng += pos.lng;
    }

    const maxCount = Math.max(
      1,
      ...Array.from(grid.values()).map((c) => c.count),
    );
    this.heatmapCircles = [];
    for (const [, cell] of grid) {
      const radius = 300 + (cell.count / maxCount) * 900;
      const alpha = 0.15 + (cell.count / maxCount) * 0.35;
      const circle = new google.maps.Circle({
        center: { lat: cell.lat / cell.count, lng: cell.lng / cell.count },
        radius,
        fillColor: "#ef4444",
        fillOpacity: alpha,
        strokeColor: "#ef4444",
        strokeOpacity: 0.4,
        strokeWeight: 1,
        clickable: false,
        zIndex: 2,
      });
      circle.setMap(this.map);
      this.heatmapCircles.push(circle);
    }
  }

  // ─── K-Means Preview ──────────────────────────────────────────
  showKMeansPreview(clusters, vehicleColors) {
    this.clearKMeansPreview();
    this.kmeansCircles = [];
    this.kmeansMarkers = [];

    for (let i = 0; i < clusters.length; i++) {
      const cluster = clusters[i] || [];
      if (!cluster.length) continue;
      const color = vehicleColors[i % vehicleColors.length];

      // Cluster center
      const avgLat = cluster.reduce((s, p) => s + p.lat, 0) / cluster.length;
      const avgLng = cluster.reduce((s, p) => s + p.lng, 0) / cluster.length;

      // Bounding circle
      const maxDist = Math.max(
        ...cluster.map((p) => {
          const dLat = (p.lat - avgLat) * 111320;
          const dLng =
            (p.lng - avgLng) * 111320 * Math.cos((avgLat * Math.PI) / 180);
          return Math.sqrt(dLat * dLat + dLng * dLng);
        }),
      );
      const radius = Math.max(800, maxDist * 1.3);

      const circle = new google.maps.Circle({
        center: { lat: avgLat, lng: avgLng },
        radius,
        fillColor: color,
        fillOpacity: 0.12,
        strokeColor: color,
        strokeOpacity: 0.7,
        strokeWeight: 2.5,
        clickable: false,
        zIndex: 4,
      });
      circle.setMap(this.map);
      this.kmeansCircles.push(circle);

      // Cluster markers with vehicle color
      for (const p of cluster) {
        const marker = new google.maps.Marker({
          position: { lat: p.lat, lng: p.lng },
          icon: {
            path: google.maps.SymbolPath.CIRCLE,
            scale: 7,
            fillColor: color,
            fillOpacity: 0.9,
            strokeColor: "#fff",
            strokeWeight: 1.5,
          },
          clickable: false,
          zIndex: 5,
        });
        marker.setMap(this.map);
        this.kmeansMarkers.push(marker);
      }

      // Label with count
      const label = new google.maps.Marker({
        position: { lat: avgLat, lng: avgLng },
        label: {
          text: String(cluster.length),
          color: "#fff",
          fontSize: "13px",
          fontWeight: "bold",
        },
        icon: {
          path: google.maps.SymbolPath.CIRCLE,
          scale: 14,
          fillColor: color,
          fillOpacity: 0.95,
          strokeColor: "#fff",
          strokeWeight: 2.5,
        },
        clickable: false,
        zIndex: 10,
      });
      label.setMap(this.map);
      this.kmeansMarkers.push(label);
    }

    // Fit bounds to show all clusters
    if (this.kmeansCircles.length) {
      const bounds = new google.maps.LatLngBounds();
      this.kmeansCircles.forEach((c) => {
        const center = c.getCenter();
        if (center) bounds.extend(center);
      });
      this.map.fitBounds(bounds, 80);
    }
  }

  clearKMeansPreview() {
    if (this.kmeansCircles) {
      this.kmeansCircles.forEach((c) => c.setMap(null));
      this.kmeansCircles = [];
    }
    if (this.kmeansMarkers) {
      this.kmeansMarkers.forEach((m) => m.setMap(null));
      this.kmeansMarkers = [];
    }
  }
}

window.RouteAssignmentMap = RouteAssignmentMap;
