var React = require('react');
var Router = require('react-router');
var Reflux = require('reflux');
var AuthStore = require('../../stores/auth_store.coffee')

var AuthActions = require('../../actions/auth_action.coffee')

var $ = require('jquery');
var RouteHandler = Router.RouteHandler;

module.exports = React.createClass({
  mixins: [Reflux.ListenerMixin],

  childContextTypes: {
    loggedIn: React.PropTypes.bool,
    currentUser: React.PropTypes.object
  },

  getChildContext: function () {
    return {
      loggedIn: this.state.loggedIn,
      currentUser: this.state.currentUser
    };
  },

  getInitialState: function() {
    return {
      loggedIn: false,
      currentUser: null
    };
  },

  onAuthChange: function() {
    var currentUser = AuthStore.getCurrentUser();
    var loggedIn = AuthStore.isLoggedIn();
    this.setState({
      loggedIn: loggedIn,
      currentUser: currentUser
    });

    console.log("auth changed!!!");
    console.log(currentUser);
    console.log(loggedIn);
  },

  componentWillMount: function() {
    console.log('app mounted');
    AuthActions.fetchCurrentUser();
  },

  componentDidMount: function() {
    this.listenTo(AuthStore, this.onAuthChange);
  },

  render: function () {
    return (
      <div>
        hello
        <RouteHandler />
      </div>
    );
  }
});
