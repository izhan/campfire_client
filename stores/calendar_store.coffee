Reflux = require('reflux')

ApiMixin = require('../mixins/api_mixin.coffee')
CalendarActions = require('../actions/calendar_action.coffee')

module.exports = Reflux.createStore
  listenables: [CalendarActions]
  mixins: [ApiMixin]

  data: {
    calendarList: null
  }

  init: -> 
    @data.calendarMap = {}

  getJwt: -> localStorage.getItem("jwt")

  getCalendarList: -> @data.calendarList

  getCalendar: (gCalId) ->
    @data.calendarMap[gCalId]

  getAllEvents: ->
    ret = []
    for id, events of @data.calendarMap
      ret.push events...
    ret

  clearAllEvents: ->
    @data.calendarList = null
    @data.calendarMap = {}
    @trigger()

  fetchCalendarList: ->
    onSuccess = (response) =>
      console.log("fetched list")
      console.log(response)
      @data.calendarList = response
      @trigger()
    onError = (error) =>
      console.log(error)
      console.log("calendar list fetch failed")

    @fetchFromApi("/calendar_lists").then(onSuccess, onError)

  fetchCalendar: (gCalId) ->
    onSuccess = (response) =>
      console.log("fetched calendars")
      @data.calendarMap[gCalId] = response
      @trigger()
    onError = (error) =>
      console.log(error)
      console.log("calendars fetch failed")

    opts =
      data:
        gcal_id: gCalId

    @fetchFromApi("/calendars", opts).then(onSuccess, onError)
