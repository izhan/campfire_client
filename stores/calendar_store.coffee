Reflux = require('reflux')

ApiMixin = require('../mixins/api_mixin.coffee')
CalendarActions = require('../actions/calendar_action.coffee')

module.exports = Reflux.createStore
  listenables: [CalendarActions]
  mixins: [ApiMixin]

  getJwt: -> localStorage.getItem("jwt")

  fetchCalendarList: ->
    onSuccess = (response) =>
      console.log("fetched list")
      console.log(response)
      @trigger()
    onError = (error) =>
      console.log(error)
      console.log("calendar list fetch failed")

    @fetchFromApi("/calendar_lists").then(onSuccess, onError)

  fetchCalendar: (gCalId) ->
    onSuccess = (response) =>
      console.log("fetched calendars")
      console.log(response)
      @trigger()
    onError = (error) =>
      console.log(error)
      console.log("calendars fetch failed")

    opts =
      data:
        gcal_id: gCalId

    @fetchFromApi("/calendars", opts).then(onSuccess, onError)
