
/**
 * Module dependencies.
 */

var createStore = require('dispatchr/utils/createStore');

/**
 * Private internal state.
 */

var state = {
	venues: []
};

module.exports = createStore({
    initialize: function () {
    	console.log("The venueStore has been initialized!");
    },
    storeName: 'VenueStore',
    handlers: {
    	'VENUES_RETRIEVED': function (payload) {
			console.log('Venues have been retrieved! Payload: ', payload);

			state.venues = payload;
			console.log(this.emit);
		}
    },
    getVenues: function () {
    	return state.venues;
    }
});