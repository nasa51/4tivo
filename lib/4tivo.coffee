root = exports ? this
root.next = (name) ->
  clearInterval root.playInterval
  $(name).animate top: "-=" + $(name).css 'line-height',
    'fast'
  root.string++
  words = root.strings[root.string].split ' '
  words = words.filter (e) -> e
  root.playInterval = root.setInterval "next('" + name + "')", 60000 * words.length / $('#speed').val()
  true

root.playInterval = 0
root.string = 0
root.strings = $('output pre').html().split '\n'

$('.play').live 'click', (event) ->
  $('.play').addClass 'pause'
  $('.play').text 'Pause'
  $('.play').removeClass 'play'
  words = root.strings[root.string].split(' ')
  words = words.filter (e) -> e
  root.playInterval = root.setInterval "next('output pre')", 60000 * words.length / $('#speed').val()
  false

$('.pause').live 'click', (event) ->
  clearInterval root.playInterval
  $('.pause').addClass 'play'
  $('.pause').text 'Play'
  $('.pause').removeClass 'pause'
  false

