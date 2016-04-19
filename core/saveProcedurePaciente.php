<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");
	include_once($PATH."/functions.php");

	$paciente = isset( $_POST['paciente'] ) ? $_POST['paciente'] : '1104';
	$dent = isset( $_POST['dent'] ) ? $_POST['dent'] : '14';
	$zone = isset( $_POST['zone'] ) ? $_POST['zone'] : '8';
	$procedure = isset( $_POST['procedure'] ) ? $_POST['procedure'] : '110';
	
	if( $paciente != '' && $dent != '' && $procedure != '' ){
		
		
		$sql = "SELECT ti.Id, ti.Nombre
				FROM items i, groupitemsdent gi, tipeitems ti
				WHERE i.GroupParent = gi.Id AND gi.Tipe = ti.Id AND i.Id = '$procedure' ";

		$tipeProcedure = BuscarDatos( $sql ) ;

		if( $tipeProcedure[0] != 'msm' ){//verifico un resuultado esperado 

			$tipe = $tipeProcedure[0][0]->$tipeProcedure[1][0];//diagnostico/tratamiento


			if( $zone != '' ){
				$sql = "INSERT INTO pacienteprocedures(Fecha, Paciente, Diente, Zone, `Procedure`, Tipe) 
						VALUES(NOW(), '$paciente', '$dent', '$zone', '$procedure', '$tipe')";				
			}else{
				$sql = "INSERT INTO pacienteprocedures(Fecha, Paciente, Diente, `Procedure`, Tipe) 
						VALUES(NOW(), '$paciente', '$dent', '$procedure', '$tipe')";	
			}

			$result = InsertarDatos( $sql );

			echo json_encode( $result );

		}else{

			echo json_encode( $tipeProcedure );
			
		}


	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>