
/**
 * Dependencies.
 */

var createStore = require('../../core/create-store');

/**
 * A store to manage the state of the update-production page.
 *
 * The intent is that if piece of this store are identified as
 * candidates for sharing, they can be refactored out to a more
 * central/reuseable place.
 */

var UpdateProductionStore = createStore({
  storeName: 'update-production',
  initialize: function () {
    this.state = {
      authorMatches: []
    };
  },
  handlers: {
    authorsMatched: function (rows) {
      this.state.authorMatches = rows;
      this.emitChange();
    }
  },
  getAuthorMatches: function () {
    return this.state.authorMatches;
  }
});

module.exports = UpdateProductionStore;

