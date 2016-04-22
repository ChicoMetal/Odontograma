<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$paciente 			= isset( $_POST['paciente'] ) ? $_POST['paciente'] : '1104';
	$dent 				= isset( $_POST['dent'] ) ? 	$_POST['dent'] : '21';
	$tipoProcedure 		= isset( $_POST['tipoProcedure'] ) ? 	$_POST['tipoProcedure'] : '1';

	if( $paciente != '' ){

		$sql = "SELECT pp.id, i.Codigo, i.Nombre, z.Nombre
				FROM pacienteprocedures pp, items i, dientes d, zones z
				WHERE pp.Diente = d.Id  AND pp.Procedure = i.Id AND pp.Zone = z.Id 
										AND pp.Paciente = '$paciente' 
										AND pp.Diente = '$dent' AND pp.Tipe = '$tipoProcedure' ";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}






?>