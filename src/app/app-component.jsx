
/**
 * Dependencies.
 */

var React = require('react');
var StoreMixin = require('fluxible').StoreMixin;
var NavigateStore = require('./nav/navigate-store');
var navigateAction = require('./nav/navigate-action');
var pageRegistry = require('./page-registry');

/**
 * Top-level component above all specific pages.
 */

module.exports = React.createClass({
  mixins: [StoreMixin],
  statics: {
    storeListeners: [NavigateStore]
  },
  componentDidMount: function () {
    window.onpopstate = this.navigate;
  },
  componentWillUnmount: function () {
    window.onpopstate = null;
  },
  getInitialState: function () {
    var navStore = this.props.context.getStore('navigate');

    return {
      currentPage: navStore.getCurrentPage()
    };
  },
  render: function() {
    var Page = pageRegistry.getPage(this.state.currentPage);

    return (
      <div className="app">{React.createElement(Page,{ context: this.props.context })}</div>
    );
  },
  onChange: function () {
    var navStore = this.props.context.getStore('navigate');

    this.setState({
      currentPage: navStore.getCurrentPage()
    });
  },
  navigate: function () {
    this.props.context.executeAction(navigateAction, { url: location.pathname });
  }
});
