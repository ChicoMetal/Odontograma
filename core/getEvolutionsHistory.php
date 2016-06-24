<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$historia = isset( $_POST['historia'] ) ? $_POST['historia'] : '';

	if( $historia!= '' ){

		$sql = "SELECT e.Descripcion, z.Nombre AS Zona, d.Numero AS Diente, i.Nombre AS Procedimiento, i.Codigo AS CUPS, DATE(e.Fecha) AS Fecha
				FROM evoluciones e, pacienteprocedures pp, dientes d, items i, zones z
				WHERE pp.Id = e.Tratamiento AND d.Id = pp.Diente AND pp.`Procedure` = i.Id AND pp.Zone = z.Id AND pp.Historia = '$historia' 
				UNION
				SELECT e.Descripcion, ' ' AS Zona, ' ' AS Diente, i.Nombre AS Procedimiento, i.Codigo AS CUPS, DATE(e.Fecha) AS Fecha
				FROM evoluciones e, pacienteprocedures pp, items i, zones z
				WHERE pp.Id = e.Tratamiento  AND pp.`Procedure` = i.Id AND pp.Zone = z.Id AND pp.Historia = '$historia' AND pp.Diente IS NULL";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}


?>