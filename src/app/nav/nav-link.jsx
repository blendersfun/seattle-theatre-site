
/**
 * Dependencies.
 */

var React = require('react');
var navigateAction = require('../nav/navigate-action');

/**
 * A specialized anchor tag which manages in-app navigation.
 */

module.exports = React.createClass({
  render: function() {
    return (
      <a href={this.props.href} onClick={this.navigate}>{this.props.text}</a>
    );
  },
  navigate: function (e) {
    e.preventDefault();
    history.pushState(null, null, this.props.href);
    this.props.context.executeAction(navigateAction, { url: this.props.href });
  }
});
