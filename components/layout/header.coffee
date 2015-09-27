React = require('react')

AuthActions = require('../../actions/auth_action.coffee')

module.exports = React.createClass
  displayName: "Header"

  # TODO make this a mixin
  contextTypes: {
    currentUser: React.PropTypes.object
  },

  onLogoutClick: ->
    AuthActions.logoutUser()

  getUserEmail: ->
    if @context.currentUser? then @context.currentUser.email else ""

  render: ->
    { div } = React.DOM

    div null,
      "Header"
      @getUserEmail()

      div
        className: "btn btn-default"
        onClick: @onLogoutClick
        "Logout"