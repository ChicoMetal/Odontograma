var MEDICO = "";

$(document).ready(function(){

	var getCookies = GetCookies();//obtengo ajax de peticion para obtener las cookies

	if( getCookies != null ){//si se retorno el ajax
		getCookies.success(function(data) {//almaceno las cookies


			var result = JSON.parse(data);
			
			if( atob(result.tipeUser) == TIPE_USER_MEDICO )
				MEDICO = atob( result.userid );

			getCitasAdmitidas();
		});

	}

	$('#ShowCitas').on("click", ".btn.ItemCita", function(){
	//evento para agregar cada procedimiento de cada grupo en el menu
			var Paciente = $(this).attr('id');
			var Cita  =  $(this).attr('cita');

    	bootbox.dialog({
			title: "Motivo de la consulta",
			message: '<div class="row">\
						<div class="col-md-12">\
							<form role="form" class="center-block" id="motivoCita" name="motivoCita">\
							  <div class="form-group">\
							    <label class="col-md-8 control-label" for="motivoSimple">Motivo de consulta<i class="fa fa-asterisk fa-1x"></i></label>\
							    <input type="text" name="motivoSimple" class="form-control col-md-8" id="motivoSimple" placeholder="Motivo de consulta">\
							  </div>\
							  <div class="form-group">\
							    <label class="col-md-8 control-label" for="motivoExtend">Evolución y estado actual <i class="fa fa-asterisk fa-1x"></i></label>\
							    <textarea  name="motivoExtend" class="form-control col-md-8" id="motivoExtend" placeholder="Evolución y estado actual (Ampliación motivo de consulta - reporte de síntomas)"></textarea>\
							  </div>\
						</form>\
						</div>\
					</div>',
			buttons: {
				success: {
					label: "Guardar",
					className: "btn-success",
					callback: function() {
						
						var motivoSimple = $('#motivoCita #motivoSimple').val();
						var motivoExtend = $('#motivoCita #motivoExtend').val();
						

						if( motivoSimple != '' && motivoExtend != '' ){
							OpenHistoria( Paciente, Cita, motivoSimple, motivoExtend );					
						}else{
							bootbox.alert("Debe ingresar la informacion");						

						}
					}
				}
			}
		});

	});

	$("#index").on( "click", function(){ 
		window.location="./platform.html";
	});

	
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

function OpenHistoria( Paciente, Cita, MotivoSimple, MotivoExtend ){
//Guarda la admision de la cita

	$.ajax({
		beforeSend:function(){

		},
		url:"./core/OpenHistoria.php",
		method:"POST",
		data: {cita:Cita, paciente:Paciente, motivoSimple:MotivoSimple, motivoExtend:MotivoExtend, medico:MEDICO},
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


