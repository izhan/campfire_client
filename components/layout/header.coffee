React = require('react')

AuthActions = require('../../actions/auth_action.coffee')
CalendarActions = require('../../actions/calendar_action.coffee')

module.exports = React.createClass
  displayName: "Header"

  # TODO make this a mixin
  contextTypes: {
    currentUser: React.PropTypes.object
  },

  onToggleSidebarClick: ->
    $("#wrapper").toggleClass("toggled")

  onLogoutClick: ->
    AuthActions.logoutUser()
    CalendarActions.clearAllEvents()

  getUserEmail: ->
    if @context.currentUser? then @context.currentUser.email else ""

  render: ->
    { div, nav } = React.DOM

    nav
      className: "navbar navbar-default navbar-static-top header-navbar"
      div
        className: "container"
        "Header"
        @getUserEmail()

        div
          className: "btn btn-default"
          onClick: @onToggleSidebarClick
          "Toggle"

        div
          className: "btn btn-default"
          onClick: @onLogoutClick
          "Logout"