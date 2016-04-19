<?php 
	
	/*Buscar en la bd si el procedimiento necesita una zona en especifico del diente, es un procedimiento general o no tiene representacion*/


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");
	include_once($PATH."/functions.php");

	$procedure = isset( $_POST['procedure'] ) ? $_POST['procedure'] : '110';
	
	if( $procedure != '' ){
		
		$sql = "SELECT i.id, i.Zone
				FROM items i
				WHERE i.id = '$procedure' ";

		$result = BuscarDatos( $sql ) ;

		echo json_encode( $result );

	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}


?>