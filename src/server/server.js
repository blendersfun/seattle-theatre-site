
/**
 * Dependencies.
 */

var express = require('express');
var React = require('react');
var serializeJavascript = require('serialize-javascript');
var bodyParser = require('body-parser');

var fluxApp = require('../app/app');
var basePage = React.createFactory(require('../app/base'));
var navigateAction = require('../app/nav/navigate-action');

var venueResource = require('./resources/venue-resource');
var personResource = require('./resources/person-resource');

/**
 * Create an express application.
 */

var expressApp = express();

/**
 * Serve static assets from the generated 'public' folder.
 */

expressApp.use(express.static('dist/public'));

/**
 * Setup fetchr middleware.
 */

var fetchrInstance = fluxApp.getPlugin('FetchrPlugin');
expressApp.use(bodyParser.json());
expressApp.use(fetchrInstance.getXhrPath(), fetchrInstance.getMiddleware());

/**
 * Register resources.
 */

fetchrInstance.registerService(venueResource);
fetchrInstance.registerService(personResource);

/**
 * Serve application page requests.
 */

expressApp.use(function (req, res, next) {
  var context = fluxApp.createContext({ req: req });
  context.executeAction(navigateAction, { url: req.url }, function (err) {
    if (err) {
      next();
    } else {
      var appConfig = {
        context: context.getComponentContext()
      };
      var renderedApp = React.renderToString(fluxApp.getAppComponent()(appConfig));
      var appState = serializeJavascript(fluxApp.dehydrate(context));

      var docConfig = {
        title: 'Title',
        markup: renderedApp,
        state: 'window.appState = ' + appState + ';'
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
