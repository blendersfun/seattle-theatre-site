
/**
 * Dependencies.
 */

var React = require('react');
var NavLink = require('../nav/nav-link');

/**
 * Home page.
 */

module.exports = React.createClass({
  render: function() {
    return (
      <div>I am home. <NavLink context={this.props.context} href="/testPage" text="Test"/></div>
    );
  }
});
