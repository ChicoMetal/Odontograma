<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$historia 			= isset( $_POST['historia'] ) ? $_POST['historia'] : '';
	$dent 				= isset( $_POST['dent'] ) ? 	$_POST['dent'] : '';
	$tipe 				= isset( $_POST['tipe'] ) ? 	$_POST['tipe'] : '';

	if( $historia != '' && $dent != '' && $tipe != '' ){

		$sql = "SELECT pp.id, i.Codigo, i.Nombre AS nombreItem, z.Nombre AS nombreZona
				FROM pacienteprocedures pp, items i, dientes d, zones z
				WHERE pp.Diente = d.Id  AND pp.Procedure = i.Id AND pp.Zone = z.Id 
										AND pp.Historia = '$historia' 
										AND pp.Diente = '$dent' 
										AND pp.Tipe = '$tipe' ";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}






?>