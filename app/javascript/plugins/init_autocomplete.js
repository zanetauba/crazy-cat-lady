import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('listing_location');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initAutocomplete };
