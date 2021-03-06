require('./assets/app.scss');
require('./assets/fullcalendar.min.css');

require('./assets/home.scss')
require('./assets/calendar.scss')
require('./assets/calendar_list.scss')
require('./assets/sidebar.scss')
require('./assets/header.scss')
require('./assets/spinner.scss')
require('./assets/circle_spinner.scss')

require('./assets/fonts.scss')

var React = require('react');
var Router = require('react-router');
var routes = require('./config/routes.jsx');

Router.run(routes, Router.HistoryLocation, function(Handler) {
  React.render(<Handler/>, document.body);
});
