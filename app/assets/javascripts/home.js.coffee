class @CollaborativeCursing.Home extends @CollaborativeCursing.AbstractController
  index: =>
    $('.insult-notice').hide()
    $('.insult-submit').hide()
    $('.insult-box').focus (event) =>
      $('.insult-submit').slideDown()
    $('.insult-box').blur (event) =>
      $('.insult-submit').slideUp()
    $('.insult-submit').click (event) =>
      event.preventDefault()
      if $('.insult-box').val() isnt ''
        $.ajax
          url: '/insults'
          type: 'POST'
          dataType: 'json'
          data: $('#new_insult').serialize()
          error: (event) =>
            $('.insult-notice').text 'Hmmm, somthing went wrong. Give it another shot!'
            $('.insult-notice').slideDown()
          success: (data) =>
            $('.insult-notice').text 'You\'ve successfully joined the ranks of jackassery!'
            $('.insult-notice').slideDown().delay(3000).slideUp()
            $('.insult-box').val ''
      else
        $('.insult-notice').text 'Your insult must actually exist for it to be insulting.'
        $('.insult-notice').slideDown()
