<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$origin = isset( $_POST['origin'] ) ? $_POST['origin'] : '';

	if( $origin != '' ){

		$sql = "SELECT g.Id, g.Nombre
				FROM groupitemsdent g
				WHERE g.Tipe = $origin 
				ORDER BY g.Id DESC";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}






?>