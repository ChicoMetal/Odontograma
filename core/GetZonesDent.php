<?php 
	
	/*Busco en la bd el id de las zonas (las diferentes caras de los dientes) */


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");
	include_once($PATH."/functions.php");	
		
	$sql = "SELECT * FROM zones";

	$result = BuscarDatos( $sql ) ;

	echo json_encode( $result );

?>