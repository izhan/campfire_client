React = require('react')
Reflux = require('reflux')

module.exports = React.createClass
  displayName: "CalendarListItem"

  propTypes:
    calendar: React.PropTypes.object

  render: ->
    { div } = React.DOM

    div null,
      @props.calendar.summary