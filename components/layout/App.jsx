var React = require('react');
var Router = require('react-router');
var Reflux = require('reflux');
var AuthStore = require('../../stores/auth_store.coffee')

var AuthActions = require('../../actions/auth_action.coffee')

var $ = require('jquery');
var RouteHandler = Router.RouteHandler;

module.exports = React.createClass({
  mixins: [Reflux.ListenerMixin],

  onAuthChange: function() {
    var currentUser = AuthStore.getCurrentUser();

    console.log("auth changed!!!");
    console.log(currentUser);
  },

  componentDidMount: function() {
    this.listenTo(AuthStore, this.onAuthChange);
  },

  render: function () {
    return (
      <div>
        hello
        <RouteHandler/>
      </div>
    );
  }
});
