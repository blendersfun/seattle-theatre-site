
/**
 * Dependencies.
 */

var React = require('react');
var StoreMixin = require('fluxible').StoreMixin;

/**
 * A list of matching persons to select from.
 */

module.exports = React.createClass({
  getDefaultProps: function () {
    return {
      matchingPersons: []
    };
  },
  render: function() {
    if (!this.props.matchingPersons.length) {
      return null;
    }

    return (
      <div className="matchingPersonList">
        {this.props.matchingPersons.map(function (p) {
          return (
            <div key={p.id}>{p.first_name +' '+p.last_name}</div>
            );
        })}
      </div>
    );
  }
});
