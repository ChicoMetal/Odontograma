var MEDICO = 11043;

$(document).ready(function(){

	$('#ShowCitas').on("click", ".btn.ItemCita", function(){
	//evento para agregar cada procedimiento de cada grupo en el menu

    	OpenHistoria( $(this).attr('id'), $(this).attr('cita') );

	});

	$("#index").on( "click", function(){ 
		window.location="./index.html";
	});

	getCitasAdmitidas();
});

function getCitasAdmitidas(){ 
//busca las citas  existentes en la BD para el dia actual
	$('#ShowCitas').html( "" );

  $.ajax({
	beforeSend:function(){

	},
	url:"./core/getCitasAdmitidas.php",
	type:"POST",
	data:{medico:MEDICO},
	success: function( res){
							
	},
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, false ) )
			AddCitasAdmitidas(result);							
			
	},
	setTimeout:10000
  });
}

function AddCitasAdmitidas( result ){
//agrega al DOM las citas que estan pendientes el dia actual

	var valores = result[0];
	var keys = result[1];

	for (var i = valores.length - 1; i >= 0; i--) {
		GenerateCodeCita(valores[i], keys);
	}

	function GenerateCodeCita( datos, keys ){
	//genera el html de cada cita
		var html = '\
					<div class="ItemCita btn" id="'+datos[ keys[1] ]+'" cita="'+datos[ keys[0] ]+'">\
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

function OpenHistoria( Paciente, Cita ){
//Guarda la admision de la cita

	$.ajax({
		beforeSend:function(){

		},
		url:"./core/OpenHistoria.php",
		method:"POST",
		data: {cita:Cita, paciente:Paciente, medico:MEDICO},
		success: function( res){
								
		},
		error: function(jqXHR,estado,error){
			console.log(jqXHR);
		},
		complete: function(jqXHR,estado){		
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result, true ) ){
				window.location="./Odontograma.php?paciente="+Paciente;
			}

		},
		setTimeout:10000
	});


}


