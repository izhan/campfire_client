var React = require('react');
var Router = require('react-router');
var App = require('../components/layout/App.jsx');
var Route = Router.Route;

module.exports = (
  <Route name="app" path="/" handler={App}>
  </Route>
);
