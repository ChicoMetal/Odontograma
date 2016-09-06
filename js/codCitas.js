var USUARIO = "";

var start = "06:00:00";//hora de inicio de las citas
var end = "22:00:00";//hora de fin de las citas

var listTime = new Array();//objeto para almacenar el listado de horas

var JsonConfigTime = {
	'minTime': start,
	'maxTime': end,
    'timeFormat': 'H:i:s',
    'step': 15,
    'forceRoundTime': true
};//json con parametros de personalizado del datapicker (selectro de hora)

$(document).ready(function(){

	var getCookies = GetCookies();//obtengo ajax de peticion para obtener las cookies
	
	if( getCookies != null ){//si se retorno el ajax
		getCookies.success(function(data) {//almaceno las cookies


			var result = JSON.parse(data);
			
			if( atob(result.tipeUser) == TIPE_USER_AUXILIAR )
				USUARIO = atob( result.userid );

			Pacientes();//traer los pacientes para agregarlos al select
    		Medicos();//traer los pacientes para agregarlos al select
		});

	}
	

	$.datepicker.setDefaults({
    	dayNamesShort:$.datepicker.regional[ "es" ],
    	changeMonth: true,
    	changeYear: true,
    	dateFormat: "yy-mm-dd"
    }); //campos date

	$( ".typeDate" ).datepicker();//campos date
	//$('#HoraCita').timepicker(JsonConfigTime);

	$('#NewCita').validate({//validacion del formulario		
	    rules :{
		    pacienteCita : {
			  required : true
			},
			DrCita : {
			  required : true
			},
			dateCita : {
			  required : true
			},
			HoraCita : {
			  required : true
			}
	    },
	    messages : {
			pacienteCita:{
			  required: "Campo requerido"
			},
			DrCita:{
			  required : "Campo requerido"
			},
			dateCita:{
			  required : "Campo requerido"
			},
			HoraCita:{
			  required : "Campo requerido"
			}
	    },
	    submitHandler: function(form){
    
    		var selects = ValidateSelect( $(form).attr("id") ); //obtengo select del formulario
   			if ( selects != 0 ){
   				bootbox.alert("El campo "+selects+" es invalido" );
   			}else{
   				GuardarCita("#NewCita");
   			}

       	},

		invalidHandler:function(form){	
		} 

    });	

    $("form .clean").on("click",function(){ //limpiar selects
    	ResetSelects(this);
    	$('#contentCitas').html('');//limpiar agenda
    });

    $('#dateCita').on('change', function(){
    //traer horas ocupadas en la fecha
    	ChangeTimePicker();    	
    });

    $('#DrCita').on('change', function(){
    //traer horas ocupadas en la fecha
    	ChangeTimePicker();
    });
  
  	GenerarIntervalos();//preparar objeto con listado de horas

});

function ChangeTimePicker(){
//refrescar la lista de tiempo
	var Medico = $('#DrCita').val();
	var Fecha = $('#dateCita').val();

	$('#HoraCita').timepicker('remove');
	$('#HoraCita').val('');

	if( Medico != 'Vacio' && Fecha != '' ){		
		GetTimeOff( Medico, Fecha );
		GetAgenda(Medico, Fecha);
	}

}

function GetTimeOff( Medico, Fecha ){ //busca los medicos existentes en la BD para agregarlas al SELECT del DOM

  $.ajax({
	beforeSend:function(){

	},
	url:"./core/GetTimeOff.php",
	method:"POST",
	data: { DrCita:Medico, dateCita:Fecha},
	success: function( res){
							
	},
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, true ) ){
			RefresTimeList( result );						
		}else{//Si no hay citas pendientes agrego la lista de tiempo completa
			$('#HoraCita').timepicker(JsonConfigTime);

		}
			
	},
	setTimeout:10000
  });
		
}

function RefresTimeList( Result ){
//Segun la fecha seleccionada inhabilito las horas ya ocupadas
	
	var Valores = Result[0];
	var Keys = Result[1];

	var RangosTime = new Array;

	for (var i = Valores.length - 1; i >= 0; i--) {
		
		var itemtango = new Array(  Valores[i][ Keys['1'] ],  AddOneMinuteHour( Valores[i][ Keys['1'] ] )  );
		RangosTime.push( itemtango );

	}

	var JsonConfigTimeItemOff = {
		'minTime': '6:00am',
    	'maxTime': '10:00pm',
	    'timeFormat': 'H:i:s',
	    'disableTimeRanges': RangosTime,
	    'step': 15,
	    'forceRoundTime': true
	};



	$('#HoraCita').timepicker( JsonConfigTimeItemOff );
}

function AddOneMinuteHour( Time ){
//Agrego un minuto a las horas para agregar el rango en el timepicker y desactivar la hora

	var timeArray = Time.split(":");
	var timeRango = Complete( parseInt( timeArray[1] )+1 );

	timeArray[1] = timeRango;

	return timeArray[0]+':'+timeArray[1]+':'+timeArray[2];
}

function Complete(num){
//Completar con ceros a la izquierda para dos digitos 
	numtmp='"'+num+'"';
	largo=numtmp.length-2;
	numtmp=numtmp.split('"').join('');
	if(largo==2)return numtmp;
	ceros='';
	pendientes=2-largo;
	for(i=0;i<pendientes;i++)ceros+='0';
	return ceros+numtmp;

}


function Pacientes(){ 
//busca los pacientes existentes en la BD para agregarlas al SELECT del DOM

  $.ajax({
	beforeSend:function(){

	},
	url:"./core/GetPacientes.php",
	type:"POST",
	success: function( res){
							
	},
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, false ) )
			AddOptions(result,".pacientesSelect");							
			
	},
	setTimeout:10000
  });
}

function Medicos(){ //busca los medicos existentes en la BD para agregarlas al SELECT del DOM

  $.ajax({
	beforeSend:function(){

	},
	url:"./core/getMedicos.php",
	type:"POST",
	success: function( res){
							
	},
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, false ) )
			AddOptions(result,".MedicosSelect");							
			
	},
	setTimeout:10000
  });
}

function GetAgenda(Medico, Fecha){ 
//busca los medicos existentes en la BD para agregarlas al SELECT del DOM

  $.ajax({
	beforeSend:function(){

	},
	url:"./core/GetAgendaMedico.php",
	type:"POST",
	data : {medico:Medico, fecha:Fecha},
	success: function( res){
							
	},
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, true ) )
			ShowAgendaMedico( result );
		else
			$('#contentCitas').html('');//limpiar agenda
			
	},
	setTimeout:10000
  });
}


function GenerarIntervalos(){
//Genera laos intervalos de las horas de las citas
	
	
	var hour;	

	//moment('2000-01-1T09:54:51');
	
	// se toma una fecha cualquiera y se comienza desde la hora inicial de atencion
	//var ahora = moment('01-01-2000 '+start);
	var date = moment('2000-01-01T'+start);

	listTime.push( 
			{
				military:date.format('HH:mm:ss'), //hora militar
				standar:date.format('h:mm:ss a')//hora standar
			}				
		);//agrego la hora inicial

	do{

		// lapso 15 minutos 
		var timeSpan = moment.duration('PT15M');

		// sumar el lapso a la hora
		hour = date.add(timeSpan).format('HH:mm:ss');

		listTime.push( 
				{
					military:hour, standar:date.format('h:mm:ss a')
				} 
			);//agregar json con la hora en los dos formatos

	}while( hour < end );

}

function ShowAgendaMedico( Citas ){
//mostrar la agenda del medico segun el dia seleccionado, si tiene citas 
	
	function Html(hora, realizada, paciente){

		return '<div class="row">\
					<div class="col-md-4">'+ hora +'</div>\
					<div class="col-md-3">'+ realizada +'</div>\
					<div class="col-md-5">'+ paciente +'</div>\
				</div>';
	}

	var valores = Citas[0];
	var keys = Citas[1];
	var item;

	$('#contentCitas').html('');

	for (var i = listTime.length - 1; i >= 0; i--) {//itero por cada una de las horas del listado 

		for (var z = valores.length - 1; z >= 0; z--) {//itero por cada cita encontrada
			
			if( valores[z][ keys[1] ] == listTime[i].military ){//si la hora de la cita corresponde a la hora del listado

				item = Html(
							listTime[i].military+' | '+listTime[i].standar,
							valores[z][ keys[2] ],
							valores[z][ keys[4] ]
						);
			
			}else{
				item = Html(listTime[i].military+' | '+listTime[i].standar,'','');
			}

			
		}

		$('#contentCitas').prepend( item );

	}

	$('#contentCitas').prepend(

			Html('Hora', 'Realizada', 'Paciente')
			
		);//agregar titulos

}

function GuardarCita(form){
//guardar los datos de la nueva cita

	$.ajax({
		beforeSend:function(){

		},
		url:"./core/SaveNewCita.php",
		method:"POST",
		data: $(form).serialize()+"&usuario="+USUARIO,
		success: function( res){
								
		},
		error: function(jqXHR,estado,error){
			console.log(jqXHR);
		},
		complete: function(jqXHR,estado){		
			
			var result = JSON.parse( jqXHR.responseText );

			ChangeTimePicker();

			if( ValidateResponseServer( result, false ) ){
				console.log( result );
				
			}

		},
		setTimeout:10000
	});

}