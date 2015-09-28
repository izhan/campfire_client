React = require('react')
Router = require('react-router')
Reflux = require('reflux')

AuthStore = require('../../stores/auth_store.coffee')
AuthActions = require('../../actions/auth_action.coffee')
CalendarPage = require("../calendar/calendar_page.coffee")
LoginPage = require("../auth/login_page.coffee")

module.exports = React.createClass
  mixins: [
    Reflux.ListenerMixin
    Router.Navigation
  ]

  childContextTypes:
    loggedIn: React.PropTypes.bool
    currentUser: React.PropTypes.object

  getChildContext: -> 
    loggedIn: @state.loggedIn
    currentUser: @state.currentUser

  getInitialState: ->
    loggedIn: false
    currentUser: null

  # small lag right now in redirection while fetching current user
  onAuthChange: ->
    currentUser = AuthStore.getCurrentUser()
    loggedIn = AuthStore.isLoggedIn()

    @setState
      loggedIn: loggedIn
      currentUser: currentUser

  componentWillMount: ->
    AuthActions.fetchCurrentUser()

  componentDidMount: ->
    @listenTo AuthStore, @onAuthChange

  render: ->
    if @state.loggedIn
      React.createElement CalendarPage
    else
      React.createElement LoginPage
