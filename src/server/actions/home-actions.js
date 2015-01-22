
/**
 * Dependencies.
 */

var mysql = require('mysql');
var queries = require('./home-queries');

/**
 * Home page actions.
 */

module.exports = {
  loadPage: function (actionContext, payload, done) {
    var connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'seattle_theatre'
    });

    connection.connect();

    connection.query(queries.retrieveVenues, function(err, rows) {
      if (err) {
        throw err;
      }

      actionContext.dispatch('venuesLoaded', rows);
      done();
    });

    connection.end();
  }
};