Reflux = require('reflux')

AuthActions = require('../actions/auth_action.coffee')

module.exports = Reflux.createStore({
  listenables: AuthActions

  foo: "asdf"

  logoutUser: ->
    @trigger()

  loginUser: ->
    @foo = "jkl"
    console.log("logging in user!!")
    @trigger(@foo)
})
