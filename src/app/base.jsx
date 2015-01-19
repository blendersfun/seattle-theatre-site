
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
          <link rel="stylesheet" type="text/css" href="/style.css"/>
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
