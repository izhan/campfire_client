React = require('react')
Reflux = require('reflux')

AuthActions = require('../../actions/auth_action.coffee')
CalendarListContainer = require('./calendar_list_container.coffee')
CalendarContainer = require('./calendar_container.coffee')

module.exports = React.createClass
  displayName: "CalendarPage"
  
  mixins: [ Reflux.ListenerMixin ]
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
      "THIS IS YOUR CALENDAR"
      @getUserEmail()


      div
        className: "potato"
        onClick: @onLogoutClick
        "Logout"

      React.createElement CalendarListContainer

      React.createElement CalendarContainer
      