var USUARIO = 92654;

var JsonConfigTime = {
	'minTime': '6:00am',
	'maxTime': '10:00pm',
    'timeFormat': 'H:i:s',
    'step': 15,
    'forceRoundTime': true
};

$(document).ready(function(){
	

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
   				bootbox.alert("el campo "+selects+" es invalido" );
   			}else{
   				GuardarCita("#NewCita");
   			}

       	},

		invalidHandler:function(form){	
		} 

    });	

    $("form .clean").on("click",function(){ //limpiar selects
    	ResetSelects(this);
    });

    $("#index").on( "click", function(){ 
		window.location="./index.html";
	});

    $('#dateCita').on('change', function(){
    //traer horas ocupadas en la fecha
    	ChangeTimePicker();
    });

    $('#DrCita').on('change', function(){
    //traer horas ocupadas en la fecha
    	ChangeTimePicker();
    });

    Pacientes();//traer los pacientes para agregarlos al select
    Medicos();//traer los pacientes para agregarlos al select

});

function ChangeTimePicker(){
//refrescar la lista de tiempo
	var Medico = $('#DrCita').val();
	var Fecha = $('#dateCita').val();

	$('#HoraCita').timepicker('remove');
	$('#HoraCita').val('');

	if( Medico != 'Vacio' && Fecha != '' ){
		GetTimeOff( Medico, Fecha );
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

function ResetSelects(form){ //funcion clean para los select

	var form = $(form).parents('form').attr('id'); //obtener id formulario

    $.each($("#"+form+" select"),function(index, value){

		$(value).val('0').trigger("chosen:updated");

	});

} 

function ValidateSelect(form){ //valida los select
	
	var target = 0;

	$.each($("#"+form+" select.validate"),function(index, value){
		if ( $(value).val() == "0"){
						
			target = $(value).attr('data-mensaje');
		}
	});

	return target	 
}

function Limpiar(selector){ 
//limpia los formularios

	$(selector).each(function(){
	  this.reset();						  
	});

	
}

function Pacientes(){ 
//busca los pacientes existentes en la BD para agregarlas al SELECT del DOM

  $.ajax({
	beforeSend:function(){

	},
	url:"./core/getPacientes.php",
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

function AddOptions(result,element){ //crea la semantica HTML para agregar a los SELECT del DOM 

	try{


		var valores = result[0];	
		var indices = result[1];	

		var html = "<option value='0'></option>";

		for( i = 0; i < valores.length; i++ ){
			
			html = html+ "<option value= '"+valores[i][indices[0]]+"' >"+ valores[i][indices[1]]+"</option>";
		}
		$(element).html( html );
		
		//hago los selects fitrables
		$(element).trigger("chosen:updated");	
		$(element).trigger("chosen:updated");	
		$(element).chosen({
			enable_split_word_search:true,
			no_results_text: "Ningun Resultado",
	    	width: "100%",
	    	allow_single_deselect: true
		});

	}catch(e){
		console.log("Error al procesar los datos "+e);
	}
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