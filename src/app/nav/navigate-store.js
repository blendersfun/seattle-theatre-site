
/**
 * Dependencies.
 */

var createStore = require('fluxible/utils/createStore');

/**
 * A store to contain what page we are currently on.
 */

var NavigateStore = createStore({
  initialize: function () {
    this.state = {
      currentPage: null
    };
  },
  storeName: 'navigate',
  handlers: {
    navigate: function (route) {
      this.state.currentPage = route.name;
      this.emitChange();
    }
  },
  getCurrentPage: function () {
    return this.state.currentPage;
  },
  dehydrate: function () {
    return this.state;
  },
  rehydrate: function (state) {
    this.state = state;
  }
});

module.exports = NavigateStore;
