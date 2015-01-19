
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
		var mapsStore = this.props.dispatcher.getStore('GoogleMapsStore');

		venueStore.on('KILL_THEATRE', this.killTheatre);
		mapsStore.on('GOOGLE_MAPS_READY', this.initializeMap);
	},
	componentDidUpdate: function () {
		this.updatePins();	
	},
	componentWillUnmount: function () {
		var venueStore = this.props.dispatcher.getStore('VenueStore');
		venueStore.removeAllListeners();
	},
	render: function() {
		var venues = this.props.dispatcher.getStore('VenueStore').getVenues();	

		var newResult = (
			<div id="home-page">
				Wootbags!
				<div id="map-canvas" ref="mapCanvas"></div>
				<div id="list">
					<ul>
					{venues.map(function (venue) {
						return <li key={venue.id}>
							{venue.name + ': '} 

							{/*venue.address.line1 +' '+ 
							venue.address.line2 +' '+ 
							venue.address.city +', '+ 
							venue.address.state +' '+ 
							venue.address.zip +' ['+
							venue.address.lat +', '+
							venue.address.lng +']'*/}

							<ul>
							{venue.performanceSpaces.map(function (space) {
								return <li key={space.id}>{space.name}</li>;
							})}
							</ul>
						</li>;
					})}
					</ul>
				</div>
			</div>
		);

		return newResult;
	},
	killTheatre: function () {
		this.setState({ abc: this.state.abc ? this.state.abc + 1 : 1 });
	},
	initializeMap: function () {
		var mapOptions = {
			center: { lat: 47.614848, lng: -122.3359059},
			zoom: 12
		};
		var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

		try { window.map = map; } catch (e) {} // for test.

		this.map = map;
		this.mapMarkers = {};
		this.updatePins();	
	},
	updatePins: function () {
		var venues = this.props.dispatcher.getStore('VenueStore').getVenues();
		if (this.map) {

			// kill dead markers:
			var stillAliveVenues = {};
			for (var i = 0; i < venues.length; i++) {
				stillAliveVenues[venues[i].id] = 1;
			}

			var keys = Object.keys(this.mapMarkers);
			var deadOnes = [];
			for (var i = 0; i < keys.length; i++) {
				if (!stillAliveVenues[keys[i]]) {
					deadOnes.push(keys[i]);
				}
			}

			for (var i = 0; i < deadOnes.length; i++) {
				var marker = this.mapMarkers[deadOnes[i]];
				marker.setMap(null);
				marker = null;
			}

			// create new markers:
			for (var i = 0; i < venues.length; i++) {
				if (!this.mapMarkers[venues[i].id]) {
					var latlng = new google.maps.LatLng(venues[i].address.lat, venues[i].address.lng);
					var marker = new google.maps.Marker({
					    position: latlng,
					    map: this.map,
					    title: venues[i].name
					});
					this.mapMarkers[venues[i].id] = marker;
				}
			}
		}
	}
});