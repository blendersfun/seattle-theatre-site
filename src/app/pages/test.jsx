
/**
 * Dependencies.
 */

var React = require('react');
var NavLink = require('../nav/nav-link');

/**
 * Test page.
 */

module.exports = React.createClass({
  render: function() {
    return (
      <div>I am test. <NavLink context={this.props.context} href="/" text="Home"/></div>
    );
  }
});
