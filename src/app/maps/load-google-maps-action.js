
/**
 * Asynchronously load the google maps api.
 */

function loadGoogleMapsAction(actionContext, payload, done) {
  window.initialize = function () {
    actionContext.dispatch('googleMapsReady');
    window.initialize = null;
    done();
  };

  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyA9PjKau31h9r6FE2LTuLTeb5WWOPy__Yg&' +
      'callback=initialize';
  document.body.appendChild(script);
};

module.exports = loadGoogleMapsAction;