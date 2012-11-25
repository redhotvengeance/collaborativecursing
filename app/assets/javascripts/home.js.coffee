class @CollaborativeCursing.Home extends @CollaborativeCursing.AbstractController
  index: =>
    notice = $('.insult-notice')
    if (notice.text() is '')
      $('.insult-notice').hide()
    else
      $('.insult-notice').delay(4000).slideUp()
    $('.insult-submit').hide()
    $('.insult-box').focus (event) =>
      $('.insult-submit').slideDown()
    $('.insult-box').blur (event) =>
      $('.insult-submit').slideUp()
    $('.insult-submit').click (event) =>
      if $('.insult-box').val() is ''
        event.preventDefault()
        $('.insult-notice').text 'Your insult must actually exist for it to be insulting.'
        $('.insult-notice').slideDown()
