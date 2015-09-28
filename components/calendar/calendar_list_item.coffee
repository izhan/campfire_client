React = require('react')
Reflux = require('reflux')

CalendarActions = require('../../actions/calendar_action.coffee')

module.exports = React.createClass
  displayName: "CalendarListItem"

  propTypes:
    calendar: React.PropTypes.object

  getInitialState: ->
    showEvents: true

  onCheckboxChange: ->
    newVal = !@state.showEvents
    @setState showEvents: newVal
    CalendarActions.setCalendarVisibility(@props.calendar.id, newVal)

  render: ->
    { div, label, input } = React.DOM

    div
      className: "checkbox"
      label null,
        input
          type: "checkbox"
          checked: @state.showEvents
          onChange: @onCheckboxChange
        @props.calendar.summary 
