
/**
 * Dependencies.
 */

var React = require('react');
var StoreMixin = require('fluxible').StoreMixin;

/**
 * Create person form.
 */

module.exports = React.createClass({
  getInitialState: function () {
    return {
      first: '',
      middle: '',
      last: ''
    };
  },
  render: function() {
    return (
      <div className="createPerson">
        <div className="form-group">
          <label htmlFor="first">First name</label>
          <input className="form-control" id="first" value={this.state.first} onChange={this.handleChange}/>
        </div>
        <div className="form-group">
          <label htmlFor="middle">Middle name</label>
          <input className="form-control" id="middle" value={this.state.middle} onChange={this.handleChange}/>
        </div>
        <div className="form-group">
          <label htmlFor="last">Last name</label>
          <input className="form-control" id="last" value={this.state.last} onChange={this.handleChange}/>
        </div>
      </div>
    );
  },
  handleChange: function (e) {
    var me = this;
    var stateChange = {};
    stateChange[e.target.id] = e.target.value;
    this.setState(stateChange, function () {
      if (me.props.onChange) {
        me.props.onChange();
      }
    });
  },
  getPerson: function () {
    return {
      first_name: this.state.first,
      middle_name: this.state.middle || null,
      last_name: this.state.last
    };
  }
});
