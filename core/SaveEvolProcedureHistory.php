<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$diagnostico 				= isset( $_POST['diagnostico'] ) ? 	$_POST['diagnostico'] : '';
	$tratamiento 				= isset( $_POST['tratamiento'] ) ? 	$_POST['tratamiento'] : '';
	$descripcion 				= isset( $_POST['descripcion'] ) ? 	$_POST['descripcion'] : '';

	if( $diagnostico != '' && $tratamiento != '' && $descripcion != '' ){

		$sql = "INSERT INTO evoluciones(Diagnostico,Tratamiento, Descripcion)
				VALUES('$diagnostico', '$tratamiento', '$descripcion')";

		$result = InsertarDatos( $sql );

		echo json_encode( $result );
		
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>