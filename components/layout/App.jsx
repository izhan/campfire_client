var React = require('react');
var Router = require('react-router');
var Reflux = require('reflux');
var AuthStore = require('../../stores/auth_store.coffee')

var AuthActions = require('../../actions/auth_action.coffee')

var $ = require('jquery');
var RouteHandler = Router.RouteHandler;

// TODO add PureRenderMixin to all of these
module.exports = React.createClass({
  mixins: [Reflux.ListenerMixin, Router.Navigation],

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

    // TODO clean this ugly mess
    if (!this.state.loggedIn && loggedIn) {
      this.transitionTo('calendar');
    } else if (this.state.loggedIn && !loggedIn) {
      this.transitionTo('login');
    }

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
