React = require('react')
Reflux = require('reflux')

CalendarActions = require('../../actions/calendar_action.coffee')
CalendarStore = require('../../stores/calendar_store.coffee')

EventAdapter = require('../../helpers/event_adapter.coffee')

module.exports = React.createClass
  displayName: "Calendar"
  
  mixins: [ Reflux.ListenerMixin ]

  getInitialState: ->
    events: []

  getEvents: (start, end, timezone, callback) ->
    events = @state.events.filter (ev) -> EventAdapter.isEventInRange(ev, start, end)
    full_cal_events = (EventAdapter.toFullCalendarEvent(ev) for ev in events)
    callback(full_cal_events)

  onCalendarEventUpdate: ->
    @setState events: CalendarStore.getAllEvents()
    console.log("updated")
    $("#calendar").fullCalendar("refetchEvents")

  initializeFullCalendar: ->
    $("#calendar").fullCalendar
      # selectable: true
      # selectHelper: true
      editable: false # TODO
      eventLimit: true
      # displayEventTime: false

      defaultView: 'agendaWeek'

      titleFormat: 
        week: "MMM D"
      axisFormat: 'h(:mm)A'
      
      header: 
        left: 'prev title next',
        center: '',
        right: 'agendaDay agendaWeek month'
      buttonText:
        today: "Today"
        month: "Month"
        week: "Week"
        day: "Day"
      allDayText: ""

      events: @getEvents

  componentDidMount: ->
    @listenTo CalendarStore, @onCalendarEventUpdate
    @initializeFullCalendar()

  render: -> 
    { div } = React.DOM

    div
      id: "calendar"


