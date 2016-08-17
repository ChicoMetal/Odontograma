$(document).ready(function(){

	var getCookies = GetCookies();//obtengo ajax de peticion para obtener las cookies

	if( getCookies != null ){//si se retorno el ajax
		getCookies.success(function(data) {//almaceno las cookies


			var result = JSON.parse(data);
			
			AdapterMenu( result );
		});

	}

	$("#home").on( "click", function(){ 
		
		//ShowHome();
		window.location="./home.html";
	
	});

	$("#contentItemMenu").on("click","#linkCitas", function(){ 
		
		/*var href ="./citas.html";
		$("#show").html('');
		$("#show").load(href);*/
	
		window.location="./citas.html";
	});

	$("#contentItemMenu").on("click", "#linkAdmisiones", function(){ 
		/*var href ="./Admisiones.html";
		$("#show").html('');
		$("#show").load(href);*/
		window.location="./Admisiones.html";
	});
	$("#contentItemMenu").on("click", "#linkAtencion", function(){ 
		/*var href ="./AtencionMedica.html";
		$("#show").html('');
		$("#show").load(href);*/
		window.location="./AtencionMedica.html";
	});

	$("#contentItemMenu").on("click", "#linkPaciente", function(){ 
		/*var href ="./pacientes.html";
		$("#show").html('');
		$("#show").load(href);*/
		window.location="./pacientes.html";
	});

	$("#closeSession").on( "click", function(){ 
		CloseSession();
	});

});