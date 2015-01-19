
/**
 * Dependencies.
 */

var React = require('react');

/**
 * Base html document component.
 * Served as static html, wraps single-page app.
 */

module.exports = React.createClass({
  render: function() {
    return (
      <html>
        <head>
          <title>{this.props.title}</title>
          <style type="text/css">
            {'html, body, #app, #app-component, #home-page, #list, #map-canvas { height: 100%; margin: 0; padding: 0; overflow: hidden; } '}
            {'#map-canvas { width: 70%; } '}
            {'#list { width: 30%; position: absolute; top: 0; right: 0; overflow: auto; } '}
          </style>
        </head>
        <body>
          <div id="app" dangerouslySetInnerHTML={{__html: this.props.markup}}></div>
        </body>
        <script dangerouslySetInnerHTML={{__html: this.props.state}}></script>
        <script src="/client.js"></script>
      </html>
    );
  }
});
