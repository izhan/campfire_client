var React = require('react');
var Router = require('react-router');

var RouteHandler = Router.RouteHandler;

// TODO add PureRenderMixin to all of these
module.exports = React.createClass({
  render: function () {
    return (
      <div className="page-wrapper">
        <RouteHandler />
      </div>
    );
  }
});
