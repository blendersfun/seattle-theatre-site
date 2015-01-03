
/**
 * Module dependencies.
 */

var createStore = require('dispatchr/utils/createStore');

module.exports = createStore({
    initialize: function () {
    	this.state = {
			googleMapsReady: false
		};
    },
    storeName: 'GoogleMapsStore',
    handlers: {
    	'GOOGLE_MAPS_READY': function () {
            var store = this.dispatcher.getStore('GoogleMapsStore');
    		store.state.googleMapsReady = true;
    		store.emit('GOOGLE_MAPS_READY');
    	}
    },
    isGoogleMapsReady: function () {
    	return this.state.googleMapsReady;
    },
    dehydrate: function () {
    	return this.state;
    },
    rehydrate: function (state) {
    	this.state = state;
    }
});