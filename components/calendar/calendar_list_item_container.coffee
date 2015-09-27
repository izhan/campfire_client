React = require('react')
Reflux = require('reflux')

CalendarActions = require('../../actions/calendar_action.coffee')
CalendarStore = require('../../stores/calendar_store.coffee')

Calendar = require('./calendar_list_item.coffee')

module.exports = React.createClass
  displayName: "CalendarContainer"

  propTypes:
    calendar: React.PropTypes.object
  
  mixins: [ Reflux.ListenerMixin ]

  getInitialState: ->
    loading: true
    calendars: null

  onCalendarFetch: ->
    calendars = CalendarStore.getCalendar()

    if calendars
      @setState
        loading: false

  componentWillMount: ->  
    CalendarActions.fetchCalendar(@props.calendar.id)

  componentDidMount: ->
    @listenTo CalendarStore, @onCalendarFetch

  render: -> 
    React.createElement Calendar,
      loading: @state.loading
      calendar: @props.calendar
