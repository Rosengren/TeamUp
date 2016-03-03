$ ->
	$('.ui.form')
	  .form({
	  	on: 'change',
	  	fields: {
	  		user_username : {
	  			identifier: "user_username",
	  			rules: [
	  					{
		  					type 	: 'empty',
		  					prompt 	: 'Please enter a username'
	  					}
	  				]
	  			},
	  		user_password : {
	  			identifier : "user_password",
	  			rules: [
	  				{
	  					type	: 'empty',
	  					prompt	: 'Please enter a password'
	  				}
	  			]
	  		},
	  		verifyPassword : {
	  			identifier	: 'verifyPassword',
	  			rules: [
	  				{
	  					type 		: 'match[user_password]',
	  					prompt	: 'The password fields don\'t match'
	  				}
	  			]
	  		}
	 	 	}
	  })
	;

	$('form').submit ->
	  $('.never-submit').prop 'disabled', true
	  true
