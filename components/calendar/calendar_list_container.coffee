React = require('react')
Reflux = require('reflux')

CalendarActions = require('../../actions/calendar_action.coffee')
CalendarStore = require('../../stores/calendar_store.coffee')

CalendarList = require('./calendar_list.coffee')

module.exports = React.createClass
  displayName: "CalendarListContainer"
  
  mixins: [ Reflux.ListenerMixin ]

  getInitialState: ->
    loading: true
    calendars: null

  onCalendarListFetch: ->
    calendars = CalendarStore.getCalendarList()
    if calendars
      @setState {
        loading: false
        calendars: calendars
      }

  componentWillMount: ->
    console.log("gonna fetch")
    CalendarActions.fetchCalendarList()

  componentDidMount: ->
    @listenTo CalendarStore, @onCalendarListFetch

  render: -> 
    React.createElement CalendarList,
      loading: @state.loading
      calendars: @state.calendars
