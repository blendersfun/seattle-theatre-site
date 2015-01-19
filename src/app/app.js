
/**
 * Dependencies.
 */

var React = require('react');
var Fluxible = require('fluxible');

/**
 * Create fluxible app.
 */

var app = new Fluxible({
  appComponent: React.createFactory(require('./app-component'))
});

/**
 * Export app.
 */

module.exports = app;