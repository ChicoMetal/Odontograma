$(document).ready( function(){

	ShowHome();
	

	var validateCookie = ValidarCookies();//obtengo ajax de peticion validar cookies

	if( validateCookie != null ){//si se retorno el ajax

		validateCookie.success(function(data) {//cuando se complete la peticion a php

			if( ! ValidateResponseServer( data, true ) )
				window.location="./index.html";
			

		});

	}

});

function ShowHome(){
//mostrar el contenido del home	
	var href ="./home.html";
	$("#show").html('');
	$("#show").load(href);
}

