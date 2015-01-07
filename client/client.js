
/**
 * Module dependencies.
 */

var React = require('react');
var Dispatcher = require('dispatchr')();
var PageRegistry = require('../public/navigation/PageRegistry');
var VenueStore = require('../public/pages/home/venueStore');
var GoogleMapsStore = require('../public/pages/home/googleMapsStore');
var NavigationStore = require('../public/navigation/NavigationStore');

var HomePage = React.createFactory(require('../public/pages/home/home'));
var CreateProductionPage = React.createFactory(require('../public/pages/admin/createProduction/createProduction'));

window.React = React; // for chrome dev tool support

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
 * Bootstrap application.
 */

var dispatcher = new Dispatcher({});
var mountNode = document.getElementById('app');	

dispatcher.rehydrate(window.app);
window.dispatcher = dispatcher; // for test.

var Page = PageRegistry.getPage(dispatcher.getStore('NavigationStore').getCurrentPage());
React.render(
    Page({ dispatcher: dispatcher }),
    mountNode
);