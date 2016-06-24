var USUARIO = 92654;

$(document).ready(function(){
	
	var JsonConfigTime = {
		'minTime': '6:00am',
    	'maxTime': '10:00pm',
    	'disableTimeRanges': [
	        ['10pm', '7:30am']
	    ],
	    'timeFormat': 'H:i:s',
	    'step': 15,
	    'forceRoundTime': true
	};

	$.datepicker.setDefaults({
    	dayNamesShort:$.datepicker.regional[ "es" ],
    	changeMonth: true,
    	changeYear: true,
    	dateFormat: "yy-mm-dd"
    }); //campos date

	$( ".typeDate" ).datepicker();//campos date
	$('#HoraCita').timepicker(JsonConfigTime);

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

    Pacientes();//traer los pacientes para agregarlos al select
    Medicos();//traer los pacientes para agregarlos al select

});

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

function Limpiar(selector){ //limpia los formularios
	$(selector).each(function(){
	  this.reset();						  
	});
}

function Pacientes(){ //busca los pacientes existentes en la BD para agregarlas al SELECT del DOM

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

			if( ValidateResponseServer( result, false ) )
				console.log( result );

		},
		setTimeout:10000
	});

}