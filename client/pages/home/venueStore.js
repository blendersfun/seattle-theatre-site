
/**
 * Module dependencies.
 */

var createStore = require('dispatchr/utils/createStore');

module.exports = createStore({
    initialize: function () {
    	this.state = {
			venues: []
		};
    },
    storeName: 'VenueStore',
    handlers: {
    	'VENUES_RETRIEVED': function (rows) {
    		var store = this.dispatcher.getStore('VenueStore');
    		var venues = {};

    		for (var i = 0; i < rows.length; i++) {
    			var row = rows[i], 
    			    vid = row.venue_id,
    			    venue = venues[vid],
    			    performanceSpace = {
    			    	id: row.space_id,
    			    	name: row.space_name
	    			};

    			if (venue) {
    				venue.performanceSpaces.push(performanceSpace);
    			} else {
	    			venues[vid] = {
	    				id: vid,
	    				name: row.venue_name,
	    				performanceSpaces: [performanceSpace],
    			    	address: {
    			    		line1: row.line1,
    			    		line2: row.line2,
    			    		city: row.city,
    			    		state: row.state,
    			    		zip: row.zip
    			    	}
	    			}
    			}
    		}

    		var venuesArray = [];
    		for (var i in venues) {
    			if (venues.hasOwnProperty(i)) {
    				venuesArray.push(venues[i]);
    			}
    		}

			store.state.venues = venuesArray;
		},
		'DO_THING': function () {
    		var store = this.dispatcher.getStore('VenueStore');
    		store.state.venues.pop();
    		store.emit('DO_THING');
		}
    },
    getVenues: function () {
    	return this.state.venues;
    },
    dehydrate: function () {
    	return this.state;
    },
    rehydrate: function (state) {
    	this.state = state;
    }
});