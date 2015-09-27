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
    auth2.grantOfflineAccess({'redirect_uri': 'postmessage'}).then(@onGoogleSignin)
    console.log("logging in user!!")

  onGoogleSignin: (response) ->
    console.log("signin callback")
    if response and response["code"]
      console.log('gonna post')
      @setState pendingLogin: true

      # google authentication succeed, now post data to server and handle data securely
      $.ajax
        type: 'POST'
        # contentType: 'application/octet-stream; charset=utf-8',
        # processData: false,
        data: response
        url: @getBaseUrl() + '/auth/google_oauth2/callback'
        success: (response) =>
          AuthActions.loginUser(response)
          @setState pendingLogin: false
        error: (error) =>
          console.log(error)
          console.log("umm ok")

    else
      # google authentication failed
      console.log("we failed")

  renderLoginBox: ->
    { div } = React.DOM

    div
      className: "login-box"
      if @state.pendingLogin
        div null,
          "Logging you in..."
          div
            className: "spinner-loader"
            "Loading..."
      else
        div null,
          "Log in to get started!"
        
      div
        className: "potato"
        onClick: @onAuthClick
        "asdf"

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

            @renderLoginBox()

      @renderLoginFooter()


      