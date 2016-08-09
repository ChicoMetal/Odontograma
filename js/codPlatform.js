
$(document).ready(function(){

	var validateCookie = ValidarCookies();//obtengo ajax de peticion validar cookies

	if( validateCookie != null ){//si se retorno el ajax

		validateCookie.success(function(data) {//cuando se complete la peticion a php

			if( ! ValidateResponseServer( data, true ) )
				window.location="./index.html";
			

		});

	}

	$("#linkCitas").on( "click", function(){ 
		window.location="./citas.html";
	});
	$("#linkAdmisiones").on( "click", function(){ 
		window.location="./Admisiones.html";
	});
	$("#linkAtencion").on( "click", function(){ 
		window.location="./AtencionMedica.html";
	});

	$("#linkPaciente").on( "click", function(){ 
		window.location="./pacientes.html";
	});

	$("#closeSession").on( "click", function(){ 
		CloseSession();
	});


});