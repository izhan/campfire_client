var React = require('react');
var Router = require('react-router');

var RouteHandler = Router.RouteHandler;

// TODO add PureRenderMixin to all of these
// TODO convert all .jsx files to .coffee
module.exports = React.createClass({
  render: function () {
    return (
      <div className="page-wrapper">
        <RouteHandler />
      </div>
    );
  }
});
