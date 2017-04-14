command: "date +\"%a %d %b\""

refreshFrequency: 60000 # 1hour

render: (output) ->
  """
 <div class="cal">
    <span class="icon"></span>
    <span class="value"></span>
  </div>
  """

update: (output, el) ->
    $(".cal span.value", el).text("  #{output}")
    $icon = $(".cal span.icon", el)
    $icon.addClass("fa fa-calendar")

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 10px Input
  right: 70px
  top: 6px
  font-family: 'Hack'
"""
