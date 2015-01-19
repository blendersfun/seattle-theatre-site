
/**
 * Dependencies.
 */

var express = require('express');
var React = require('react');
var serializeJavascript = require('serialize-javascript');

var fluxApp = require('../app/app');
var basePage = React.createFactory(require('../app/base'));
var navigateAction = require('../app/nav/navigate-action');

/**
 * Create an express application.
 */

var expressApp = express();

/**
 * Serve static assets from the generated 'public' folder.
 */

expressApp.use(express.static('dist/public'));

/**
 * Serve application page requests.
 */

expressApp.use(function (req, res, next) {
  var context = fluxApp.createContext();
  context.executeAction(navigateAction, { url: req.url }, function (result) {
    if (result && result.failed) {
      next();
    } else {
      var appConfig = {
        context: context.getComponentContext()
      };
      var renderedApp = React.renderToString(fluxApp.getAppComponent()(appConfig));
      var appState = 'window.appState = ' + serializeJavascript(fluxApp.dehydrate(context)) + ';';

      var docConfig = {
        title: 'Title',
        markup: renderedApp,
        state: 'window.state = ' + appState + ';'
      };
      var renderedHtml = '<!DOCTYPE html>' + 
        React.renderToStaticMarkup(basePage(docConfig));

      res.send(renderedHtml);
    }
  });
});

/**
 * Run the express application.
 */

var server = expressApp.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Seattle theatre app listening at http://%s:%s', host, port);
});
