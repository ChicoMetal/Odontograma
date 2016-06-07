<?php
	/* busco todos los diagnosticos generales en la historia, para darle la opcion 
		al usuario de asignar el tratamiento correspondiente a cada uno */

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$historia = isset( $_POST['historia'] ) ? $_POST['historia'] : '';

	$TIP_PROCEDURE_DIAGNOSTICOS = 1;
	$TIP_PROCEDURE_TRATAMIENTOS = 2;
	$ZONE_NULLL = 11;

	if( $historia != '' ){

		$sql = "SELECT pp.Id, i.Codigo, i.Nombre
				FROM pacienteprocedures pp, items i
				WHERE pp.`Procedure` = i.Id 
						AND pp.Historia = '$TIP_PROCEDURE_TRATAMIENTOS'
						AND pp.Tipe = '$TIP_PROCEDURE_DIAGNOSTICOS'
						AND pp.Zone = '$ZONE_NULLL'
						AND pp.Id NOT IN ( SELECT pp.Cause FROM pacienteprocedures pp WHERE pp.Tipe = '$TIP_PROCEDURE_TRATAMIENTOS' )";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}






?>