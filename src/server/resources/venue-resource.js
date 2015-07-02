
/**
 * Dependencies.
 */

var mysql = require('mysql');
var queries = require('./venue-queries');

/**
 * Venue
 */

var VenueResource = {
  name: 'venues',

  read: function(req, resource, params, config, callback) {
    var connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'seattle_theatre'
    });

    connection.connect();

    connection.query(queries.readVenues, function(err, rows) {
      if (err) {
        callback(err);
      } else {
        callback(null, rows);
      }
    });

    connection.end();
  }
};

module.exports = VenueResource;