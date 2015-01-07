
/**
 * Module dependencies.
 */

var mysql = require('mysql');
var Q = require('q');
var HomePageQueries = require('../../../public/pages/home/homeQueries.json');

var HomeActions = function (dispatcher) {
	this.dispatcher = dispatcher;
}

HomeActions.prototype.prepareStores = function () {
	return this.retrieveVenues();
};

HomeActions.prototype.retrieveVenues = function () {
	var me = this;

	return Q.Promise(function (resolve, reject) {
		var connection = mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'seattle_theatre'
		});

		connection.connect();

		connection.query(HomePageQueries.retrieveVenues, function(err, rows) {
			if (err) {
				console.log('ERROR!!', err);
				reject(err);
			}

			me.dispatcher.dispatch('VENUES_RETRIEVED', rows);
			resolve({ useGoogleMaps: true });
		});

		connection.end();
	});
};

module.exports = HomeActions;