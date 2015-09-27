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
    baseUrl: React.PropTypes.string
  },

  getChildContext: function () {
    return {
      baseUrl: this.getBaseUrl()
    };
  },

  getBaseUrl: function() {
    return process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : 'https://obscure-citadel-9804.herokuapp.com';
  },

  onAuthChange: function(current_user) {
    console.log("auth changed!!!");
    console.log(current_user);
  },

  componentDidMount: function() {
    var url = this.getBaseUrl()

    console.log("hello world");
    $.ajax({
      url: url + "/calendar_list",
      crossDomain: true,
      dataType: 'json',
      success: function(data) {
        console.log(data);
        AuthStore.loginUser();
      }
    });

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
