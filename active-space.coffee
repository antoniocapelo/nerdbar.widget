command: "/usr/local/bin/kwmc query space active name"

refreshFrequency: 1000 # ms

render: (output) ->
  """
 <div class="active-space">
    <span class="icon icone-space"></span>
    <span class="value"></span>
  </div>
  """

update: (output, el) ->
    $(".active-space span.value", el).text(" #{output}")
    $icon = $(".active-space span.icon", el)
    $icon.removeClass().addClass("icon icon-space")
    $icon.addClass("fa #{@icon(output)}")

icon: (status) =>
    return if status.substring(0, 4) == "main"
        "fa-home"
    else if status.substring(0, 3) == "web"
        "fa-safari"
    else if status.substring(0, 3) == "rnd"
        "fa-random"
    else if status.substring(0, 5) == "music"
        "fa-music"
    else if status.substring(0, 4) == "chat"
        "fa-comments"
    else
        "fa-times"

style: """
  -webkit-font-smoothing: antialiased
  text-align: right
  color: #d5c4a1
  font: 10px Input
  height: 16px
  overflow: hidden
  text-overflow: ellipsis
  right: 320px
  top: 6px
  width: 50%
  font-family: 'Hack'
  .icon-space::before {
    margin-right: 5px
  }
"""
