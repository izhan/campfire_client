React = require('react')
$ = require('jquery');

module.exports = React.createClass
  # TODO make this a mixin
  contextTypes: {
    baseUrl: React.PropTypes.any
  },

  onGoogleSignin: (response) ->
    console.log("signin callback")
    if response and !response.error
      console.log("yay response")
      console.log(response)
      console.log(@context.baseUrl)
      # google authentication succeed, now post data to server and handle data securely
      $.ajax
        type: 'POST'
        url: '/auth/google_oauth2/callback'
        dataType: 'json'
        data: response
        success: (json) ->
          # response from server
          return
    else
      console.log("we failed")
      # google authentication failed

  onAuthClick: (e) ->
    console.log("CLICKED!")
    # should we add a cookie policy?
    gapi.auth.authorize {
      immediate: false
      response_type: 'code'
      client_id: '841046533743-ttk5o9p3td2bq62ob5o0ou9qfckkomqi.apps.googleusercontent.com'
      scope: 'email profile https://www.googleapis.com/auth/calendar'
    }, @onGoogleSignin

  render: ->
    { div } = React.DOM

    div null,
      "calendar"
      div
        className: "potato"
        onClick: @onAuthClick
        "asdf"
