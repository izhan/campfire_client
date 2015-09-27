Reflux = require('reflux')
$ = require('jquery');

ApiMixin = require('../mixins/api_mixin.coffee')
AuthActions = require('../actions/auth_action.coffee')

module.exports = Reflux.createStore
  listenables: [AuthActions]
  mixins: [ApiMixin]

  data: {
    currentUser: null
  }

  getJwt: -> localStorage.getItem("jwt")

  isLoggedIn: -> @getJwt()?

  getCurrentUser: -> @data.currentUser

  logoutUser: -> 
    localStorage.removeItem("jwt")
    @data.currentUser = null
    @trigger()

  loginUser: (response) ->
    localStorage.setItem("jwt", response.jwt)
    @data.currentUser = response.user
    @trigger()

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
