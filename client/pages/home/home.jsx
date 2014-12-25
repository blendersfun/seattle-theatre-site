
/**
 * Module dependencies.
 */

var React = require('react');

module.exports = React.createClass({
	render: function() {
		var venues = this.props.dispatcher.getStore('VenueStore').getVenues();

		return (
			<div>
				Home page. <br/>
				VenueStore:
				<ul>
				{venues.map(function (venue) {
					return <li key={venue.id}>
						{venue.name + ': '} 

						{venue.address.line1 +' '+ 
						venue.address.line2 +' '+ 
						venue.address.city +', '+ 
						venue.address.state +' '+ 
						venue.address.zip}

						<ul>
						{venue.performanceSpaces.map(function (space) {
							return <li key={space.id}>{space.name}</li>;
						})}
						</ul>
					</li>;
				})}
				</ul>
			</div>
		);
	}
});