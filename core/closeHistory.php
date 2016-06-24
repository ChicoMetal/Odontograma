<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$historia 				= isset( $_POST['historia'] ) ? 	$_POST['historia'] : '';


	if( $historia != ''  ){

		$sql = "UPDATE historias SET Estado = FALSE WHERE Codigo = '$historia'";

		$result = InsertarDatos( $sql );

		echo json_encode( $result );
		
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>