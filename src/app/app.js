
/**
 * Dependencies.
 */

var React = require('react');
var Fluxible = require('fluxible');
var routrPlugin = require('fluxible-plugin-routr');
var fetchrPlugin = require('fluxible-plugin-fetchr');
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
app.plug(fetchrPlugin({
  xhrPath: '/api'
}));

/**
 * Register stores.
 */

app.registerStore(require('./nav/navigate-store'));
app.registerStore(require('./maps/google-maps-store'));
app.registerStore(require('./pages/home/venue-store'));
app.registerStore(require('./pages/update-production/update-production-store'));

/**
 * Register pages.
 */

pageRegistry.registerPage('home', require('./pages/home/home'));
pageRegistry.registerPage('updateProduction', require('./pages/update-production/update-production'));
pageRegistry.registerPage('testPage', require('./pages/test'));

/**
 * Export app.
 */

module.exports = app;
