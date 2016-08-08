$(document).ready( function(){ 

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

		if( ValidateResponseServer( result, false ) )
			console.log( result );		

	},
	setTimeout:10000
  });
}