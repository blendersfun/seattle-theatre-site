
/**
 * Module dependencies.
 */

var createStore = require('dispatchr/utils/createStore');

module.exports = createStore({
    initialize: function () {
    	this.state = {};
    },
    storeName: 'NavigationStore',
    handlers: {},
    dehydrate: function () {
    	return this.state;
    },
    rehydrate: function (state) {
    	this.state = state;
    }
});