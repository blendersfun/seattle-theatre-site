
/**
 * Dependencies.
 */

var React = require('react');
var Fluxible = require('fluxible');
var routrPlugin = require('fluxible-plugin-routr');
var pageRegistry = require('./page-registry');

/**
 * Create fluxible app.
 */

var app = new Fluxible({
  appComponent: React.createFactory(require('./app-component'))
});

/**
 * Register plugins.
 */

app.plug(routrPlugin({
  routes: require('./routes')
}));

/**
 * Register stores.
 */

app.registerStore(require('./nav/navigate-store'));
app.registerStore(require('./maps/google-maps-store'));
app.registerStore(require('./pages/home/venue-store'));

/**
 * Register pages.
 */

pageRegistry.registerPage('home', React.createFactory(require('./pages/home/home')));
pageRegistry.registerPage('testPage', React.createFactory(require('./pages/test')));

/**
 * Export app.
 */

module.exports = app;
