React = require('react')
Reflux = require('reflux')

FullCalendar = require('../../node_modules/fullcalendar/dist/fullcalendar.min.js')

module.exports = React.createClass
  displayName: "Calendar"

  propTypes:
    eventSource: React.PropTypes.func

  componentDidMount: ->
    console.log(FullCalendar)
    $("#calendar").fullCalendar

      selectable: true
      selectHelper: true
      editable: false # TODO
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

      events: @props.eventSource
    

  render: ->
    { div } = React.DOM

    div
      id: "calendar"
      "poop"