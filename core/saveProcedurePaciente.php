<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");
	include_once($PATH."/functions.php");

	$paciente = isset( $_POST['paciente'] ) ? $_POST['paciente'] : '';
	$dent = isset( $_POST['dent'] ) ? $_POST['dent'] : '';
	$zone = isset( $_POST['zone'] ) ? $_POST['zone'] : '';
	$procedure = isset( $_POST['procedure'] ) ? $_POST['procedure'] : '';
	
	if( $paciente != ''  && $zone != '' && $procedure != '' ){
		
		
		$sql = "SELECT ti.Id, ti.Nombre
				FROM items i, groupitemsdent gi, tipeitems ti
				WHERE i.GroupParent = gi.Id AND gi.Tipe = ti.Id AND i.Id = '$procedure' ";

		$tipeProcedure = BuscarDatos( $sql ) ;

		if( $tipeProcedure[0] != 'msm' ){//verifico un resuultado esperado 

			$tipe = $tipeProcedure[0][0]->$tipeProcedure[1][0];//diagnostico/tratamiento
			
			if( $dent != ''){
				
				$sql = "INSERT INTO pacienteprocedures(Paciente, Diente, Zone, `Procedure`, Tipe) 
						VALUES('$paciente', '$dent', '$zone', '$procedure', '$tipe')";				
			}else{

				$sql = "SELECT Id, count(*) AS existe FROM pacienteprocedures WHERE 
											Paciente='$paciente' AND 
											Diente IS NULL AND
											Zone = '$zone' AND 
											`Procedure` = '$procedure' ";

				$temResult = BuscarDatos( $sql );

				if( $temResult[0] != 'msm' && $temResult[0][0]->$temResult[1]['1'] > 0 ){//verifico si no se ha insertado un registro igual anteriormente
					echo json_encode( $GLOBALS['resB2'] );
					exit(0);

				}else{	

					$sql = "INSERT INTO pacienteprocedures(Paciente, Zone, `Procedure`, Tipe) 
							VALUES('$paciente', '$zone', '$procedure', '$tipe')";				
				}

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