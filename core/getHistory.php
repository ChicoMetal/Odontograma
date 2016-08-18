<?php
	/*OBTENER LA ULTIMA HISTORIA DEL PACIENTE*/
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$paciente 	= isset( $_POST['paciente'] ) ? $_POST['paciente'] : '';

	if( $paciente != ''   ){

		$sql = " SELECT Codigo, Paciente FROM historias WHERE Paciente = '$paciente' ORDER BY Codigo DESC LIMIT 1";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );

	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>