React = require('react')
$ = require('jquery');
Reflux = require('reflux')

AuthActions = require('../../actions/auth_action.coffee')
CalendarActions = require('../../actions/calendar_action.coffee')
CalendarStore = require('../../stores/calendar_store.coffee')

module.exports = React.createClass
  mixins: [ Reflux.ListenerMixin ]
  # TODO make this a mixin
  contextTypes: {
    currentUser: React.PropTypes.object
  },

  onCalendarFetch: ->
    console.log("lol calendar fetch")

  componentWillMount: ->
    console.log("gonna fetch")
    CalendarActions.fetchCalendarList()

  componentDidMount: ->
    @listenTo CalendarStore, @onCalendarFetch

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