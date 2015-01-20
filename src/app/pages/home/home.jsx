
/**
 * Dependencies.
 */

var React = require('react');
var StoreMixin = require('fluxible').StoreMixin;
var GoogleMapsStore = require('../../maps/google-maps-store');
var NavLink = require('../../nav/nav-link');
var loadGoogleMapsAction = require('../../maps/load-google-maps-action');

/**
 * Home page.
 */

module.exports = React.createClass({
  mixins: [StoreMixin],
  statics: {
    storeListeners: [GoogleMapsStore]
  },
  getInitialState: function () {
    var venues = this.props.context.getStore('venue').getVenues();

    return {
      venues: venues
    }
  },
  componentDidMount: function () {
    var mapsIsReady = this.props.context.getStore('google-maps').isReady();
    if (mapsIsReady) {
      this.renderMap();
    } else {
      this.props.context.executeAction(loadGoogleMapsAction);
    }
  },
  render: function() {
    return (
      <div className="homePage">
        <div className="homePage-mapCanvas" ref="mapCanvas"></div>
        <div className="homePage-list">
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
  },
  onChange: function () {
    var mapsIsReady = this.props.context.getStore('google-maps').isReady();
    if (mapsIsReady) {
      this.renderMap();
    }
  },
  renderMap: function () {
    var mapOptions = {
      center: { lat: 47.614848, lng: -122.3359059},
      zoom: 12
    };
    var map = new google.maps.Map(this.refs.mapCanvas.getDOMNode(), mapOptions);

    try { window.map = map; } catch (e) {} // for test.

    this.map = map;
    this.mapMarkers = {};
    this.updatePins();  
  },
  updatePins: function () {
    var venues = this.props.context.getStore('venue').getVenues();
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
