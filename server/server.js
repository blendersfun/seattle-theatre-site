
/**
 * Module dependencies.
 */

var express = require('express');
var serialize = require('serialize-javascript');
var mysql = require('mysql');
var React = require('react');
var Dispatcher = require('dispatchr')();
var Q = require('q');

var StaticBaseLayout = React.createFactory(require('../public/index'));
var HomePage = React.createFactory(require('../public/pages/home/home'));
var VenueStore = require('../public/pages/home/venueStore');
var GoogleMapsStore = require('../public/pages/home/googleMapsStore');
var HomePageQueries = require('../public/pages/home/homeQueries.json');

/**
 * Create an express application.
 */

var app = express();

/**
 * Serve static assets from the generated 'public' folder.
 */

app.use(express.static('public'));

/**
 * Register stores.
 */

Dispatcher.registerStore(VenueStore);
Dispatcher.registerStore(GoogleMapsStore);

/**
 * Should be moved into an action handler, but for first-draft simplicity:
 */

function retrieveVenues (dispatcher) {
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

			dispatcher.dispatch('VENUES_RETRIEVED', rows);
			resolve();
		});

		connection.end();
	});
};

/**
 * Proof of concept for rendering react on the server.
 */

app.get('/', function (req, res) {
	var dispatcher = new Dispatcher({});
	retrieveVenues(dispatcher).then(onFullfill, onReject);

	function onFullfill () {
		try {
			var renderedApp = React.renderToString(HomePage({ dispatcher: dispatcher }));

			var stateBootstrap = 
				'window.app = ' + serialize(dispatcher.dehydrate()) + ';';

			var googleMapsBootstrap =
			    'function initialize() { dispatcher.dispatch(\'GOOGLE_MAPS_READY\'); } ' +
				'google.maps.event.addDomListener(window, \'load\', initialize);'

			var renderedHtml = '<!DOCTYPE html>' + 
				React.renderToStaticMarkup(StaticBaseLayout({
					markup: renderedApp,
					state: stateBootstrap,
					title: 'Title!',
					googleMapsBootstrap: googleMapsBootstrap
				}));
			res.send(renderedHtml);
		} catch (e) {
			onReject(e);
		}
	}

	function onReject (reason) {
		var renderedHtml = '<!DOCTYPE html>' + 
			React.renderToStaticMarkup(StaticBaseLayout({
				markup: 'Something went wrong: ' + reason,
				state: 'window.app = null;',
				title: 'Error!',
				googleMapsBootstrap: ''
			}));
		res.send(renderedHtml);
	}

});

/**
 * Run the express application.
 */

var server = app.listen(3000, function () {
	var host = server.address().address;
	var port = server.address().port;

	console.log('Seattle theatre app listening at http://%s:%s', host, port);
});