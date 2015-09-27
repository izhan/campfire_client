Reflux = require('reflux')

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
      onSuccess = (response) =>
        console.log("omg it works")
        console.log(response)
        @data.currentUser = response.user
        @trigger()
      onError = (error) =>
        console.log(error)
        console.log('failed to fetch current user')

      @fetchFromNonApi("/auth/current_user").then(onSuccess, onError)
      