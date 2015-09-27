require('./assets/app.css');
require('./assets/fullcalendar.min.css');

require('./assets/home.scss')

var React = require('react');
var Router = require('react-router');
var routes = require('./config/routes.jsx');

Router.run(routes, Router.HistoryLocation, function(Handler) {
  React.render(<Handler/>, document.body);
});
