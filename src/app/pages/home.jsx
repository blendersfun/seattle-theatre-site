
/**
 * Dependencies.
 */

var React = require('react');
var navigateAction = require('../nav/navigate-action');

/**
 * Home page.
 */

module.exports = React.createClass({
  render: function() {
    return (
      <div>I am home. <button onClick={this.handle}>Go</button></div>
    );
  },
  handle: function () {
    this.props.context.executeAction(navigateAction, { url: '/testPage' });
  }
});
