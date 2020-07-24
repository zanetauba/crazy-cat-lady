//import "bootstrap";
// CSS
//import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports

import "../plugins/flatpickr";
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();


import "bootstrap";
import { initStarRating } from '../plugins/init_star_rating';

initStarRating();



document.addEventListener('turbolinks:load', () => {
  initMapbox();
})









