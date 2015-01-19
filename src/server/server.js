
/**
 * Dependencies.
 */

var express = require('express');

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
  res.send('hello');
});

/**
 * Run the express application.
 */

var server = expressApp.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Seattle theatre app listening at http://%s:%s', host, port);
});