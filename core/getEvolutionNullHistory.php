<?php
	/* busca en la base de datos los diagnosticos con tratamientos generales para poder hacer la evolucion*/

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$historia 			= isset( $_POST['historia'] ) ? $_POST['historia'] : '';
	

	$TIP_PROCEDURE_TRATAMIENTOS = 2;

	if( $historia != '' ){
		
		$sql = "SELECT pp.id, i.Codigo, i.Nombre AS nombreItem, pp.Cause, pp.Tipe
				FROM pacienteprocedures pp, items i, zones z
				WHERE pp.`Procedure` = i.Id AND pp.Zone = z.Id AND pp.Historia = '$historia' 
						AND pp.Id NOT IN (SELECT Diagnostico FROM evoluciones)
						AND pp.Id NOT IN (SELECT Tratamiento FROM evoluciones)
						AND pp.Id IN ( SELECT Id FROM pacienteprocedures WHERE Historia = '$historia' AND Diente IS NULL) 
						AND (
							pp.Id IN ( SELECT Id FROM pacienteprocedures WHERE Tipe = '$TIP_PROCEDURE_TRATAMIENTOS' AND Cause IS NOT NULL )  
							OR pp.Id IN (SELECT Cause FROM pacienteprocedures WHERE Tipe = '$TIP_PROCEDURE_TRATAMIENTOS' AND Cause IS NOT NULL ) 
						 )
				ORDER BY pp.Tipe";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>