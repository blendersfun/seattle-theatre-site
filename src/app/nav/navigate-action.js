
/**
 * Depencencies.
 */

var pageRegistry = require('../page-registry');

/**
 * An action creator for in-app page navigation.
 */

module.exports = function (actionContext, payload, done) {
  var route = actionContext.router.getRoute(payload.url);
  if (route) {
    actionContext.dispatch('navigate', route);

    // Execute page-specific initialize action:
    var navigateStore = actionContext.getStore('navigate');
    var currentPage = pageRegistry.getPage(navigateStore.getCurrentPage());
    if (currentPage.initializeAction) {
      actionContext.executeAction(currentPage.initializeAction, {}, done);
    } else {
      done();
    }
  } else {
    done("No route matched.");
  }
};
