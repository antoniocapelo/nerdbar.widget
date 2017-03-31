command: """
read -r running <<<"$(ps -ef | grep \"MacOS/Spotify\" | grep -v \"grep\" | wc -l)" &&
test $running != 0 &&
IFS='|' read -r theArtist theName <<<"$(osascript <<<'tell application "Spotify"
        set theTrack to current track
        set theArtist to artist of theTrack
        set theName to name of theTrack
        return theArtist & "|" & theName
    end tell')" &&
if [ -z "$theArtist" ]
then
    echo ""
else
    echo "$theArtist - $theName" || echo "Not Connected To Spotify"
fi
"""

refreshFrequency: 5000 # ms

render: (output) ->
  """
 <div class="np"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".np span:first-child", el).text("  #{output}")
    $icon = $(".np span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@icon(output)}")

icon: (status) =>
    return if !status.length
        ""
    else
        "fa-spotify"

style: """
  -webkit-font-smoothing: antialiased
  text-align: center
  color: #d5c4a1
  font: 10px Input
  height: 16px
  left: 25%
  overflow: hidden
  text-overflow: ellipsis
  top: 8px
  width: 50%
  font-family: 'Hack'
"""
