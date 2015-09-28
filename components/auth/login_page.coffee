React = require('react')

ApiMixin = require('../../mixins/api_mixin.coffee')
AuthActions = require('../../actions/auth_action.coffee')

module.exports = React.createClass
  displayName: "LoginPage"
  
  mixins: [ApiMixin]

  contextTypes: {
    loggedIn: React.PropTypes.bool
  }
  
  getInitialState: ->
    pendingLogin: false

  onAuthClick: ->
    return if @state.pendingLogin
    auth2.grantOfflineAccess({'redirect_uri': 'postmessage'}).then(@onGoogleSignin)

  onGoogleSignin: (response) ->
    if response and response["code"]
      @setState pendingLogin: true

      # google authentication succeed, now post data to server and handle data securely
      $.ajax
        type: 'POST'
        data: response
        url: @getBaseUrl() + '/auth/google_oauth2/callback'
        success: (response) =>
          AuthActions.loginUser(response)
          @setState pendingLogin: false
        error: (error) =>
          console.log(error)

    else
      # google authentication failed
      console.log("google auth failed.  why u no trust me?")

  renderGoogleAuthButton: ->
    { div } = React.DOM

    className = if @state.pendingLogin then "google-auth-button disabled" else "google-auth-button"
    div
      className: className
      onClick: @onAuthClick

  renderLoginBox: ->
    { div, img } = React.DOM

    div
      className: "login-box"
      
      @renderGoogleAuthButton()

      if @state.pendingLogin
        div
          className: "login-prompt"
          div
            className: "login-loading-message"
            "Fetching your info..."
          div
            className: "login-loading-message"
            "(may take a minute)"
          div
            className: "login-spinner"
            div
              className: "spinner-loader"
              "Loading..."
      else
        div
          className: "login-prompt"
          div null,
            "Log in to get started!"

  renderLoginFooter: ->
    { div, img } = React.DOM

    div 
      className: "login-footer"
      div
        className: "sky-footer container"
        div
          className: "sun"
      div
        className: "grass-footer"
        div
          className: "container"
          img
            src: "./img/trees_and_stuff.png"
            className: "trees-and-stuff"


  render: ->
    { div, span, img } = React.DOM

    div
      className: "login-page"
      div
        className: "container"
        div
          className: "row login-header"
          div
            className: "col-xs-12 text-center"
            # putting it in public/ temporarily
            img
              src: "./img/tent_with_circle.png"
              className: "tent-with-circle"
              
            div
              className: "login-title"
              "Campfire"
            div
              className: "login-subtitle"
              "Right now it's just a calendar"

            @renderLoginBox()

      @renderLoginFooter()


      