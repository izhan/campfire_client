React = require('react')
$ = require('jquery');

module.exports = React.createClass
  # TODO make this a mixin
  contextTypes: {
    baseUrl: React.PropTypes.any
  },

  onGoogleSignin: (response) ->
    console.log("signin callback")
    if response and response["code"]
      console.log("yay response")
      console.log(response)
      # google authentication succeed, now post data to server and handle data securely
      $.ajax
        type: 'POST'
        # contentType: 'application/octet-stream; charset=utf-8',
        # processData: false,
        data: response
        url: @context.baseUrl + '/auth/google_oauth2/callback'
        success: (json) ->
          console.log("success")
          # response from server
          return
    else
      console.log("we failed")
      # google authentication failed

  onAuthClick: (e) ->
    auth2.grantOfflineAccess({'redirect_uri': 'postmessage'}).then(@onGoogleSignin)

  render: ->
    { div } = React.DOM

    div null,
      "calendar"
      div
        className: "potato"
        onClick: @onAuthClick
        "asdf"
