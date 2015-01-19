
/**
 * An action creator for in-app page navigation.
 */

module.exports = function (actionContext, payload, done) {
  var route = actionContext.router.getRoute(payload.url);
  if (route) {
    actionContext.dispatch('navigate', route);
    done({ matchedRoute: route });
  } else {
    done({});
  }
};
