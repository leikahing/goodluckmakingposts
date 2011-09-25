$ ->
  $('section #posts article:nth-child(2n+1)').addClass 'odd'
  $('section #posts article:nth-child(2n)').addClass 'even'
