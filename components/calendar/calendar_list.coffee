React = require('react')
Reflux = require('reflux')

module.exports = React.createClass
  renderCalendar: (cal) ->
    { div } = React.DOM

    div null,
      cal.summary

  render: ->
    { div } = React.DOM

    div null,
      "CALENDAR"
      if @props.loading
        "WE ARE LOADING"
      else
        for cal in @props.calendars
          @renderCalendar(cal)
