React = require('react')
$ = require('jquery');

module.exports = React.createClass
  # TODO make this a mixin
  contextTypes: {
    currentUser: React.PropTypes.object
  },

  getUserEmail: ->
    if @context.currentUser? then @context.currentUser.email else ""

  render: ->
    { div } = React.DOM

    div null,
      "THIS IS YOUR CALENDAR"
      @getUserEmail()
