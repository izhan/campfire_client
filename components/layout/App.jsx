var React = require('react');
var Router = require('react-router');
var $ = require('jquery');
var RouteHandler = Router.RouteHandler;

module.exports = React.createClass({
  componentDidMount: function() {
    var url = process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : 'https://obscure-citadel-9804.herokuapp.com';

    console.log("hello world");
    $.ajax({
      url: url + "/calendar_list",
      crossDomain: true,
      dataType: 'json',
      success: function(data) {
        console.log(data);
      }
    });
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
