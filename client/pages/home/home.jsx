
/**
 * Module dependencies.
 */

var React = require('react');

module.exports = React.createClass({
	getInitialState: function () {
		return {};
	},
	componentWillMount: function () {
		var venueStore = this.props.dispatcher.getStore('VenueStore');
		var me = this;
		venueStore.on('DO_THING', function () {
			me.setState({ abc: me.state.abc ? me.state.abc + 1 : 1 });
		});
	},
	componentWillUnmount: function () {
		var venueStore = this.props.dispatcher.getStore('VenueStore');
		venueStore.removeAllListeners();
	},
	render: function() {
		var venues = this.props.dispatcher.getStore('VenueStore').getVenues();

		var newResult = (
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
		
		return newResult;
	}
});