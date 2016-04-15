<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$paciente = isset( $_POST['paciente'] ) ? $_POST['paciente'] : '';

	if( $paciente != '' ){

		$sql = "SELECT d.Numero, pp.Zone, pp.Procedure, pp.Tipe, i.resource, i.Representacion
				FROM pacienteprocedures pp, items i, dientes d
				WHERE pp.Diente = d.Id AND pp.Procedure = i.Id AND pp.Paciente = $paciente";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}






?>