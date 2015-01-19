
/**
 * Dependencies.
 */

var createStore = require('fluxible/utils/createStore');
var extend = require('extend');

/**
 * Generic hydrate and dehydrate methods.
 */

var genericHydration = {
  rehydrate: function (state) {
    this.state = state;
  },
  dehydrate: function () {
    return this.state;
  }
};

/**
 * An extension of fluxible's createStore method.
 */

module.exports = function (storeSpec) {
  extend(false, storeSpec, genericHydration);
  return createStore(storeSpec);
};