React = require('react')

AuthActions = require('../../actions/auth_action.coffee')
CalendarActions = require('../../actions/calendar_action.coffee')

module.exports = React.createClass
  displayName: "Header"

  # this could be a mixin in the future
  contextTypes: {
    currentUser: React.PropTypes.object
  },

  onToggleSidebarClick: ->
    $("#wrapper").toggleClass("toggled")

  onLogoutClick: ->
    AuthActions.logoutUser()
    CalendarActions.clearAllEvents()

  # currently unused.  can be removed
  getUserEmail: ->
    if @context.currentUser? then @context.currentUser.email else ""

  render: ->
    { div, nav, ul, li, a, img } = React.DOM

    nav
      className: "navbar navbar-default navbar-fixed-top header-navbar"

      div
        className: "navbar-brand header-center"
        img
          src: "./img/tent_only.png"

      div
        className: "navbar-brand"

      ul
        className: "nav navbar-nav navbar-left header-left"
        li null,
          a
            id: "toggle-button"
            onClick: @onToggleSidebarClick
            "Hide/Show Calendars"

      ul
        className: "nav navbar-nav navbar-right header-right"
        li null,
          a
            id: "logout-button"
            onClick: @onLogoutClick
            "Logout"  
