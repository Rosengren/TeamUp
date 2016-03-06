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
	  				},
	  				{
	  					type	: 'minLength[6]',
	  					prompt	: 'Password must be at least 6 characters long'
	  				}
	  			]
	  		},
	  		user_password_confirmation : {
	  			identifier	: 'user_password_confirmation',
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

	$('.message .close').on 'click', ->
    	$(this).closest('.message').transition('fade')
