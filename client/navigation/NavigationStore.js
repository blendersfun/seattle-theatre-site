
/**
 * Module dependencies.
 */

var createStore = require('dispatchr/utils/createStore');

module.exports = createStore({
    initialize: function () {
    	this.state = {
            currentPage: null
        };
    },
    storeName: 'NavigationStore',
    handlers: {
        'NAVIGATE': function (route) {
            var store = this.dispatcher.getStore('NavigationStore');
            store.state.currentPage = route.name;
            store.emit('NAVIGATE');
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