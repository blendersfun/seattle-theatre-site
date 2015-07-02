
/**
 * An action creator for home-page-specific actions.
 */

var HomePageActions = {
  initializePage: function (actionContext, payload, done) {
    actionContext.service.read('venues', {}, function (err, data) {
      if (err) {
        done(err);
      } else {
        actionContext.dispatch('venuesLoaded', data);
        done();
      }
    });
  }
};

module.exports = HomePageActions;

