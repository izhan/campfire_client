React = require('react')
$ = require('jquery')

ApiMixin = require('../../mixins/api_mixin.coffee')
AuthActions = require('../../actions/auth_action.coffee')

module.exports = React.createClass
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

  render: ->
    { div } = React.DOM

    div null,
      if @state.pendingLogin
        "Logging you in..."
      else
        "Please Login to Continue"
        
      div
        className: "potato"
        onClick: @onAuthClick
        "asdf"
