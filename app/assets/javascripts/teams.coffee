# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  $('.small.request.join.modal')
    .modal({
      onApprove : ->
        return false
    })

  $('#requestToJoin').on 'click', ->
    $('.small.request.join.modal')
      .modal('show');

  $('.ui.request.join.form')
    .form({
      on: 'change',
      fields: {
        user_team_role : {
          identifier: 'user_team_role',
          rules: [
            {
              type    : 'empty',
              prompt  : 'Please specify a role.'
            }
          ]
        },
        user_team_requestMessage : {
          identifier : 'user_team_requestMessage',
          rules: [
            {
              type    : 'empty',
              prompt  : 'Please add a message.'
            }
          ]
        }
      }
    })


  # FIXME: for now click the field name to
  # run the search
  $('#gamebar').on 'click', ->
    $('.ui.search.selection.dropdown')
      .dropdown({
        apiSettings: {
          action: 'search games'
        }
      })
