React = require('react')
$ = require('jquery');

module.exports = React.createClass
  # TODO make this a mixin
  contextTypes: {
    currentUser: React.PropTypes.object
  },

  render: ->
    { div } = React.DOM

    div null,
      "THIS IS YOUR CALENDAR"
      @context.currentUser.email