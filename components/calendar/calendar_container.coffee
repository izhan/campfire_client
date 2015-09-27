React = require('react')
Reflux = require('reflux')

CalendarActions = require('../../actions/calendar_action.coffee')
CalendarStore = require('../../stores/calendar_store.coffee')

EventAdapter = require('../../helpers/event_adapter.coffee')

Calendar = require('./calendar.coffee')

module.exports = React.createClass
  displayName: "CalendarContainer"
  
  mixins: [ Reflux.ListenerMixin ]

  getInitialState: ->
    events: []

  getEvents: (start, end, timezone, callback) ->
    events = @state.events.filter (ev) -> EventAdapter.isEventInRange(ev, start, end)
    full_cal_events = (EventAdapter.toFullCalendarEvent(ev) for ev in events)

    console.log(@state.events)
    console.log(events)
    console.log(full_cal_events)
    callback(full_cal_events)

  onCalendarEventUpdate: ->
    @setState events: CalendarStore.getAllEvents()

  componentDidMount: ->
    @listenTo CalendarStore, @onCalendarEventUpdate

  render: -> 
    React.createElement Calendar,
      eventSource: @getEvents
