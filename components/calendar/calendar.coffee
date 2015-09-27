React = require('react')
Reflux = require('reflux')

module.exports = React.createClass
  displayName: "Calendar"

  propTypes:
    calendar: React.PropTypes.object

  render: ->
    { div } = React.DOM

    div null,
      @props.calendar.summary