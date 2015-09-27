React = require('react')
Reflux = require('reflux')

CalendarActions = require('../../actions/calendar_action.coffee')
CalendarStore = require('../../stores/calendar_store.coffee')

CalendarList = require('./calendar_list.coffee')

module.exports = React.createClass
  mixins: [ Reflux.ListenerMixin ]

  getInitialState: ->
    loading: true
    calendars: null

  onCalendarFetch: ->
    calendars = CalendarStore.getCalendarList()
    if calendars
      console.log('settinga')
      @setState {
        loading: false
        calendars: calendars
      }
      console.log('asdfadsfadfs')
      console.log("finished")

  componentWillMount: ->
    console.log("gonna fetch")
    CalendarActions.fetchCalendarList()

  componentDidMount: ->
    @listenTo CalendarStore, @onCalendarFetch

  render: -> 
    React.createElement CalendarList,
      loading: @state.loading
      calendars: @state.calendars
