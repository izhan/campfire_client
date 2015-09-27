React = require('react')
Reflux = require('reflux')

module.exports = React.createClass
  displayName: "Calendar"

  render: ->
    { div } = React.DOM

    div null,
      @props.calendar.summary