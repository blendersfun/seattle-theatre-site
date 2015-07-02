
/**
 * Dependencies.
 */

var createStore = require('../../core/create-store');

/**
 * A store to manage theatrical venues.
 */

var VenueStore = createStore({
  initialize: function () {
    this.state = {
      venues: []
    };
  },
  storeName: 'venue',
  handlers: {
    venuesLoaded: function (rows) {
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
                zip: row.zip,
                lat: row.lat,
                lng: row.lng
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

      this.state.venues = venuesArray;
      this.emitChange();
    }
  },
  getVenues: function () {
    return this.state.venues;
  }
});

module.exports = VenueStore;
