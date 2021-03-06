command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 30000 # ms

render: (output) ->
  """
  <div class="battery">
    <span class="icon"></span>
    <span class="value"></span>
  </div>
  """

update: (output, el) ->
    bat = parseInt(output)
    $(".battery span.value", el).text("  #{output}")
    $icon = $(".battery span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@icon(bat)}")

icon: (output) =>
  return if output > 90
    "fa-battery-full"
  else if output > 70
    "fa-battery-three-quarters"
  else if output > 40
    "fa-battery-half"
  else if output > 20
    "fa-battery-quarter"
  else
    "fa-battery-empty"

style: """
  -webkit-font-smoothing: antialiased
  font: 9px Input
  top: 7px
  right: 160px
  color: #d5c4a1
  font-family: 'Hack'
"""
