//import "bootstrap";
// CSS
//import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import "../plugins/flatpickr"


import { initMapbox } from '../plugins/init_mapbox';

initMapbox();


document.addEventListener('turbolinks:load', () => {
  initMapbox();
})
