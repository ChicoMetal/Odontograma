var USUARIO = "";

$(document).ready(function(){

	var getCookies = GetCookies();//obtengo ajax de peticion para obtener las cookies

	if( getCookies != null ){//si se retorno el ajax
		getCookies.success(function(data) {//almaceno las cookies


			var result = JSON.parse(data);
			
			if( atob(result.tipeUser) == TIPE_USER_AUXILIAR )
				USUARIO = atob( result.userid );

			getCitasPendientes();
		});

	}

	$('#ShowCitas').on("click", ".btn.ItemCita", function(){
	//evento para agregar cada procedimiento de cada grupo en el menu

    	SaveAdmision( $(this).attr('id') );

	});

	
});

function getCitasPendientes(){ 
//busca las citas  existentes en la BD para el dia actual
	$('#ShowCitas').html( "" );

  $.ajax({
	beforeSend:function(){

	},
	url:"./core/getCitasPendientes.php",
	type:"POST",
	success: function( res){
							
	},
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, false ) )
			AddCitas(result);							
			
	},
	setTimeout:10000
  });
}

function AddCitas( result ){
//agrega al DOM las citas que estan pendientes el dia actual

	var valores = result[0];
	var keys = result[1];

	for (var i = valores.length - 1; i >= 0; i--) {
		GenerateCodeCita(valores[i], keys);
	}

	function GenerateCodeCita( datos, keys ){
	//genera el html de cada cita
		var html = '\
					<div class="ItemCita btn" id="'+datos[ keys[0] ]+'">\
						<div class="row">	\
							<div class="col-md-6">\
								<label >'+keys[1]+':</label>\
								<label >'+datos[ keys[1] ]+'</label>\
							</div>\
							<div class="col-md-6">\
								<label >'+keys[2]+':</label>\
								<label >'+datos[ keys[2] ]+'</label>\
							</div>\
						</div>\
						<div class="row">\
							<div class="col-md-6">\
								<label >'+keys[3]+':</label>\
								<label >'+datos[ keys[3] ]+'</label>\
							</div>\
							<div class="col-md-6">\
								<label >'+keys[4]+':</label>\
								<label >'+datos[ keys[4] ]+'</label>\
							</div>\
						</div>\
						<div class="row">\
							<div class="col-md-12">\
								<label >'+keys[5]+':</label>\
								<label >'+datos[ keys[5] ]+'</label>\
							</div>\
						</div>\
					</div>\
				';

		$('#ShowCitas').append( html );
	}

}

function SaveAdmision( idCita ){
//Guarda la admision de la cita
	var CodAdmision = GenerateCodAdmision();

	$.ajax({
		beforeSend:function(){

		},
		url:"./core/saveAdmision.php",
		method:"POST",
		data: {cita:idCita, codAdmision:CodAdmision,usuario:USUARIO},
		success: function( res){
								
		},
		error: function(jqXHR,estado,error){
			console.log(jqXHR);
		},
		complete: function(jqXHR,estado){		
			
			var result = JSON.parse( jqXHR.responseText );

			ValidateResponseServer( result, false );
			getCitasPendientes();

		},
		setTimeout:10000
	});

	function GenerateCodAdmision(){
		return Math.floor(1e9 + (Math.random() * 9e9));
	}
}


