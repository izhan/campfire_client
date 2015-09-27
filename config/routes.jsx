var React = require('react');
var Router = require('react-router');
var App = require('../components/layout/App.jsx');
var Route = Router.Route;
var DefaultRoute = Router.DefaultRoute;

var CalendarPage = require("../components/calendar/calendar_page.coffee")
var LoginPage = require("../components/auth/login_page.coffee")

module.exports = (
  <Route name="app" path="/" handler={App}>
    <DefaultRoute name="login" handler={LoginPage} />
    <Route name="calendar" handler={CalendarPage} />
  </Route>
);
