
/**
 * Module dependencies.
 */

var React = require('react');

module.exports = React.createClass({
	render: function() {
		return (
		<html>
			<head>
				<title>{this.props.title}</title>
			    <style type="text/css">
			      {'html, body, #app, #home-page, #list, #map-canvas { height: 100%; margin: 0; padding: 0; overflow: hidden; } '}
			      {'#map-canvas { width: 70%; } '}
			      {'#list { width: 30%; position: absolute; top: 0; right: 0; overflow: auto; } '}
			    </style>
				<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9PjKau31h9r6FE2LTuLTeb5WWOPy__Yg"></script>
				<script dangerouslySetInnerHTML={{__html: this.props.googleMapsBootstrap}}></script>
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