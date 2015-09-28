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

  # this will have performance issues
  onCalendarEventUpdate: ->
    @setState events: CalendarStore.getAllEvents()
    $("#calendar").fullCalendar("refetchEvents")

  initializeFullCalendar: ->
    $("#calendar").fullCalendar
      editable: false # readonly for now
      eventLimit: true

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

      # works well on macbooks and your typical fullsize desktop/laptop screen
      aspectRatio: 2 

      events: @getEvents

  componentDidMount: ->
    @listenTo CalendarStore, @onCalendarEventUpdate
    @initializeFullCalendar()

  render: -> 
    { div } = React.DOM

    div
      id: "calendar"


