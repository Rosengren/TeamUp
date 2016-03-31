// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $.fn.api.settings.api = {
    'search' : '/search/all?q={query}',
    'search proficiencies' : '/search/proficiencies?game={id}&q={query}',
    'search games' : '/search/games?q={query}'
  };
});

$(document).on('ready page:load', function() {

  $('body')
    .visibility({
        offset         : -10,
        observeChanges : false,
        once           : false,
        continuous     : false,
        onTopPassed: function() {
          requestAnimationFrame(function() {
              $('.following.bar')
                .addClass('light fixed')
              ;
          });
        },
        onTopPassedReverse: function() {
          requestAnimationFrame(function() {
            $('.following.bar')
              .removeClass('light fixed')
            ;
          });
        }
    })
  ;

  $('.ui.category.search')
    .search({
      type          : 'category',
      action        : 'search',
      minCharacters : 2,
      apiSettings   : {
        onResponse: function(queryResponse) {

          var response = {
                results : {}
          };

          $.each(queryResponse, function(index, item) {
            var
              category   = item.category || 'Unknown',
              maxResults = 8
            ;

            if(index >= maxResults) {
              return false;
            }

            // create new category
            if(response.results[category] === undefined) {
              response.results[category] = {
                name    : category,
                results : []
              };
            }

            // add result to category
            response.results[category].results.push({
              title : item.name,
              url   : item.url
            });

          });

          return response;
        }
      }
    })
  ;

  $('.ui.icon')
    .popup()
  ;

});
