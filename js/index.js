$(document).ready( function(){ 

	var validateCookie = ValidarCookies();//obtengo ajax de peticion validar cookies

	if( validateCookie != null ){//si se retorno el ajax

		validateCookie.success(function(data) {//cuando se complete la peticion a php

			if( ValidateResponseServer( data, true ) )
				window.location="./home.html";
			

		});

	}


	$('#formLogin').validate({//validacion del formulario		
	    rules :{
		    user : {
			  required : true,
			  maxlength : 100 
			},
			pass : {
			  required : true,
			  maxlength : 100
			}
	    },
	    messages : {
			user:{
			  required: "Campo requerido",
			  maxlength : "Maximo 100 caracteres"
			},
			pass:{
			  required : "Campo requerido",
			  maxlength : "Maximo 100 caracteres"
			}
	    },
	    submitHandler: function(form){
    		
    		$('#btnLogin').attr("disabled","disabled");
	   		Login();
    	
       	},

		invalidHandler:function(form){	
		} 

    });	


});

function Login(){
  $.ajax({
	beforeSend:function(){

	},
	url:'./core/login.php',
	type:'POST',
	data:$('#formLogin').serialize(),
	success: function( res){
					
	},
	error: function(jqXHR,estado,error){
	},
	complete: function(jqXHR,estado){	

		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, true ) )
			window.location="./home.html";
		else if( ValidateResponseServer( result, false ) ){
			console.log(result);
		}
	},
	setTimeout:10000
  });
}