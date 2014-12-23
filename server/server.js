
/**
 * Module dependencies.
 */

var express = require('express');
var mysql = require('mysql');

/**
 * Create an express application.
 */

var app = express();

app.get('/', function (req, res) {
	var connection = mysql.createConnection({
		host: 'localhost',
		user: 'root',
		password: '',
		database: 'seattle_theatre'
	});

	connection.connect();

	var queryText = 
		'SELECT po.name producer, ps.name space ' +
		'FROM performance_space ps, producer_admins_space pas, producing_org po ' +
		'WHERE po.id = pas.producer_id ' +
		'AND ps.id = pas.space_id';

	var responseText = 'What theatre producers administer what performance spaces: <br><br>\n\n';

	connection.query(queryText, function(err, rows, fields) {
		if (err) {
			throw err;
		}

		for (var i = 0; i < rows.length; i++) {
			responseText += rows[i].producer + '-' + rows[i].space + '<br>\n';
		}

		res.send(responseText);
	});

	connection.end();
});

/**
 * Run the express application.
 */

var server = app.listen(3000, function () {
	var host = server.address().address;
	var port = server.address().port;

	console.log('Seattle theatre app listening at http://%s:%s', host, port);
});