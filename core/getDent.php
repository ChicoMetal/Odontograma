<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$sql = "SELECT d.Id, d.Numero, d.Nombre, p.Nombre AS class, p.Parent 
			FROM dientes d, posiciondents p
			WHERE d.Position = p.Id";

	$result = BuscarDatos( $sql );

	echo json_encode( $result );





?>