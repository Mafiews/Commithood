// Yizhu: add init_mapbox

import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import { initEventinfo} from '../plugins/init_eventinfo';


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
    element.style.width = '40px';
    element.style.height = '40px';
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

const initSearchbarIndex = (map) => {
  const causes = document.querySelectorAll('#user_cause');

  causes.forEach ((cause) => {
    cause.addEventListener('click', (event)=> {
      cause.parentNode.classList.toggle('active')
      if (cause.value === "Tous les thèmes" && cause.checked === true) {
        causes.forEach ((c) => {
          c.checked = false
          c.parentNode.classList.remove('active')
        });
        cause.checked = "checked"
        cause.parentNode.classList.toggle('active')
      } else {
        causes[0].checked = false
        causes[0].parentNode.classList.remove('active')
      };
      cause.checked = "checked"
      // cause.form.submit()
      fetch('/events', { headers: { accept: "application/json" } })
        .then(response => response.json())
        .then((data) => {
          document.querySelectorAll('.marker').forEach((m) => {
            m.outerHTML = '';
          })
          const filterMarkers = [];
          causes.forEach ((ca) => {
            if (ca.checked === true) {

              data.markers.forEach((marker)=>{
                if (marker.title.includes(ca.value)) {
                  filterMarkers.push(marker);
                }
              })
            }
            // else {
            //   data.markers.forEach((marker)=>{
            //     marker.remove();
            //   })
            // }
          })
        addMarkers(map, filterMarkers)

        initEventinfo();
      });
    });
  });
}

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const markers = JSON.parse(mapElement.dataset.markers);
  if(mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const lat = mapElement.dataset.lat
    const lng = mapElement.dataset.lng
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [lng, lat],
      zoom: 12
    });


    // console.log(map)
    addMarkers(map, markers);
    initSearchbarIndex(map)
    if (!lat) {
      fitMapToMarkers(map, markers);
    }
  }
  return [map, markers]
};




export { initMapbox, addMarkers };
