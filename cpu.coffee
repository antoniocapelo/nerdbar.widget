command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.2f\",s/8);}'"

refreshFrequency: 10000 # ms

render: (output) ->
  """
  <div class="cpu">
    <span class="icon"></span>
    <span class="value"></span>
  </div>
  """

update: (output, el) ->
    $(".cpu span.value", el).text("  #{output}")
    $icon = $(".cpu span.icon", el)
    $icon.addClass("fa fa-bar-chart")

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 10px Input
  right: 265px
  top: 6px
  font-family: 'Hack'
"""
