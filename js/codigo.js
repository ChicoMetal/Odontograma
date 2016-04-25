
//temporales variables
var PACIENTE = '1104';



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
var ZONE_TOP = 8;
var ZONE_BOT = 9;
var ZONE_GENERAL = 10;
var ZONE_NULA = 11;

//tipo de procedimiento
var PROCEDURE_TIPE_DIAGNOSTICO = 1;
var PROCEDURE_TIPE_TRATAMIENTO = 2;

//representacion de un procedimiento
var REPRESENTACION_COLOR = 1;
var REPRESENTACION_GRAFICO = 2;

//diente/cara seleccionado para ingresar procedimiento
var FACE_SELECT_PROCEDURE = null;

$(document).ready(function(){

	GetOdontograma();//mostrar el odontograma
	GetMenuProcedures( 1 );//traer los procedimientos 
	GetMenuProcedures( 2 );//traer los procedimientos 

	$(".subGroup").on("DOMNodeInserted", function(){//evento q desencadena la vista de los procedimientos agregados en modo de tooltip
		
		$('.contentOneDent').popover({
			popover:true,
			container:false,//no cambiar, o dara error
			html:true,
			trigger:'focus',
			placement:"right auto",
			title:"Titulo desde codigo",
			content:"Contenido desde codigo, generado con template, justo lo que necesito! <button>Aqui va el contenido</button>",
			template:'<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'

		});	

		
	});

	$(".subGroup").on("mouseenter", ".contentOneDent", function(){
		$(".contentOneDent").popover('hide');
		$(this).popover('toggle');
	});
	
	
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
			
			$('.subGroup').html('');//limpio el contenedor de los dientes

			if( ValidateResponseServer( result ) )
				AddDents( result );

		},
		setTimeout:10000

	});

}




function ValidateResponseServer( result, HiddenAlert=false ){ //Confirmar si la respuesta del server es o no un mensaje
	
	
	if( ! $.isArray( result ) ){
		
		alert("Error");

	}else if( result[0] === "msm" ){
		
		var key = result[1];

		var mensaje = MensajeServer( key );
		
		if( HiddenAlert == true )
			return ValidateMsmResponse( key );
		else
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
		["1101",false]
	);

	for (var i = mss.length - 1; i >= 0; i--) {
		
		if ( mss[i][0] == msm )
			return mss[i][1];

	};

	return false;
}

function AddDents( result ){ //agrega los dientes al html

	var keys = result[1];
	var valores = result[0];

	for (var i = valores.length - 1; i >= 0; i--) {
		 		
		if( valores[i][ keys[4] ] == 3 || valores[i][ keys[4] ] == 5 ){ //dependiendo si es del lado izquierdo o derecho
		//confirmo los dientes izquierdos para agregar en orden inverso

			$("."+valores[i][ keys[3] ]).prepend( GenerateDentCode( valores[i][ keys[1] ], valores[i][ keys[0] ] ) );
		
		}else{

			$("."+valores[i][ keys[3] ]).append( GenerateDentCode( valores[i][ keys[1] ], valores[i][ keys[0] ] ) );
		
		}
	};

	GetProcedurePaciente();// traer los diagnosticos que existan
}

function GenerateDentCode( id, cod ){ //codigo del diente para pintar
	var dentOne = '\
	<figure id="'+id+'" cod="'+cod+'" class="contentOneDent">\
	<div class="textDent headDent">'+id+'</div>\
		<svg class="figureDent" viewBox="0 0 6598 10423" >\
		 <g id="Capa_x0020_1">\
		  <path 	cod="'+ZONE_C_VESTIBULAR_S+'" class="faceDent dent1 CervicalVestibularS" d="M1113 2675c-314,-318 -631,-637 -958,-958 1118,-2319 5691,-2126 6257,-42l-908 1018c-580,-562 -1354,-906 -2205,-906 -841,0 -1608,336 -2186,888z"/>\
		  <ellipse 	cod="'+ZONE_OCLUSAL+'" class="faceDent dent1 Oclusal" cx="3299" cy="5214" rx="1370" ry="1443"/>\
		  <path 	cod="'+ZONE_C_VESTIBULAR_I+'" class="faceDent dent1 CervicalVestibularI" d="M1111 7751c-314,317 -630,634 -956,955 1118,2319 5691,2126 6257,42l-906 -1016c-580,564 -1355,909 -2207,909 -843,0 -1610,-337 -2188,-890z"/>\
		  <path 	cod="'+ZONE_PALATINA+'" class="faceDent dent1 Palatina" d="M2487 6371c-472,463 -922,921 -1376,1380 578,553 1345,890 2188,890 852,0 1627,-345 2207,-909l-1293 -1450c-465,404 -1156,510 -1726,89z"/>\
		  <path 	cod="'+ZONE_MESIAL+'" class="faceDent dent1 Mesial" d="M2484 6374c-471,462 -920,919 -1373,1377 -655,-627 -1066,-1532 -1066,-2537 0,-1008 413,-1914 1071,-2541l-3 2c454,457 903,914 1374,1377l2 -2c-339,263 -560,686 -560,1164 0,475 218,897 555,1160z"/>\
		  <path 	cod="'+ZONE_DISTAL+'" class="faceDent dent1 Distal" d="M5504 2693c645,626 1049,1524 1049,2521 0,995 -403,1892 -1047,2518l-1290 -1447c278,-264 453,-646 453,-1071 0,-427 -176,-810 -455,-1074l1290 -1447z"/>\
		  <path 	cod="'+ZONE_VESTIBULAR+'" class="faceDent dent1 Vestibular" d="M3299 1787c851,0 1625,344 2205,906l-1291 1448c-465,-405 -1156,-510 -1726,-89 -471,-463 -920,-920 -1374,-1377 578,-552 1345,-888 2186,-888z"/>\
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

    $("h4.panel-title .btn").on("click", function(){//evento para agregar cada procedimiento de cada grupo

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

    	$(".subGroup").unbind("click");//remover evento anterior si existe para las caras de los dientes
		//$(".contentOneDent").unbind("click");//remover evento anterior si existe para las caras de los dientes

    	var select_procedure = $(this).attr('id');//procedimiento seleccionado   	

    	if( select_procedure != null)
    		GetZoneProcedure( select_procedure );
    	
	});


}

function GetZoneProcedure( select_procedure ){
	//Busca en base de datos la zona en la que debe representarse el procedimiento, o si no la requiere

	$.ajax({
		beforeSend:function(){

		},
		type: "POST",
		url:"./core/getZoneProcedure.php",
		dataType:'json',
		data:{procedure:select_procedure},
		error: function(jqXHR,estado,error){
			
			console.log(jqXHR);			
			
		},

		complete: function(jqXHR,estado){
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result ) )
				EventSaveProcedure( select_procedure, result[0][0][ result[1][1] ] );

		},
		setTimeout:10000

	});
}

function CreateEventClickFaceDent(select_procedure=null, zone_procedure_default=null){

	this.select_procedure;
	this.zone_procedure_default;

	$(".contentOneDent .faceDent").unbind("click");//remover evento anterior si existe para las caras de los dientes
	$(".contentOneDent").unbind("click");

	if(select_procedure!== undefined && zone_procedure_default!== undefined){		
		this.select_procedure = select_procedure;
		this.zone_procedure_default = zone_procedure_default;
	}
	console.log(this.select_procedure+"...."+this.zone_procedure_default);

	$(".contentOneDent .faceDent").click(function(){

		EventSaveProcedure(this.select_procedure, this.zone_procedure_default);

	});

}


function EventSaveProcedure( select_procedure, zone_procedure_default ){
	//evento que se llama cuando se ha seleccionado un procedimiento

	var Zone_save_procedure; //lugar en el cual se ubicara el procedimiento
	var dent_select_procedure;

	$(".subGroup").on("click", ".contentOneDent .faceDent", function(){

		dent_select_procedure = $(this).parents('.contentOneDent').attr('cod');
		Zone_save_procedure = $(this).attr('cod');//en caso de no tener una zona por default, obtengo la cara clickeada

	});

    $(".subGroup").on("click", ".contentOneDent", function(){

    	dent_select_procedure = $(this).attr('cod');       
			
		if ( zone_procedure_default != null && 
			( 	zone_procedure_default == ZONE_NULA ||
				zone_procedure_default == ZONE_GENERAL ||
				zone_procedure_default == ZONE_TOP ||
				zone_procedure_default == ZONE_BOT )){//Reconocer si el procedimiento requiere un cara del diente en especifico
			
			Zone_save_procedure = zone_procedure_default;//si el procedimiento tiene una zona por default, reescribo la variable para asigar dicha zona 

			
		}

		if( dent_select_procedure !== undefined && Zone_save_procedure !== undefined )
			SaveProcedurePaciente( PACIENTE, dent_select_procedure, Zone_save_procedure, select_procedure);//TODO: verificar el uso del numero o codigo del diente		
		
	});		

	
}
function GenerateItemProcedureCode(Id, name, codigo, representacion){
//generar cada procedimiento

	var html = "<div class=' itemPainted '>\
				<figure class='figureAloneContent'>"+RetornarFigure("K000","alone")+"</figure>\
				<p id='"+Id+"' class='"+representacion+" itemProcedure btn' title='"+codigo+"'> "+name+" </p>\
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
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer(result,true) )		
				GetOdontograma();
				


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

	$('.procedureNullRepresentacion').html('');
	
	for (var i = valores.length - 1; i >= 0; i--) {

		var location = '';

		if( valores[i][ keys[3] ] == PROCEDURE_TIPE_DIAGNOSTICO ) //establesco si la representacion es un diagnostico, tratamiento
			location += " #diagnosticos ";
		else
			location += " #tratamientos ";

		if( valores[i][ keys[1] ] != ZONE_NULA ){ //establezco si posee una zona
			
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
			<figure class='figureItemProcedure'>\
				"+RetornarFigure("K000","alone")+"\
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

function getProcedureDent(Paciente, Dent, TipoProcedure){
	//Esta funcion busca en la base de datos los procedimientos que tenga un diente en especifico para mostrarlos al pasar el mouse

	$.ajax({
		beforeSend:function(){

		},
		type: "POST",
		url:"./core/getProcedureDent.php",
		dataType:'json',
		data:{paciente:Paciente, dent:Dent, tipoProcedure:TipoProcedure},
		error: function(jqXHR,estado,error){
			
			console.log(jqXHR);			
			
		},

		complete: function(jqXHR,estado){
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result ) )
				AddAlertProceduresDent( result );

		},
		setTimeout:10000

	});

}

function AddProceduresDent( Result ){
	//Esta funcion agrega la ventana de alerta que muestra los procedimientos que tenga un diente
	var htmlAlertProcedures = '\
								';
}
