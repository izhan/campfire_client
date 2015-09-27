React = require('react')
Reflux = require('reflux')

CalendarActions = require('../../actions/calendar_action.coffee')
CalendarStore = require('../../stores/calendar_store.coffee')

Calendar = require('./calendar.coffee')

module.exports = React.createClass
  displayName: "CalendarContainer"
  
  mixins: [ Reflux.ListenerMixin ]

  getInitialState: ->
    events: []

  getEvents: (start, end, timezone, callback) ->
    debugger

  onCalendarListFetch: ->
    @setState events: CalendarStore.getAllEvents()

  componentDidMount: ->
    @listenTo CalendarStore, @onCalendarEventUpdate

  render: -> 
    React.createElement Calendar,
      eventSource: @getEvents
