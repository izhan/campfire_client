React = require('react')
Router = require('react-router')
Reflux = require('reflux')
$ = require('jquery')

AuthStore = require('../../stores/auth_store.coffee')
AuthActions = require('../../actions/auth_action.coffee')
CalendarPage = require("../calendar/calendar_page.coffee")
LoginPage = require("../auth/login_page.coffee")

# TODO add PureRenderMixin to all of these
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

  onAuthChange: ->
    currentUser = AuthStore.getCurrentUser()
    loggedIn = AuthStore.isLoggedIn()

    @setState
      loggedIn: loggedIn
      currentUser: currentUser
    console.log 'auth changed!!!'
    console.log currentUser
    console.log loggedIn

  componentWillMount: ->
    console.log 'app mounted'
    AuthActions.fetchCurrentUser()

  componentDidMount: ->
    @listenTo AuthStore, @onAuthChange

  render: ->
    if @state.loggedIn
      React.createElement CalendarPage
    else
      React.createElement LoginPage