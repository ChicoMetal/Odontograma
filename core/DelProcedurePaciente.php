<?php
	//Eliminar un procedimiento asignado a un paciente 
	//*************************************************
	//*************************************************

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$codProcedureSave 			= isset( $_POST['codigo'] ) ? $_POST['codigo'] : '';

	if( $codProcedureSave != '' ){

		$sql = "DELETE FROM pacienteprocedures WHERE Id = '$codProcedureSave' ";

		$result = InsertarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}






?>