
/**
 * Dependencies.
 */

var React = require('react');
var app = require('./app');

/**
 * Bootstrap application.
 */

app.rehydrate(window.appState, function (err, context) {
  if (err) throw err;

  window.context = context; // for debug

  var appConfig = {
    context: context.getComponentContext()
  };
  var mountNode = document.getElementById('app');
  React.render(app.getAppComponent()(appConfig), mountNode);
});
