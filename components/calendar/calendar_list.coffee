React = require('react')
Reflux = require('reflux')

CalendarListItemContainer = require('./calendar_list_item_container.coffee')

module.exports = React.createClass
  displayName: "CalendarList"

  propTypes:
    calendars: React.PropTypes.array

  render: ->
    { div } = React.DOM

    div
      id: "sidebar-wrapper"
      div
        className: "calendar-list"
        div
          className: "calendar-list-title"
          "CALENDARS"

        if @props.loading
          div
            className: "calendar-spinner"
            div
              className: "spinner-loader"
              "Loading..."
        else
          for cal in @props.calendars
            React.createElement CalendarListItemContainer,
              key: cal.id
              calendar: cal
