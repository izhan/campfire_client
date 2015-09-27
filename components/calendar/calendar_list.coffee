React = require('react')
Reflux = require('reflux')

CalendarContainer = require('./calendar_list_item_container.coffee')

module.exports = React.createClass
  displayName: "CalendarList"

  propTypes:
    calendars: React.PropTypes.array

  render: ->
    { div } = React.DOM

    div null,
      "CALENDAR"
      if @props.loading
        "WE ARE LOADING"
      else
        for cal in @props.calendars
          React.createElement CalendarContainer,
            key: cal.id
            calendar: cal
