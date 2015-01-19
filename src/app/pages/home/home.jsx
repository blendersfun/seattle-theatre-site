
/**
 * Dependencies.
 */

var React = require('react');
var NavLink = require('../../nav/nav-link');

/**
 * Home page.
 */

module.exports = React.createClass({
  getInitialState: function () {
    var venues = this.props.context.getStore('venue').getVenues();

    return {
      venues: venues
    }
  },
  render: function() {
    return (
      <div id="home-page">
        <div id="map-canvas" ref="mapCanvas"></div>
        <div id="list">
          <ul>
          {this.state.venues.map(function (venue) {
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
  }
});
