
//temporales variables
var PACIENTE = '1104';


/*$(".subGroup").on("DOMNodeInserted", function(){//evento q desencadena la vista de los procedimientos agregados en modo de tooltip
	
				
});*/

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

//Estas variables  globales deben coincidir con los codigos asignados en la base de atos
//****************************************
//****************************************
//zonas para mostrar en procedimiento
var ZONE_OCLUSAL = 1;//centro
var ZONE_VESTIBULAR = 2;//superior interior
var ZONE_PALATINA = 3;//inferior interior
var ZONE_MESIAL = 4;//izquierda
var ZONE_DISTAL = 5;//derecha
var ZONE_C_VESTIBULAR_I = 6;//inferior exterior
var ZONE_C_VESTIBULAR_S = 7;//superior exterior
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

//Diente simbolico para asignar procedimientos generales, que no se realizan en los dientes

$(document).ready(function(){

	//$('.itemPainted').css('background','red');
	$('.subGroup').on("click",'.contentAdsolute', function(e){
		
    	// Calculamos la posicion X,Y del raton
	    var pos = $(this).offset();
	    var posX = (e.pageX - pos.left);
	    var posY = (e.pageY - pos.top);
	    
	    // Mostramos un alert mostrando la posicion
	    // del raton tras hacer un click en la capa id="contenedor"
	    console.log("X: " + posX + "  Y: " + posY);
	});	

	$('.contentProcedures').on("click", "h4.panel-title .btn", function(){
	//evento para agregar cada procedimiento de cada grupo

    	var idGroup = $(this).parents(".panel").attr('id');

    	if( !$("#collapse"+idGroup).hasClass('in') )
    		$(".panel-collapse").removeClass('in');
 	
		GetProcedures( idGroup );

	});
	

	GetOdontograma();//mostrar el odontograma
	GetMenuProcedures( 1 );//traer los procedimientos 
	GetMenuProcedures( 2 );//traer los procedimientos 

	

	$(".subGroup").on("mouseenter", ".contentOneDent", function(){//evento de ocultar y mostrar popover
		
		var Dent = $(this).attr('cod');
		var Tipe = $(this).parents('.tab-pane').attr('id');
		if( Tipe == "diagnosticos" )
			Tipe = PROCEDURE_TIPE_DIAGNOSTICO
		else if( Tipe == "tratamientos" )		
			Tipe = PROCEDURE_TIPE_TRATAMIENTO
		else
			Tipe = null;

		getProcedureDent(this, PACIENTE, Dent, Tipe );
		
	});

	$(".subGroup").hover(function(e){//ocultar popover habiertos
		$(".contentOneDent").popover('hide');
	});

	$(".procedureNullRepresentacion").on("click", ".delProcedurePaciente", function(){//evento del boton eliminar procedimientos de un paciente
		var codigoProcedure = $(this).parents('.row').attr('cod');
		DelProcedurePaciente( codigoProcedure );
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
		
		if( HiddenAlert == true ){
			console.log( mensaje );
			return ValidateMsmResponse( key );
		}else
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
		<div class="contentAdsolute">\
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
		</div>\
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
				    collapse collapse-procedures' role='tabpanel'\
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
	var contenedor =  ".panel-group #"+parent+" .panel-collapse";

	$( contenedor ).html("");

	for (var i = valores.length - 1; i >= 0; i--) {
		 			
			GenerateItemProcedureCode( 
				valores[i][ keys[0] ], 
				valores[i][ keys[1] ], 
				valores[i][ keys[2] ], 
				valores[i][ keys[3] ],
				valores[i][ keys[4] ],
				contenedor
			) 
		

	}


    $(".panel-collapse p").on("click", function(){
    //evento para agregar cada procedimiento de cada grupo

    	$(".subGroup").unbind("click");//remover evento anterior si existe para las caras de los dientes
		//$(".contentOneDent").unbind("click");//remover evento anterior si existe para las caras de los dientes

    	var select_procedure = $(this).parent().attr('id');//procedimiento seleccionado   	}

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


function EventSaveProcedure( select_procedure, zone_procedure_default ){
	//evento que se llama cuando se ha seleccionado un procedimiento

	var Zone_save_procedure; //lugar en el cual se ubicara el procedimiento
	var dent_select_procedure;

	$(".subGroup").on("click", ".contentOneDent .faceDent", function(){

		dent_select_procedure = $(this).parents('.contentOneDent').attr('cod');
		Zone_save_procedure = $(this).attr('cod');//en caso de no tener una zona por default, obtengo la cara clickeada

	});

    $(".subGroup").on("click", ".contentOneDent", function(){//desencadena el evento al dar click a un diente
    	SendProcedurePacinete( $(this).attr('cod') );
	});	

	$('.subGroup').on('click',function(e){//desencadena el evento cuando le den click al contenedor de los dientes (para procedimientos generales)		
		if (e.target !== this)//verifico si el click se ejecuto en uno de los dientes o no
    		return;
    	else//si no se dio click en uno de los dientes, se ejecuta la siguiente instruccion
    		SendProcedurePacinete( );
	});

	function SendProcedurePacinete( Dent = undefined ){

		dent_select_procedure = Dent;       
	
		if ( zone_procedure_default != null && 
			( 	zone_procedure_default == ZONE_NULA ||
				zone_procedure_default == ZONE_GENERAL ||
				zone_procedure_default == ZONE_TOP ||
				zone_procedure_default == ZONE_BOT )){//Reconocer si el procedimiento requiere un cara del diente en especifico
			
			Zone_save_procedure = zone_procedure_default;//si el procedimiento tiene una zona por default, reescribo la variable para asigar dicha zona 

			if( zone_procedure_default == ZONE_NULA)
				dent_select_procedure = null;
			
		}

		if( dent_select_procedure !== undefined && Zone_save_procedure !== undefined )
			SaveProcedurePaciente( PACIENTE, dent_select_procedure, Zone_save_procedure, select_procedure);//TODO: verificar el uso del numero o codigo del diente		
		
	}

	
}
function GenerateItemProcedureCode(Id, name, codigo, representacion, recurso, contenedor){
//generar el html de  cada procedimiento para mostrarlo en las listas
	var Representar = RetornarFigure(codigo,"alone");

	var html = "<div id='"+Id+"' class=' itemPainted ' title='"+codigo+"'>\
					<figure class='figureAloneContent'></figure>\
					<p  class='"+representacion+" itemProcedure btn' > "+name+" </p>\
				</div>";

	$( contenedor ).append(html);//añadir los item de procedimientos cuando se despliegue su contenedor padre

	if( typeof(Representar) == 'function' )//preguntar si se incluye un codigo o se ejecuta una funcion
		Representar(Id,recurso);
	else 
		$(contenedor+' #'+Id+'.itemPainted figure').append( Representar );

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
	var JsonCss = {};

	$('.procedureNullRepresentacion').html('');
	
	for (var i = valores.length - 1; i >= 0; i--) {

		var location = '';
		if( valores[i][ keys[3] ] == PROCEDURE_TIPE_DIAGNOSTICO ) //establesco si la representacion es un diagnostico, tratamiento
			location += " #diagnosticos ";
		else
			location += " #tratamientos ";

		if( valores[i][ keys[1] ] != ZONE_NULA && valores[i][ keys[0] ] !== null ){ //establezco si posee una zona
			
			location += " figure[cod='"+valores[i][ keys[0] ]+"']"; //establezco el diente
			
			if( valores[i][ keys[1] ] == ZONE_BOT )
				location += " figcaption.footDent ";

			else if( valores[i][ keys[1] ] == ZONE_TOP )
				location += " .headDent ";

			else{
				if( valores[i][ keys[5] ] == REPRESENTACION_GRAFICO ){//si tiene una zona y es un grafico
					location += " .contentAdsolute ";
					JsonCss = RetornarCssJson( valores[i][ keys[1] ]  );
					
				}
			}

			if( valores[i][ keys[5] ] == REPRESENTACION_COLOR )//dependiendo el modo de representar el procedimiento llamo a la funcion respectiva		
					PaintColorZoneDent( valores[i][ keys[1] ], valores[i][ keys[4] ], location );

			else if( valores[i][ keys[5] ] == REPRESENTACION_GRAFICO ){
				
				

				var figureGenerate = $(GenerateFigureProcedure( valores[i][ keys[6] ]  ) )
									.css(JsonCss);

				JsonCss = {};

				$( location ).append( 
					figureGenerate
				);			
					
			}

		}else{

			location += " .procedureNullRepresentacion ";

			$( location ).append( 
				GenerateProcedureDienteNull( valores[i], keys )
			);

		}		



	}

}

function GenerateFigureProcedure( CodigoProcedure ){
//funcion para devolver la representacion grafica de los procedimientos


	function codeContent( codigo ){
		var Representacion = RetornarFigure(codigo,"alone");
		if( typeof(Representacion) == 'function'  )
			Representacion = '';

		var codeContent ="\
			<figure class='figureItemProcedure'>\
				"+Representacion+"\
			</figure>\
			";


		return codeContent;
		
	}


	//var content = "<polygon class='figurePaintPoints' points='216,51 42,374 399,376 '/>";

	return codeContent( CodigoProcedure );

}

function GenerateProcedureDienteNull( valores, keys ){
	//Aqui genero el html para mostrar procedimientos que no tengan asignados un diente especifico


	var htmlProcedures = '\
							<div cod="'+valores[ keys[8] ]+'" class="row">\
								<div class="col-md-2 ">'+valores[ keys[6] ]+'</div>\
								<div class="col-md-9 ">'+valores[ keys[7] ]+'</div>\
								<div class="col-md-1 ">\
									<button class="btn btn-primary delProcedurePaciente"> \
										<i class="fa fa-trash-o" aria-hidden="true"></i>\
									</button>\
								</div>\
							</div>\
							';

	return htmlProcedures;

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

function getProcedureDent(trigger, Paciente, Dent, Tipe){
	//Esta funcion busca en la base de datos los procedimientos que tenga un diente en especifico para mostrarlos al pasar el mouse

	$.ajax({
		beforeSend:function(){

		},
		type: "POST",
		url:"./core/getProceduresDent.php",
		dataType:'json',
		data:{paciente:Paciente, dent:Dent, tipe:Tipe},
		error: function(jqXHR,estado,error){
			
			console.log(jqXHR);			
			
		},

		complete: function(jqXHR,estado){
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result, true ) )
				AddProceduresDentPopover(trigger, result );

		},
		setTimeout:10000

	});

}

function AddProceduresDentPopover(trigger, result ){
	//Esta funcion agrega la ventana de alerta que muestra los procedimientos que tenga un diente

	var valores = result[0];
	var keys = result[1];

	var htmlAlertProcedures = '';

	for (var i = valores.length - 1; i >= 0; i--) {
		
		htmlAlertProcedures += '\
							<div cod="'+valores[i][ keys[0] ]+'" class="row">\
								<div class="col-md-1 ">'+valores[i][ keys[1] ]+'</div>\
								<div class="col-md-7 ">'+valores[i][ keys[2] ]+'</div>\
								<div class="col-md-3 ">'+valores[i][ keys[3] ]+'</div>\
								<div class="col-md-1 ">\
									<button class="btn btn-primary delProcedurePaciente"> \
										<i class="fa fa-trash-o" aria-hidden="true"></i>\
									</button>\
								</div>\
							</div>\
							';
	}

	var EstructuraPopover = {
		popover:true,		
		html:true,
		trigger:'focus',
		placement:"right auto",
		title:"Procedimientos",
		content: htmlAlertProcedures,
		template:'	<div class="popover" role="tooltip">\
						<div class="arrow">\
							</div><h3 class="popover-title"></h3>\
								<div class="popover-content"></div>\
							</div>'

	};//propiedades del popover 

	$(trigger).popover(EstructuraPopover);
	$(".contentOneDent").popover('hide');
	$(trigger).popover('toggle');

	$('.delProcedurePaciente').on('click', function(){//evento del boton eliminar procedimientos de un paciente
		var codigoProcedure = $(this).parents('.row').attr('cod');
		DelProcedurePaciente( codigoProcedure );
	});
}

function DelProcedurePaciente( Codigo ){
	//Esta funcion manda la peticion para eliminar un procedimiento de un paciente

	$.ajax({
		beforeSend:function(){

		},
		type: "POST",
		url:"./core/DelProcedurePaciente.php",
		dataType:'json',
		data:{codigo:Codigo},
		error: function(jqXHR,estado,error){
			
			console.log(jqXHR);			
			
		},

		complete: function(jqXHR,estado){
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result, true ) )
				GetOdontograma();

		},
		setTimeout:10000

	});

}