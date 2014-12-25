
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
			</head>
			<body>
				<div id="app" dangerouslySetInnerHTML={{__html: this.props.markup}}></div>
			</body>
			<script dangerouslySetInnerHTML={{__html: this.props.state}}></script>
			<script src="/client.js" defer></script>
		</html>
		);
	}
});