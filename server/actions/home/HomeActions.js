
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
	console.log('prepareStores');
	return this.retrieveVenues();
};

HomeActions.prototype.retrieveVenues = function () {
	console.log('retrieve venues');
	var me = this;

	return Q.Promise(function (resolve, reject) {
		console.log('Inside Q.promise');
		var connection = mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'seattle_theatre'
		});

		connection.connect();

		connection.query(HomePageQueries.retrieveVenues, function(err, rows) {
			console.log('wtf', HomePageQueries);
			if (err) {
				console.log('ERROR!!', err);
				reject(err);
			}

			me.dispatcher.dispatch('VENUES_RETRIEVED', rows);
			console.log('before resolve');
			resolve({ useGoogleMaps: true });
		});

		connection.end();
	});
};

module.exports = HomeActions;