$(document).ready(function(){

	getIps();//mostrar ips en el select
	getEps();//mostrar eps en el select
	getTipePacientes();//mostrar tipos de pacientes en el select


	$('#formPaciente').validate({//validacion del formulario		
	    rules :{
		    IdPacienteForm : {
			  required : true,
			  number: true
			},
			NamePacienteForm : {
			  required : true
			},
			LastNamePacienteForm : {
			  required : true
			},
			EdadForm : {
			  required : true,
			  number: true
			},
			TelpacienteForm :{
				number: true
			},
			CelPacienteForm : {
			  required : true,
			  number: true
			},
			MunicipioPacienteForm : {
			  required : true
			},
			NacimientoPacienteForm : {
			  required : true
			},
			TelResponsablePteForm: {
				number: true
			}
	    },
	    messages : {
			IdPacienteForm:{
			  required: "Campo requerido",
			  number: "Solo valores numericos"
			},
			NamePacienteForm:{
			  required : "Campo requerido"
			},
			LastNamePacienteForm:{
			  required : "Campo requerido"
			},
			EdadForm:{
			  required : "Campo requerido",
			  number: "Solo valores numericos"
			},
			TelpacienteForm : {
				number: "Solo valores numericos"
			},
			CelPacienteForm : {
			  required : "Campo requerido",
			  number: "Solo valores numericos"
			},
			MunicipioPacienteForm:{
			  required : "Campo requerido"
			},
			NacimientoPacienteForm:{
			  required : "Campo requerido"
			},
			TelResponsablePteForm : {
				number: "Solo valores numericos"
			}
	    },
	    submitHandler: function(form){
    		
    		var selects = ValidateSelect( $(form).attr("id") ); //obtengo select del formulario
   			
   			if ( selects != 0 ){
   				bootbox.alert("El campo ( "+selects+" ) es invalido - Informacion general" );
   			}else{
   				ValidateRadios(form);//validar radio buttons y guardar
   			}
    		
       	},

		invalidHandler:function(form){	
		} 

    });	



    $('.optionYes').change( function(){ //activar campo descripcion
    	
    	var elemento = $(this).parent().siblings('.contentDes').find('input');

    	$(elemento).prop('disabled', false);

    });

    $('.optionNot').change( function(){ //desactivar campo descripcion
    	
    	var elemento = $(this).parent().siblings('.contentDes').find('input');
    	$(elemento).val('');
    	$(elemento).prop('disabled', true);

    });

    $('form .clean').click( function(){//boton limpiar
 		Limpiar('form')
    	ResetSelects(this);
    	$('.option .contentDes input').prop('disabled', true);
    });

	
});

function getIps(){ 
//busca las ips existentes en la BD para agregarlas al SELECT del DOM

  $.ajax({
	beforeSend:function(){

	},
	url:"./core/getIps.php",
	type:"POST",
	success: function( res){
							
	},
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, false ) )
			AddOptions(result,".IpsPacienteForm");							
			
	},
	setTimeout:10000
  });
}

function getEps(){ 
//busca las eps existentes en la BD para agregarlas al SELECT del DOM

  $.ajax({
	beforeSend:function(){

	},
	url:"./core/getEps.php",
	type:"POST",
	success: function( res){
							
	},
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, false ) )
			AddOptions(result,".EpsPacienteForm");							
			
	},
	setTimeout:10000
  });
}

function getTipePacientes(){ 
//busca los tipos de pacientes existentes en la BD para agregarlas al SELECT del DOM

  $.ajax({
	beforeSend:function(){

	},
	url:"./core/getTipePacientes.php",
	type:"POST",
	success: function( res){
							
	},
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, false ) )
			AddOptions(result,".TipPacienteForm");							
			
	},
	setTimeout:10000
  });
}


function ValidateRadios(Form){
//validar radiobuttons
	
	var result = true;

 	$(".option").each(function(index){ 
	
		//var name = $(this).find('input').attr('name');
		var name = $(this).find('.optionYes').attr('name');
		var antecedente =  $(this).find('.nameAntecedente').html();
		var group = $(this).parents('.groupForm').attr('data-mensaje');

        if ( !$('input[name="'+name+'"]').is(':checked') ) {
        	
	        bootbox.alert('Seleccionar una opcion ( '+antecedente+' ) - '+group);
	        result = false;
	        return false;

	    }else{

	    	var radioSelect = $('input:radio[name='+name+']:checked').attr('class');//obtengo la opcion seleccionada

	    	var descripcion = $(this).find('.contentDes input').val();//obtengo el valor del campo descripcion

	    	if( radioSelect == 'optionYes' ){//si la opcion positiva esta seleccionada, valido el campo descripcion

	    		if( !descripcion != '' ){//valido si el campo esta vacio

	    			bootbox.alert('Debe ingresar una descripcion en la opcion ( '+antecedente+' ) - '+group);
	    			result = false;
	    			return false;
	    		}

	    	}


	    }
	    
    });

    if( result ){
    	SaveNewPaciente(Form);
    }


}

function SaveNewPaciente(Form){
//guardar datos del paciente
	$.ajax({
		beforeSend:function(){

		},
		url:"./core/SaveNewPaciente.php",
		method:"POST",
		data: $(Form).serialize(),
		success: function( res){
								
		},
		error: function(jqXHR,estado,error){
			console.log(jqXHR);
		},
		complete: function(jqXHR,estado){		
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result, false ) ){
				//Limpiar(Form);
				console.log(result );
			}

		},
		setTimeout:10000
	});
}
