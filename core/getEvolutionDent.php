<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$historia 			= isset( $_POST['historia'] ) ? $_POST['historia'] : '1104';
	$dent 				= isset( $_POST['dent'] ) ? 	$_POST['dent'] : '21';

	$TIP_PROCEDURE_TRATAMIENTOS = 2;

	if( $historia != '' && $dent != '' ){
		
		$sql = "SELECT pp.id, i.Codigo, i.Nombre AS nombreItem, z.Id AS zoneId, z.Nombre AS nombreZona, pp.Tipe
				FROM pacienteprocedures pp, items i, dientes d, zones z
				WHERE  pp.Diente = d.Id  AND pp.`Procedure` = i.Id AND pp.Zone = z.Id 
										AND pp.Id NOT IN (SELECT Diagnostico FROM evoluciones)
										AND pp.Id NOT IN (SELECT Tratamiento FROM evoluciones)
										AND pp.Id IN ( SELECT Id FROM pacienteprocedures WHERE Historia = '$historia' AND Diente = '$dent') 
										AND (
											pp.Id IN ( SELECT Id FROM pacienteprocedures WHERE Tipe = '$TIP_PROCEDURE_TRATAMIENTOS' AND Cause IS NOT NULL )  
											OR pp.Id IN (SELECT Cause FROM pacienteprocedures WHERE Tipe = '$TIP_PROCEDURE_TRATAMIENTOS' AND Cause IS NOT NULL ) 
										 ) 						
				ORDER BY zoneId, pp.Tipe";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>