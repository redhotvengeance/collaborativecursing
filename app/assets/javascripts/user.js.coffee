class @CollaborativeCursing.Users extends @CollaborativeCursing.AbstractController
  new: =>
    $('.form-submit').click (event) =>
      $('.form-submit').attr 'value', '...'
