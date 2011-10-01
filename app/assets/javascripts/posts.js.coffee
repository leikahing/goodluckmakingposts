$ ->
  /* Zebra striping */
  $('#posts article:nth-child(2n+1)').addClass 'odd'
  $('#posts article:nth-child(2n)').addClass 'even'
  
  /* Image click-to-show */
  ###
  $('#posts img').each ->
    image = $(this)
    image.hide().before('<a class="img-hide"><strong>IMAGE:</strong> Click to reveal</a>')
    
    activator = image.prev()
    activator.click ->
      image.show()
      activator.hide()
  ###