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
    @data.visibilityMap = {}

  getJwt: -> localStorage.getItem("jwt")

  getCalendarList: -> @data.calendarList

  getCalendar: (gCalId) ->
    @data.calendarMap[gCalId]

  hasCalendarLoaded: (gCalId) ->
    @data.calendarMap[gCalId]?

  getAllEvents: ->
    ret = []
    for id, events of @data.calendarMap
      if @data.visibilityMap[id]
        ret.push events...
    ret

  clearAllEvents: ->
    @data.calendarList = null
    @data.calendarMap = {}
    @data.visibilityMap = {}
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
      @data.visibilityMap[gCalId] ?= true
      @trigger()
    onError = (error) =>
      console.log(error)
      console.log("calendars fetch failed")

    opts =
      data:
        gcal_id: gCalId

    @fetchFromApi("/calendars", opts).then(onSuccess, onError)

  # do we want clients to set the visibility?
  setCalendarVisibility: (gCalId, visibility) ->
    @data.visibilityMap[gCalId] = visibility
    @trigger()

