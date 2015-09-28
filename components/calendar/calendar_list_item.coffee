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

  renderColor: ->
    { div } = React.DOM
    div
      style:
        background: @props.calendar.backgroundColor
      className: "calendar-color"

  renderLoadingSpinner: ->
    { div } = React.DOM

    div
      className: "circle-spinner"
      div
        className: "double-bounce1"
      div
        className: "double-bounce2"

  render: ->
    { div, label, input } = React.DOM

    div
      className: "calendar-item-wrapper"
      div
        className: "checkbox calendar-checkbox"
        label null,
          input
            type: "checkbox"
            checked: @state.showEvents
            onChange: @onCheckboxChange
          @props.calendar.summary 
      if @props.loading
        @renderLoadingSpinner()
      else
        @renderColor()
      