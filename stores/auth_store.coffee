Reflux = require('reflux')
$ = require('jquery');

AuthActions = require('../actions/auth_action.coffee')

module.exports = Reflux.createStore({
  listenables: [AuthActions]
  data: {
    currentUser: null
  }

  # TODO make this a helpers
  getBaseUrl: ->
    devMode = process.env.NODE_ENV == 'development'
    if devMode then 'http://localhost:3000' else 'https://obscure-citadel-9804.herokuapp.com'

  getApiUrl: ->
    @getBaseUrl() + "/api/v1"

  onGoogleSignin: (response) ->
    console.log("signin callback")
    if response and response["code"]
      console.log('gonna post')

      # google authentication succeed, now post data to server and handle data securely
      $.ajax
        type: 'POST'
        # contentType: 'application/octet-stream; charset=utf-8',
        # processData: false,
        data: response
        url: @getBaseUrl() + '/auth/google_oauth2/callback'
        success: (response) =>
          jwt = response.jwt
          localStorage.setItem("jwt", jwt)
          console.log(jwt)
          console.log("success")
          @data.currentUser = response.user
          @trigger()
    else
      # google authentication failed
      console.log("we failed")

  getJwt: -> localStorage.getItem("jwt")

  isLoggedIn: -> @getJwt()?

  getCurrentUser: -> @data.currentUser

  logoutUser: -> @trigger()

  loginUser: ->
    return if @data.currentUser

    auth2.grantOfflineAccess({'redirect_uri': 'postmessage'}).then(@onGoogleSignin)
    
    console.log("logging in user!!")

  fetchCurrentUser: ->
    if @isLoggedIn()
      console.log("fetching user")
      $.ajax
        type: 'GET'
        url: @getBaseUrl() + '/auth/current_user'
        headers: { 'Authorization': @getJwt() }
        success: (response) =>
          console.log("omg it works")
          console.log(response)
          @data.currentUser = response.user
          @trigger()

})
