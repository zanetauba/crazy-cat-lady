//import "bootstrap";
// CSS
//import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports

import "bootstrap";


import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

import "../plugins/flatpickr";


import { initMapbox } from '../plugins/init_mapbox';

initMapbox();


document.addEventListener('turbolinks:load', () => {
  initMapbox();
})






