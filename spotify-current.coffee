command: "osascript /usr/local/bin/currentTrack.scpt"
command: """
IFS="++" read -r type track <<<"$(osascript /usr/local/bin/currentTrack.scpt)" &&
if [ -z "$type" ]
then
    echo ""
else
    echo "$type ++ $track"
fi
"""

refreshFrequency: 5000 # ms

render: (output) ->
  """
 <div class="current-track">
    <span class="icon"></span>
    <span class="track-name"></span>
  </div>
  """

update: (output, el) ->
    str = output.split('++')
    $(".current-track .track-name", el).text(str[1])
    $icon = $(".current-track span.icon", el)
    $icon.addClass("fa #{@icon(str[0])}")

icon: (status) =>
    return "fa-" + status

style: """
  -webkit-font-smoothing: antialiased
  text-align: center
  color: #d5c4a1
  font: 9px Input
  height: 22px;
  line-height: 22px;
  left: 25%
  overflow: hidden
  text-overflow: ellipsis
  top: 8px
  width: 50%
  font-family: 'Hack'
  top: 0;
  .icon {
      margin-right: 5px
  }
"""
