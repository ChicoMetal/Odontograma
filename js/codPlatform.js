$(document).ready( function(){

	var validateCookie = ValidarCookies();//obtengo ajax de peticion validar cookies

	if( validateCookie != null ){//si se retorno el ajax

		validateCookie.success(function(data) {//cuando se complete la peticion a php

			if( ! ValidateResponseServer( data, true ) )
				window.location="./index.html";
			

		});

	}

	$("#home").on( "click", function(){ 
		
		$("#show").html('');
	
	});

	$("#linkCitas").on( "click", function(){ 
		
		var href ="./citas.html";
		$("#show").html('');
		$("#show").load(href);
	
		//window.location="./citas.html";
	});
	$("#linkAdmisiones").on( "click", function(){ 
		var href ="./Admisiones.html";
		$("#show").html('');
		$("#show").load(href);
		//.location="./Admisiones.html";
	});
	$("#linkAtencion").on( "click", function(){ 
		var href ="./AtencionMedica.html";
		$("#show").html('');
		$("#show").load(href);
		//window.location="./AtencionMedica.html";
	});

	$("#linkPaciente").on( "click", function(){ 
		var href ="./pacientes.html";
		$("#show").html('');
		$("#show").load(href);
		//window.location="./pacientes.html";
	});

	$("#closeSession").on( "click", function(){ 
		CloseSession();
	});

});