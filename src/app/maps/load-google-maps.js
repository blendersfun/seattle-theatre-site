
/**
 * Asynchronously load the google maps api.
 */

module.exports = function (context) {
  window.initialize = function () {
    context.executeAction(googleMapsAction);
    window.initialize = null;
  };

  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyA9PjKau31h9r6FE2LTuLTeb5WWOPy__Yg&' +
      'callback=initialize';
  document.body.appendChild(script);
};

function googleMapsAction (actionContext, payload, done) {
  actionContext.dispatch('googleMapsReady');
}