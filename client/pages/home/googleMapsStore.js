
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
    		this.state.googleMapsReady = true;
    		this.emit('GOOGLE_MAPS_READY');
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