# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  $('.ui.search.selection.dropdown')
    .dropdown({
      apiSettings: {
        action: 'search games'
      }
    })

  # FIXME: somehow causes the above to 
  # execute correctly.
  $('.ui.search.selection.dropdown') ->
    console.log("HOPE")

