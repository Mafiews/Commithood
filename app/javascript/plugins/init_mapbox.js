// Yizhu: add init_mapbox

import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';



const initMapbox = () => {

  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    const lat = mapElement.dataset.lat
    const lng = mapElement.dataset.lng
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [lat, lng],
    });


    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      const element = document.createElement('div');
      element.className = 'marker';
      element.dataToggle = "tooltip";
      element.dataPlacement = "top";
      element.title = marker.title;
      element.id = marker.data_event_id;
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '30px';
      element.style.height = '30px';
      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });


    fitMapToMarkers(map, markers);
  }

};

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds);
    console.log(bounds, { padding: 70, maxZoom:15, duration: 0 });
  };



export { initMapbox };
