<?php
	/*obtiene los pacientes registrados en la BD*/

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$sql = "SELECT Id, CONCAT(Nombres, ' ', Apellidos) FROM medicos WHERE Estado = TRUE";

	$result = BuscarDatos( $sql );

	echo json_encode( $result );


?>