
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
var NavigationStore = require('../public/navigation/NavigationStore');

var BasePage = React.createFactory(require('../public/base'));
var HomePage = React.createFactory(require('../public/pages/home/home'));
var VenueStore = require('../public/pages/home/venueStore');
var GoogleMapsStore = require('../public/pages/home/googleMapsStore');

var CreateProductionPage = React.createFactory(require('../public/pages/admin/createProduction/createProduction'));

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
Dispatcher.registerStore(NavigationStore);

/**
 * Register pages.
 */

PageRegistry.registerPage('Home', HomePage);
PageRegistry.registerPage('CreateProduction', CreateProductionPage);

/**
 * Middleware for handling application requests.
 */

app.use(function (req, res, next) {
	var route = Router.getRoute(req.url);
	if (route) {	
			var dispatcher = new Dispatcher({});
			var pageAction = null;

			dispatcher.dispatch('NAVIGATE', route);

			if (route.config.serverAction) {
				pageAction = new (require('./actions/' + route.config.serverAction))(dispatcher);
				var pagePromise = pageAction.prepareStores();
				pagePromise.then(
					onFullfill.bind(null, res, dispatcher), 
					onReject.bind(null, res));
			} else {
				onFullfill(res, dispatcher);
			}
	} else {
		next();
	}
});

function onFullfill (res, dispatcher, configOverrides) {
	try {
		var stateBootstrap = 
			'window.app = ' + serialize(dispatcher.dehydrate()) + ';';

		var Page = PageRegistry.getPage(dispatcher.getStore('NavigationStore').getCurrentPage());
		var renderedApp = React.renderToString(Page({ dispatcher: dispatcher }));

		var config = {
			markup: renderedApp,
			state: stateBootstrap,
			title: 'Title!',
			useGoogleMaps: false
		};

		if (configOverrides) {
			extend(false, config, configOverrides);
		}

		var renderedHtml = '<!DOCTYPE html>' + React.renderToStaticMarkup(BasePage(config));
		res.send(renderedHtml);
	} catch (e) {
		onReject(e);
	}
}

function onReject (res, reason) {
	var config = {
		markup: 'Something went wrong: ' + reason,
		state: 'window.app = null;',
		title: 'Error!',
		useGoogleMaps: false
	};

	var renderedHtml = '<!DOCTYPE html>' + React.renderToStaticMarkup(BasePage(config));
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