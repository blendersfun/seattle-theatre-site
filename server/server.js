
/**
 * Module dependencies.
 */

var express = require('express');
var serialize = require('serialize-javascript');
var React = require('react');
var Dispatcher = require('dispatchr')();
var extend = require('extend');
var Q = require('q');

var Router = require('../public/navigation/Router');
var PageRegistry = require('../public/navigation/PageRegistry');

var BasePage = React.createFactory(require('../public/base'));
var HomePage = React.createFactory(require('../public/pages/home/home'));
var VenueStore = require('../public/pages/home/venueStore');
var GoogleMapsStore = require('../public/pages/home/googleMapsStore');

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
 * Register pages.
 */

PageRegistry.registerPage('Home', HomePage);

/**
 * Proof of concept for rendering react on the server.
 */

app.use(function (req, res, next) {

	var route = Router.getRoute(req.url);
	console.log('routeFound', route);	
	if (route) {	
			var dispatcher = new Dispatcher({});
			var pageAction = null;

			if (route.config.serverAction) {
				console.log('serverActionFound:', route.config.serverAction);

				pageAction = new (require('./actions/' + route.config.serverAction))(dispatcher);
				console.log(pageAction);
				var pagePromise = pageAction.prepareStores();
				console.log('pagePromise:', pagePromise);
				pagePromise.then(
					onFullfill.bind(null, res, dispatcher), 
					onReject.bind(null, res));
			} else {
				onFullfill(dispatcher);
			}
	} else {
		next();
	}
});

function onFullfill (res, dispatcher, configOverrides) {
	console.log('onFullfill');	
	try {
		var stateBootstrap = 
			'window.app = ' + serialize(dispatcher.dehydrate()) + ';';

		var googleMapsBootstrap =
		    'function initialize() { dispatcher.dispatch(\'GOOGLE_MAPS_READY\'); } ' +
			'google.maps.event.addDomListener(window, \'load\', initialize);';

		var renderedApp = React.renderToString(HomePage({ dispatcher: dispatcher }));

		var config = {
			markup: renderedApp,
			state: stateBootstrap,
			title: 'Title!',
			googleMapsBootstrap: googleMapsBootstrap,
			useGoogleMaps: false
		};

		if (configOverrides) {
			extend(false, config, configOverrides);
		}

		var renderedHtml = '<!DOCTYPE html>' + React.renderToStaticMarkup(BasePage(config));


		console.log('wtf2', renderedHtml);

		res.send(renderedHtml);
	} catch (e) {
		onReject(e);
	}
}

function onReject (res, reason) {
	var appConfig = {
		markup: 'Something went wrong: ' + reason,
		state: 'window.app = null;',
		title: 'Error!',
		googleMapsBootstrap: null
	};

	var renderedHtml = '<!DOCTYPE html>' + React.renderToStaticMarkup(BasePage(appConfig));
	res.send(renderedHtml);
}

/**
 * Run the express application.
 */

var server = app.listen(3000, function () {
	var host = server.address().address;
	var port = server.address().port;

	console.log('Seattle theatre app listening at http://%s:%s', host, port);
});