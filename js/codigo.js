
//temporales variables
var PACIENTE = '1104';
var ZONE = '8';
/**
		var peticion='./guardar.php';
		var metodo='POST';
		$.ajax({
			beforeSend:function(){

			},
			type: metodo,
			url:peticion,
			dataType:'json',
			data:{datos:array_nombres},
			success: function(respuesta){		
				console.log(respuesta);	 
			},
			error: function(jqXHR,estado,error){

				
			},

			complete: function(jqXHR,estado){
				var respuesta= $.parseJSON(jqXHR.responseText);
				console.log(respuesta);
				
				
			},
			setTimeout:10000

		});

		return resultado;
**/
//zonas para mostrar en procedimiento
var ZONE_OCLUSAL = 1;
var ZONE_VESTIBULAR = 2;
var ZONE_PALATINA = 3;
var ZONE_MESIAL = 4;
var ZONE_DISTAL = 5;
var ZONE_C_VESTIBULAR_I = 6;
var ZONE_C_VESTIBULAR_S = 7;
var ZONE_BOT = 9;
var ZONE_TOP = 8;

//tipo de procedimiento
var PROCEDURE_TIPE_DIAGNOSTICO = 1;
var PROCEDURE_TIPE_TRATAMIENTO = 2;

//representacion de un procedimiento
var REPRESENTACION_COLOR = 1;
var REPRESENTACION_GRAFICO = 2;

//diente/cara seleccionado para ingresar procedimiento
var DENT_SELECT_PROCEDURE = '';
var FACE_SELECT_PROCEDURE = '';
var SELECT_PROCEDURE = null;


$(document).on("ready",function(){


	GetOdontograma();
	GetMenuProcedures( 1 );
	GetMenuProcedures( 2 );
	
});


function GetOdontograma(){//peticion para buscar los dientes a la BD

	$.ajax({
		beforeSend:function(){

		},
		type: "POST",
		url:"./core/getDent.php",
		dataType:'json',
		error: function(jqXHR,estado,error){
			
			console.log(jqXHR);			
			
		},

		complete: function(jqXHR,estado){
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result ) )
				AddDents( result );

		},
		setTimeout:10000

	});

}


function ValidateResponseServer( result ){ //Confirmar si la respuesta del server es o no un mensaje
	
	
	if( ! $.isArray( result ) ){
		
		alert("Error");

	}else if( result[0] === "msm" ){
		
		var key = result[1];

		var mensaje = MensajeServer( key );
		alert(mensaje);

	}else{

		return true;

	}

}

function MensajeServer( codigo ){ //Retornar un mensaje deacuerdo al codigo enviado del server

	var mss = new Array(
		["0000","Error al comuncarse con la base de datos"],
		["0001","Error en la instruccion query"],
		["0010","No se encontraron datos"],
		["1000","Instruccion ejecutada correctamente"],
		["0100","Error en la seleccion de la tabla"],
		["0011","Error en la instruccion"],
		["1100","Instruccion ejecutada correctamente"],
		["1101","Peticion indeterminada"]
	);

	for (var i = mss.length - 1; i >= 0; i--) {
		
		if ( mss[i][0] == codigo )
			return mss[i][1];

	};

	return "Salida inesperada";
}

function AddDents( result ){ //agrega los dientes al html

	var keys = result[1];
	var valores = result[0];

	for (var i = valores.length - 1; i >= 0; i--) {
		 		
		if( valores[i][ keys[4] ] == 3 || valores[i][ keys[4] ] == 5 ){ //dependiendo si es del lado izquierdo o derecho
		//confirmo los dientes izquierdos para agregar en orden inverso

			$("."+valores[i][ keys[3] ]).prepend( GenerateDentCode( valores[i][ keys[1] ] ) );
		
		}else{

			$("."+valores[i][ keys[3] ]).append( GenerateDentCode( valores[i][ keys[1] ] ) );
		
		}
	};

	GetProcedurePaciente();// traer los diagnosticos que existan
}

function GenerateDentCode( id ){ //codigo del diente para pintar
	var dentOne = '\
	<figure id="'+id+'" class="contentOneDent">\
	<div class="textDent headDent">'+id+'</div>\
		<svg viewBox="0 0 6598 10423">\
		 <g id="Capa_x0020_1">\
		  <path class="dent1 CervicalVestibularS" d="M1113 2675c-314,-318 -631,-637 -958,-958 1118,-2319 5691,-2126 6257,-42l-908 1018c-580,-562 -1354,-906 -2205,-906 -841,0 -1608,336 -2186,888z"/>\
		  <ellipse class="dent1 Oclusal" cx="3299" cy="5214" rx="1370" ry="1443"/>\
		  <path class="dent1 CervicalVestibularI" d="M1111 7751c-314,317 -630,634 -956,955 1118,2319 5691,2126 6257,42l-906 -1016c-580,564 -1355,909 -2207,909 -843,0 -1610,-337 -2188,-890z"/>\
		  <path class="dent1 Palatina" d="M2487 6371c-472,463 -922,921 -1376,1380 578,553 1345,890 2188,890 852,0 1627,-345 2207,-909l-1293 -1450c-465,404 -1156,510 -1726,89z"/>\
		  <path class="dent1 Mesial" d="M2484 6374c-471,462 -920,919 -1373,1377 -655,-627 -1066,-1532 -1066,-2537 0,-1008 413,-1914 1071,-2541l-3 2c454,457 903,914 1374,1377l2 -2c-339,263 -560,686 -560,1164 0,475 218,897 555,1160z"/>\
		  <path class="dent1 Distal" d="M5504 2693c645,626 1049,1524 1049,2521 0,995 -403,1892 -1047,2518l-1290 -1447c278,-264 453,-646 453,-1071 0,-427 -176,-810 -455,-1074l1290 -1447z"/>\
		  <path class="dent1 Vestibular" d="M3299 1787c851,0 1625,344 2205,906l-1291 1448c-465,-405 -1156,-510 -1726,-89 -471,-463 -920,-920 -1374,-1377 578,-552 1345,-888 2186,-888z"/>\
		 </g>\
		</svg>\
	<figcaption class="textDent footDent"></figcaption>\
	</figure>';

	return dentOne;
}

function GetMenuProcedures( origin1 ){
//peticion para buscar los menus de diagnosticos o tratamientos a la BD

	$.ajax({
		beforeSend:function(){

		},
		type: "POST",
		url:"./core/getMenuProcedures.php",
		dataType:'json',
		data:{origin:origin1},
		error: function(jqXHR,estado,error){
			
			console.log(jqXHR);			
			
		},

		complete: function(jqXHR,estado){
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result ) )
				AddGroupProcedures( result, origin1)

		},
		setTimeout:10000

	});

}

function AddGroupProcedures( result, origin ){//parsea json y agrega el html de los menus procedimientos

	var keys = result[1];
	var valores = result[0];

	for (var i = valores.length - 1; i >= 0; i--) {
		 
		if( origin == 1 )
			$("#diagnosticosMenu").append( GenerateGroupProcedureCode( valores[i][ keys[0] ], valores[i][ keys[1] ] ) );
		else
			$("#tratamientosMenu").append( GenerateGroupProcedureCode( valores[i][ keys[0] ], valores[i][ keys[1] ] ) );		
		
	}

    $(".btn").on("click", function(){//evento para agregar cada procedimiento de cada grupo

    	var idGroup = $(this).parents(".panel").attr('id');

    	if( !$("#collapse"+idGroup).hasClass('in') )
    		$(".panel-collapse").removeClass('in');
    	
		GetProcedures( idGroup );

	});


}

function GenerateGroupProcedureCode( id, titulo ){//generar el menu de los procedimientos

	var html = "\
			  <div id='"+id+"' class='panel panel-default'>\
			    <div class='panel-heading' role='tab' id='headingTwo'>\
			      <i class='fa fa-arrow-circle-o-right fa-lg'></i><h4 class='panel-title'>\
			        <a class='collapsed btn'\
			        	role='button'\
			        	data-toggle='collapse'\
			        	data-parent='#accordion'\
			        	href='#collapse"+id+"'\
			        	aria-expanded='false'\
			        	aria-controls='collapse"+id+"'>\
			          "+titulo+"\
			        </a>\
			      </h4>\
			    </div>\
			    <div id='collapse"+id+"'\
				    class='panel-collapse\
				    collapse' role='tabpanel'\
			    	aria-labelledby='headingTwo'>\
			      <div class='panel-body'>\
			      </div>\
			    </div>\
			  </div>\
			";


	return html;

}


function GetProcedures( GroupId ){
//peticion para buscar los diagnosticos o tratamientos a la BD

	$.ajax({
		beforeSend:function(){

		},
		type: "POST",
		url:"./core/getProcedures.php",
		dataType:'json',
		data:{id:GroupId},
		error: function(jqXHR,estado,error){
			
			console.log(jqXHR);			
			
		},

		complete: function(jqXHR,estado){
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result ) )
				AddProcedures( result, GroupId )

		},
		setTimeout:10000

	});

}

function AddProcedures( result, parent ){
//parsea json y agrega el html de los menus procedimientos

	var keys = result[1];
	var valores = result[0];

	$(".panel-group #"+parent+" .panel-collapse").html("");

	for (var i = valores.length - 1; i >= 0; i--) {
		 			
		$(".panel-group #"+parent+" .panel-collapse").append( 
			GenerateItemProcedureCode( 
				valores[i][ keys[0] ], 
				valores[i][ keys[1] ], 
				valores[i][ keys[2] ], 
				valores[i][ keys[3] ] 
			) 
		);

	}

    $(".panel-collapse p").on("click", function(){
    //evento para agregar cada procedimiento de cada grupo

    	SELECT_PROCEDURE = $(this).attr('id');

    	$(".contentOneDent").on("click", function(){
    		var dent = $(this).attr('id');

    		SaveProcedurePaciente( PACIENTE, dent, ZONE, SELECT_PROCEDURE);//TODO: verificar el uso del numero o codigo del diente

    		SELECT_PROCEDURE = null;
    	});

	});


}

function GenerateItemProcedureCode(Id, name, codigo, representacion){
//generar cada procedimiento

	var html = "<div class=' itemPainted '>\
				<p id='"+Id+"' class='"+representacion+"' title='"+codigo+"'> "+name+" </p>\
				</div>";

	return html;

}

function SaveProcedurePaciente(Paciente, Dent, Zone, Procedure ){
//traer procedimientos asignados a un paciente

	$.ajax({
		beforeSend:function(){

		},
		type: "POST",
		url:"./core/saveProcedurePaciente.php",
		dataType:'json',
		data:{paciente:Paciente, dent:Dent, zone: Zone, procedure:Procedure},
		error: function(jqXHR,estado,error){
			
			console.log( jqXHR );			
			
		},

		complete: function(jqXHR,estado){
			
			//var result = JSON.parse( jqXHR.responseText );

			console.log( jqXHR );

		},
		setTimeout:10000

	});

}

function GetProcedurePaciente(){
//traer procedimientos asignados a un paciente

	$.ajax({
		beforeSend:function(){

		},
		type: "POST",
		url:"./core/getProceduresPaciente.php",
		dataType:'json',
		data:{paciente:PACIENTE},
		error: function(jqXHR,estado,error){
			
			console.log(jqXHR);			
			
		},

		complete: function(jqXHR,estado){
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result ) )
				AddProceduresPaciente( result );

		},
		setTimeout:10000

	});

}

function AddProceduresPaciente( result ){
//mostrar en el html los procedimientos del paciente

	var keys = result[1];
	var valores = result[0];

	for (var i = valores.length - 1; i >= 0; i--) {

		var location = '';

		if( valores[i][ keys[3] ] == PROCEDURE_TIPE_DIAGNOSTICO ) //establesco si la representacion es un diagnostico, tratamiento
			location += " #diagnosticos ";
		else
			location += " #tratamientos ";

		if( valores[i][ keys[5] ] != null ){ //establezco si posee una zona
			
			location += " figure#"+valores[i][ keys[0] ]; //establezco el diente
			
			if( valores[i][ keys[1] ] == ZONE_BOT )
				location += " figcaption.footDent ";
			else if( valores[i][ keys[1] ] == ZONE_TOP )
				location += " .headDent ";

		}else{

			location += " .procedureNullRepresentacion ";
		}		
		
		if( valores[i][ keys[5] ] == REPRESENTACION_COLOR )//dependiendo el modo de representar el procedimiento llamo a la funcion respectiva		
				PaintColorZoneDent( valores[i][ keys[1] ], valores[i][ keys[4] ], location );

		else if( valores[i][ keys[5] ] == REPRESENTACION_GRAFICO )
			$( location ).append( 
				GenerateFigureProcedure( valores[i][ keys[4] ]  )
			);			 		

	}

}

function GenerateFigureProcedure( resource ){
//funcion para devolver la representacion grafica de los procedimientos


	function codeContent( content ){

		var codeContent ="\
			<figure class='figureFoot'>\
				<svg viewBox='0 0 442 401'>\
				 <g id='Capa_x0020_1'>\
				  "+content+"\
				 </g>\
				</svg>\
			</figure>\
			";

		return codeContent;
	}


	var content = "<polygon class='figurePaintPoints' points='216,51 42,374 399,376 '/>";

	return codeContent( content );

}

function PaintColorZoneDent( zone, resource, location ){
//funcion para pintar los colores del procedimiento

	if( zone == ZONE_OCLUSAL )
		location += " .Oclusal ";
	else if( zone == ZONE_VESTIBULAR )
		location += " .Vestibular ";
	else if( zone == ZONE_PALATINA )
		location += " .Palatina ";
	else if( zone == ZONE_MESIAL )
		location += " .Mesial ";
	else if( zone == ZONE_DISTAL )
		location += " .Distal ";
	else if( zone == ZONE_C_VESTIBULAR_I )
		location += " .CervicalVestibularI ";
	else if( zone == ZONE_C_VESTIBULAR_S )
		location += " .CervicalVestibularS ";

	$(location).css("fill","#"+resource);

}
