var TIPE_USER_ADMIN = "1111";
var TIPE_USER_MEDICO = "0111";
var TIPE_USER_AUXILIAR = "0011";

function ValidateResponseServer( result, HiddenAlert=false ){ 
//Confirmar si la respuesta del server es o no un mensaje
	
	
	if( ! $.isArray( result ) ){
		
		bootbox.alert("Error");

	}else if( result[0] === "msm" ){
		
		var key = result[1];

		var mensaje = MensajeServer( key );
		
		if( HiddenAlert == true ){
			console.log( mensaje );
			return ValidateMsmResponse( key );
		}else
			bootbox.alert(mensaje);

	}else{

		return true;

	}
}

function MensajeServer( codigo ){ 
//Retornar un mensaje deacuerdo al codigo enviado del server
	 
	var mss = new Array(
		["0000","Error al comuncarse con la base de datos"],
		["0001","Error en la instruccion query"],
		["0010","No se encontraron datos"],
		["1000","Instruccion ejecutada correctamente"],
		["0100","Error en la seleccion de la tabla"],
		["0011","Error en la instruccion"],
		["1100","Instruccion ejecutada correctamente"],
		["1101","Peticion indeterminada"],
		["1001","Ya existe una cita pendiente"],
		["1011","La fecha ya ha pasado"]
	);

	for (var i = mss.length - 1; i >= 0; i--) {
		
		if ( mss[i][0] == codigo )
			return mss[i][1];

	};

	return "Salida inesperada";
}

function ValidateMsmResponse( msm ){ 
//Verifico si el mensaje enviado desde el server es de exito o de error, en caso de no necesitar un mensaje

	var mss = new Array(
		["0000",false],
		["0001",false],
		["0010",false],
		["1000",true],
		["0100",false],
		["0011",false],
		["1100",true],
		["1101",false],
		["1001",false],
		["1011",false]
	);

	for (var i = mss.length - 1; i >= 0; i--) {
		
		if ( mss[i][0] == msm )
			return mss[i][1];

	};

	return false;
}

function ResetSelects(form){ 
//funcion clean para los select

	var form = $(form).parents('form').attr('id'); //obtener id formulario

    $.each($("#"+form+" select"),function(index, value){

		$(value).val('0').trigger("chosen:updated");

	});
} 

function ValidateSelect(form){ 
//valida los select
	
	var target = 0;

	$.each($("#"+form+" select.validate"),function(index, value){
		if ( $(value).val() == "0"){
						
			target = $(value).attr('data-mensaje');
		}
	});

	return target	 
}

function AddOptions(result,element){ 
//crea la semantica HTML para agregar a los SELECT del DOM 

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

function Limpiar(selector){ 
//limpia los formularios

	$(selector).each(function(){
	  this.reset();						  
	});
}

function ValidarCookies(){ 
// valida la session

	return $.ajax({
		beforeSend:function(){

		},
		type:"POST",
		url:"./core/validateCookies.php",
		dataType: 'json',
		success: function( res){
		
		},
		error: function(jqXHR,estado,error){
			
			console.log(jqXHR);
		},
		setTimeout:10000
	});
}

function CloseSession(){ 
//cierra la session
  $.ajax({
	beforeSend:function(){

	},
	url:"./core/closeSession.php",
	type:"POST",
	success: function( res){
		console.log(res);

	},
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){	

		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, true ) )
			window.location="./index.html";
		else if( ValidateResponseServer( result, false ) ){
			console.log(result);
		}	

	},
	setTimeout:10000
  });
}

function GetCookies(){
//obtiene un objeto con las cookies
	return $.ajax({
		beforeSend:function(){

		},
		url:"./core/getCookies.php",
		method:"POST",
		error: function(jqXHR,estado,error){
			console.log(jqXHR);
		},
		complete: function(jqXHR,estado){	
			
			

		},
		setTimeout:10000
	});
}

function AdapterMenu( Data ){
//alterar el menu para mostrar opciones que correponda a cada tipo de usuarios

	if( atob(Data.tipeUser) == TIPE_USER_ADMIN ){
		
		$('#contentItemMenu').html('\
				<li id="linkCitas"><a href="#">Citas <span class="sr-only">(current)</span></a></li>\
		        <li id="linkAdmisiones"><a href="#">Admisiones</a></li>\
		        <li id="linkAtencion"><a href="#">Atender</a></li>\
		        <li id="linkPaciente"><a href="#">Nuevo paciente</a></li>\
			');

	}else if( atob(Data.tipeUser) == TIPE_USER_MEDICO ){
		
		$('#contentItemMenu').html('\
		        <li id="linkAtencion"><a href="#">Atender</a></li>\
			');

	}else if( atob(Data.tipeUser) == TIPE_USER_AUXILIAR ){
		$('#contentItemMenu').html('\
				<li id="linkCitas"><a href="#">Citas <span class="sr-only">(current)</span></a></li>\
		        <li id="linkAdmisiones"><a href="#">Admisiones</a></li>\
		        <li id="linkPaciente"><a href="#">Nuevo paciente</a></li>\
			');
	}
}