var React = require('react');
var Router = require('react-router');
var App = require('../components/layout/App.jsx');
var MainPage = require('../components/layout/main_page.coffee');
var Route = Router.Route;
var DefaultRoute = Router.DefaultRoute;


module.exports = (
  <Route name="app" path="/" handler={App}>
    <DefaultRoute name="home" handler={MainPage} />
  </Route>
);
