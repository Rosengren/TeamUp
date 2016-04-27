$(document).on 'click', '.add_proficiency_to_user', ->
  $that = $(this)
  $('.ui.search.selection.dropdown')
    .dropdown({
      apiSettings: {
        action: 'search proficiencies',
        urlData: {
          id: $that.attr('data')
        }
      }
    })

  $('.small.add.proficiency.modal')
    .modal('show');


$(document).on 'ready page:load', ->

  $('.small.add.game.modal')
    .modal({
      onApprove : ->
        return true
    })

  $('.small.add.proficiency.modal')
    .modal({
      onApprove : ->
        return true
    })

  $('#add_game_to_user').on 'click', ->
    $('.small.add.game.modal')
      .modal('show')

  $('.dropdown')
    .dropdown()

  $('.ui.sign.up.form')
    .form({
      on: 'change',
      fields: {
        user_username : {
          identifier: "user_username",
          rules: [
            {
              type    : 'empty',
              prompt  : 'Please enter a username'
            }
          ]
        },
        user_password : {
          identifier : "user_password",
          rules: [
            {
              type    : 'empty',
              prompt  : 'Please enter a password'
            },
            {
              type    : 'minLength[7]',
              prompt  : 'Password must be at least 7 characters long'
            }
          ]
        },
        user_password_confirmation : {
          identifier  : 'user_password_confirmation',
          rules: [
            {
              type    : 'match[user_password]',
              prompt  : 'The password fields don\'t match'
            }
          ]
        }
      }
    })

  $('.ui.edit.user.form')
    .form({
      on: 'change',
      fields: {
        user_picture_url: {
          identifier: 'user_picture_url',
          rules: [
            {
              type    : 'empty',
              prompt  : 'Please set a picture url'
            }
          ]
        }
      }
    })

  $('.ui.add.game.form')
    .form({
      on: 'submit',
      fields: {
        dropdown: {
          identifier: 'game',
          rules: [
            {
              type    : 'empty',
              prompt  : 'Please select a game to add.'
            }
          ]
        }
      }
    })

  $('.ui.add.proficiency.form')
    .form({
      on: 'submit',
      fields: {
        dropdown: {
          identifier: 'user_proficiency_proficiency_id',
          rules: [
            {
              type    : 'empty',
              prompt  : 'Please select a proficiency to add.'
            }
          ]
        }
      }
    })

  $('.ui[data-title]')
    .popup()

  $('.message .close').on 'click', ->
    $(this).closest('.message').transition('fade')
