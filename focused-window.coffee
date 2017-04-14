command: "echo $(/usr/local/bin/kwmc query space active tag)"

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <div class="focused-window">
    <span class="icon"></span>
    <span class="window-name"></span>
  </div>
  """

update: (output, el) ->
    $(".focused-window .window-name", el).text("  #{output}")
    $icon = $(".focused-window span.icon", el)
    $icon.addClass("fa fa-bars")

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  vertical-align: middle;
  font: 10px Input
  height: 16px
  left: 10px
  overflow: hidden
  text-overflow: ellipsis
  top: 0
  height: 22px;
  line-height: 22px;
  width: auto
  font-family: 'Hack'
  .window-name {
    width: 400px
    height: 22px
    white-space: nowrap
    display: inline-block
    text-overflow: ellipsis
    overflow: hidden;
  }
  .icon {
    position: relative
    top: 0px
  }
"""
