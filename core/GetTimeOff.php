<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");


	$medico 	= isset( $_POST['DrCita'] ) ? 			$_POST['DrCita'] : '';
	$fecha 		= isset( $_POST['dateCita'] ) ? 		$_POST['dateCita'] : '';
	

	if( $fecha != '' && $medico != ''  ){

		$sql = "SELECT Id, Hora FROM citas WHERE medico='$medico' AND Fecha = '$fecha' AND Estado != 0";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
				
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>