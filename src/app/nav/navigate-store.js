
/**
 * Dependencies.
 */

var createStore = require('../core/create-store');

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
  }
});

module.exports = NavigateStore;
