
/**
 * Dependencies.
 */

var createStore = require('../core/create-store');

/**
 * Track's when the google maps API is ready for use.
 */

module.exports = createStore({
  initialize: function () {
    this.state = {
      ready: false
    };
  },
  storeName: 'google-maps',
  handlers: {
    googleMapsReady: function () {
      this.state.ready = true;
      this.emitChange();
    }
  },
  isReady: function () {
    return this.state.ready;
  }
});
