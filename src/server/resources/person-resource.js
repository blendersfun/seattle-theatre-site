
/**
 * Dependencies.
 */

var mysql = require('mysql');
var queries = require('./person-queries');

/**
 * Person resource.
 */

var PersonResource = {
  name: 'people',

  connect: function () {
    var connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'seattle_theatre'
    });

    connection.connect();

    return connection;
  },

  read: function (req, resource, params, config, callback) {
    var connection = this.connect();

    if (params.id) {
      connection.query(queries.readPersonById, params.id, function(err, result) {
        if (err) {
          callback(err);
        } else {
          callback(null, result[0]);
        }
      });
    } else if (params.matchers) {
      var query = 'select * from person where ';
      var likes = [];
      var matchers = JSON.parse(params.matchers);

      if (matchers.first_name) {
        likes.push("lower(first_name) like '" + matchers.first_name.toLowerCase() + "%'");
      }
      if (matchers.middle_name) {
        likes.push("lower(middle_name) like '" + matchers.middle_name.toLowerCase() + "%'");
      }
      if (matchers.last_name) {
        likes.push("lower(last_name) like '" + matchers.last_name.toLowerCase() + "%'");
      }
      if (likes.length) {
        query += likes.join(" and ") + ';';
        connection.query(query, {}, function(err, rows) {
          if (err) {
            callback(err);
          } else {
            callback(null, rows);
          }
        });
      }
    }

    connection.end();
  },
  create: function(req, resource, params, body, config, callback) {
    var connection = this.connect();

    var values = [
      body.first_name,
      body.middle_name,
      body.last_name,
      body.gender,
      body.in_actors_equity
    ];

    connection.query(queries.createPerson, values, function(err, result) {
      if (err) {
        callback(err);
      } else {
        callback(null, result.insertId);
      }
    });

    connection.end();
  },
  update: function(req, resource, params, body, config, callback) {
    var connection = this.connect();

    connection.query(queries.updatePerson, [body, params.id], function(err, result) {
      if (err) {
        callback(err);
      } else {
        callback(null, true);
      }
    });

    connection.end();
  },
  delete: function (req, resource, params, config, callback) {
    var connection = this.connect();

    connection.query(queries.deletePerson, params.id, function(err, rows) {
      if (err) {
        callback(err);
      } else {
        callback(null, rows);
      }
    });

    connection.end();
  }
};

module.exports = PersonResource;