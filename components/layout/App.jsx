var React = require('react');
var Router = require('react-router');
var Reflux = require('reflux');
var AuthStore = require('../../stores/auth_store.coffee')

var AuthActions = require('../../actions/auth_action.coffee')

var $ = require('jquery');
var RouteHandler = Router.RouteHandler;

// TODO add PureRenderMixin to all of these
module.exports = React.createClass({
  render: function () {
    return (
      <div>
        <RouteHandler />
      </div>
    );
  }
});
