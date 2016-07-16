<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");



	$cita 				= isset( $_POST['cita'] ) ? 		$_POST['cita'] : '';
	$codAdmision 		= isset( $_POST['codAdmision'] ) ? 	$_POST['codAdmision'] : '';
	$usuario 			= isset( $_POST['usuario'] ) ? 	$_POST['usuario'] : '';

	

	if( $cita != '' && $codAdmision != '' && $usuario != '' ){

		$sql = "INSERT INTO admisiones(Codigo,Cita, Usuario)
					VALUES('$codAdmision', '$cita', '$usuario')";

		$result = InsertarDatos( $sql );

		if( $result == $GLOBALS['resA4'] ){

			$sql = "UPDATE citas SET Estado = 2 WHERE Id = '$cita'";

			$result = InsertarDatos( $sql );
		}

		echo json_encode( $result );
		
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>