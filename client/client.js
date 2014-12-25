
/**
 * Module dependencies.
 */

var React = require('react');
var Dispatcher = require('dispatchr')();
var VenueStore = require('../public/pages/home/venueStore');
var HomePage = React.createFactory(require('../public/pages/home/home'));

window.React = React; // for chrome dev tool support

/**
 * Register stores.
 */

Dispatcher.registerStore(VenueStore);

/**
 * Bootstrap application.
 */

var dispatcher = new Dispatcher({});
var mountNode = document.getElementById('app');	

dispatcher.rehydrate(window.app);
window.dispatcher = dispatcher; // for test.

React.render(
    HomePage({ dispatcher: dispatcher }),
    mountNode
);