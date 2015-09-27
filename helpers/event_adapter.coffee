module.exports =
  getStart: (ev) ->
    moment(if ev.start.date? then ev.start.date else ev.start.dateTime)

  getEnd: (ev) ->
    moment(if ev.end.date? then ev.end.date else ev.end.dateTime)

  # is there a better way?  can events have a date startime, but a
  # datetime endtime?
  isAllDayEvent: (ev) -> ev.start.date? && ev.end.date?

  isEventInRange: (ev, start, end) ->
    # is there an overlap in range?
    startInRange = start < @getStart(ev) && end < @getStart(ev)
    endInRange = @getEnd(ev) < end && start < @getEnd(ev)
    startInRange || endInRange

  toFullCalendarEvent: (ev) ->
    return {
      id: ev.id
      title: ev.summary
      allDay: @isAllDayEvent(ev)
      start: @getStart(ev)
      end: @getEnd(ev)
    }
