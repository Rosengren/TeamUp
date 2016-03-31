# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  # FIXME: for now click the field name to
  # run the search
  $('#gamebar').on 'click', ->
    $('.ui.search.selection.dropdown')
      .dropdown({
        apiSettings: {
          action: 'search games'
        }
      })


