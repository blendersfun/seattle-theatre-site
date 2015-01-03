
/**
 * Module dependencies.
 */

var React = require('react');

module.exports = React.createClass({
	render: function() {
		var venues = this.props.dispatcher.getStore('VenueStore').getVenues();	

		var newResult = (
			<div id="create-production">
				Create a new production here! Woo!
			</div>
		);

		return newResult;
	}
});