// Yizhu: add init_mapbox

import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const addMarkers = (map,markers) => {
  markers.forEach((marker) => {
    const element = document.createElement('div');
    element.className = 'marker';
    element.setAttribute('data-toggle', "tooltip");
    element.setAttribute('data-placement',"top");
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
}

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const mapElement = document.getElementById('map');
const initMapbox = () => {
  if(mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const lat = mapElement.dataset.lat
    const lng = mapElement.dataset.lng
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [lat, lng],
    });


    const markers = JSON.parse(mapElement.dataset.markers);

    fitMapToMarkers(map, markers);
    addMarkers(map, markers);
  }
};




export { initMapbox };
