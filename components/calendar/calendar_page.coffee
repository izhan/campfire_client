React = require('react')

CalendarListContainer = require('./calendar_list_container.coffee')
Calendar = require('./calendar.coffee')
Header = require('../layout/header.coffee')

module.exports = React.createClass
  displayName: "CalendarPage"

  render: ->
    { div } = React.DOM

    div null,
      React.createElement Header

      div
        id: "wrapper"
        React.createElement CalendarListContainer

        div
          id: "page-content-wrapper"
          React.createElement Calendar
        