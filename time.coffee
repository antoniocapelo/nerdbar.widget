command: "date +\"%H:%M\""

refreshFrequency: 30000 # uptade time every 30s

render: (output) ->
  """
 <div class="time">
    <span class="icon"></span>
    <span class="value"></span>
  </div>
  """

update: (output, el) ->
    $(".time span.value", el).text("  #{output}")
    $icon = $(".time span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-clock-o")

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 10px Input
  right: 10px
  top: 6px
  font-family: 'Hack'
"""
