<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$paciente = isset( $_POST['paciente'] ) ? $_POST['paciente'] : '';
	$dent = isset( $_POST['dent'] ) ? $_POST['dent'] : '';
	$zone = isset( $_POST['zone'] ) ? $_POST['zone'] : '';
	$diagnostico = isset( $_POST['diagnostico'] ) ? $_POST['diagnostico'] : '';
	$tipe = isset( $_POST['tipe'] ) ? $_POST['tipe'] : '';//especifica si es un diagnostico o tratamiento

	if( $paciente != '' && $dent != '' && $diagnostico != '' && $tipe != '' ){
		
		$date = '';

		$sql = "INSERT INTO pacienteprocedures(Fecha, Paciente, Diente, Zone, Diagnostico, Tipe) 
				VALUES('$date', '$paciente', '$dent', '$zone', '$diagnostico', '$tipe')";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>