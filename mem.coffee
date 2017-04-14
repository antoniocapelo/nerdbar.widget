command: "memory_pressure && sysctl -n hw.memsize"

refreshFrequency: 30000 # ms

render: (output) ->
  """
 <div class="memory">
    <span class="icon"></span>
    <span class="value"></span>
  </div>
  """

update: (output, domEl) ->

  usage = (pages) ->
    mb = (pages * 4096) / 1024 / 1024
    usageFormat mb

  usageFormat = (mb) ->
    if mb > 1024
      gb = mb / 1024
      "#{parseFloat(gb.toFixed(2))}GB"
    else
      "#{parseFloat(mb.toFixed())}MB"

  updateStat = (sel, usedPages, totalBytes) ->
    usedBytes = usedPages * 4096
    percent = (usedBytes / totalBytes * 100).toFixed(1) + "%"
    $(".memory span.value", el).text("  #{percent}")
    $icon = $(".memory span.icon", el)
    $icon.addClass("fa fa-list")

  lines = output.split "\n"

  freePages = lines[3].split(": ")[1]
  inactivePages = lines[13].split(": ")[1]
  activePages = lines[12].split(": ")[1]
  wiredPages = lines[16].split(": ")[1]

  totalBytes = lines[28]
  $(domEl).find(".total").text usageFormat(totalBytes / 1024 / 1024)

  updateStat 'active', activePages, totalBytes
  
style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 10px Input
  right: 215px
  top: 6px
  font-family: 'Hack'
"""
