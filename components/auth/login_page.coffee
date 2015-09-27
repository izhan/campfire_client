React = require('react')
$ = require('jquery')

AuthActions = require('../../actions/auth_action.coffee')

module.exports = React.createClass
  onAuthClick: -> 
    console.log("clicked on auth")
    AuthActions.loginUser()

  render: ->
    { div } = React.DOM

    div null,
      "please login"
      div
        className: "potato"
        onClick: @onAuthClick
        "asdf"
