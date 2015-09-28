Reflux = require('reflux')

ApiMixin = require('../mixins/api_mixin.coffee')
CalendarActions = require('../actions/calendar_action.coffee')

module.exports = Reflux.createStore
  listenables: [CalendarActions]
  mixins: [ApiMixin]

  # TODO we don't need both calendarList and calendarMap
  data: {
    calendarList: null
  }

  _decorateEvent: (ev, gCalId) ->
    calInfo = @data.calendarMap[gCalId]
    ev.foregroundColor = calInfo.foregroundColor
    ev.backgroundColor = calInfo.backgroundColor
    ev

  init: -> 
    @data.calendarMap = {} # id to calendarObject
    @data.calendarEventMap = {} # id to events
    @data.visibilityMap = {} # is calendar visible?

  getJwt: -> localStorage.getItem("jwt")

  getCalendarList: -> @data.calendarList

  getCalendar: (gCalId) ->
    @data.calendarEventMap[gCalId]

  hasCalendarLoaded: (gCalId) ->
    @data.calendarEventMap[gCalId]?

  getAllEvents: ->
    ret = []
    for id, events of @data.calendarEventMap
      if @data.visibilityMap[id]
        for ev in events
          ret.push @_decorateEvent(ev, id)
    ret

  clearAllEvents: ->
    @data.calendarList = null
    @data.calendarMap = {}
    @data.calendarEventMap = {}
    @data.visibilityMap = {}
    @trigger()

  fetchCalendarList: ->
    onSuccess = (response) =>
      console.log("fetched list")
      console.log(response)
      @data.calendarList = response
      for cal in response
        @data.calendarMap[cal.id] = cal
      @trigger()
    onError = (error) =>
      console.log(error)
      console.log("calendar list fetch failed")

    @fetchFromApi("/calendar_lists").then(onSuccess, onError)

  fetchCalendar: (gCalId) ->
    onSuccess = (response) =>
      console.log("fetched calendars")
      @data.calendarEventMap[gCalId] = response
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

