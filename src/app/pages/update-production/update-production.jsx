
/**
 * Dependencies.
 */

var React = require('react');
var StoreMixin = require('fluxible').StoreMixin;
var CreatePerson = require('./create-person');
var MatchingPersonList = require('./matching-person-list');
var actions = require('./update-production-actions');
var UpdateProductionStore = require('./update-production-store');

/**
 * Create production page.
 */

module.exports = React.createClass({
  mixins: [StoreMixin],
  statics: {
    storeListeners: [UpdateProductionStore]
  },
  getInitialState: function () {
    return this.getStateFromStores();
  },
  onChange: function () {
    this.setState(this.getStateFromStores());
  },
  getStateFromStores: function () {
    return {
      authorMatches: this.props.context.getStore(UpdateProductionStore).getAuthorMatches()
    };
  },
  render: function() {
    return (
      <div className="updateProductionPage">
        <form>
          <CreatePerson ref="createPerson" onChange={this.handlePersonChange}/>
          <MatchingPersonList ref="matchingPersons" matchingPersons={this.state.authorMatches}/>
          <button type="submit" className="btn btn-primary" onClick={this.submit}>Save</button>
        </form>
      </div>
    );
  },
  handlePersonChange: function () {
    var person = this.refs.createPerson.getPerson();
    this.props.context.executeAction(actions.getAuthorMatches, person);
  },
  submit: function (e) {
    e.preventDefault();
    var person = this.refs.createPerson.getPerson();
    this.props.context.executeAction(actions.createAuthor, person);
  }
});
