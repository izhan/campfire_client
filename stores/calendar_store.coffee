Reflux = require('reflux')
$ = require('jquery');

ApiMixin = require('../mixins/api_mixin.coffee')
CalendarActions = require('../actions/calendar_action.coffee')

module.exports = Reflux.createStore
  listenables: [CalendarActions]
  mixins: [ApiMixin]

  getJwt: -> localStorage.getItem("jwt")

  fetchCalendarList: ->
    console.log("asdfasfdafsd")
    $.ajax
      type: 'GET'
      url: @getApiUrl() + '/calendar_lists'
      headers: { 'Authorization': @getJwt() }
      success: (response) =>
        console.log("fetched list")
        console.log(response)
        @trigger()
        
