<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$cita 		= isset( $_POST['cita'] ) 		? $_POST['cita'] : '';
	$paciente 	= isset( $_POST['paciente'] ) 	? $_POST['paciente'] : '';
	$medico 	= isset( $_POST['medico'] ) 	? 	$_POST['medico'] : '';

	$motivoSimple 	= isset( $_POST['motivoSimple'] ) 	? 	$_POST['motivoSimple'] : '';
	$motivoExtend 	= isset( $_POST['motivoExtend'] ) 	? 	$_POST['motivoExtend'] : '';

	if( $paciente != ''  && $medico != '' && $cita != '' && $motivoSimple != '' && $motivoExtend != '' ){
		
		$TIP_PROCEDURE_DIAGNOSTICOS = 1;

		$sqlMotivo = "INSERT INTO motivosconsulta(Motivo, MotivoAmpliado, Cita)
					  VALUES('$motivoSimple', '$motivoExtend', '$cita')";

		$resultMotivo = InsertarDatos( $sqlMotivo );//guardar el motivo de la consulta

		if( $resultMotivo[0] == 'msm' && $resultMotivo == $GLOBALS['resA4']  ){//si se guardaron los datos de motivos de la consulta

			$sql = " SELECT Codigo, Paciente FROM historias WHERE Paciente = '$paciente' ORDER BY Codigo DESC LIMIT 1";

			$oldHistory = BuscarDatos( $sql );//consulto si hay historias de este paciente

			if( $oldHistory[0] == 'msm' && $oldHistory == $GLOBALS['resA3'] ){//si no hay historias
				
				$sql = " INSERT INTO historias(Paciente, Medico) VALUES('$paciente', '$medico')";

				$result = InsertarDatos( $sql );//guardo una historia

				if( $result[0] == 'msm' && $result == $GLOBALS['resA4'] ){
					//Se guardo exitosamente
					echo json_encode( $GLOBALS['resB3'] ); 

					ChangeStatusCita( $cita );//cambio el estado de la cita

				}else{
					echo json_encode( $GLOBALS['resB2'] );
				}

			}else{

				$padreOld = $oldHistory[0][0]->$oldHistory[1][0];//id de la ultima historia

				$sql = " INSERT INTO historias(Paciente, Medico, Padre) VALUES('$paciente', '$medico', '$padreOld') ";

				$result = InsertarDatos( $sql );//inserto la nueva historia

				if( $result == $GLOBALS['resA4'] ){//se se guarda exitosamente

					$sql = " SELECT Codigo, Paciente FROM historias WHERE Paciente = '$paciente' ORDER BY Codigo DESC LIMIT 1";

					$newHistory = BuscarDatos( $sql );//obtengo el codigo de la nueva historia
					
					if( $newHistory[0] != 'msm' ){
					
						$padre = $newHistory[0][0]->$newHistory[1][0];//id de la ultima historia

						$sql = "SELECT Fecha, Diente, Zone, `Procedure`, Tipe, Cause FROM pacienteprocedures WHERE Historia = '$padreOld' 
							AND Id NOT IN (SELECT Diagnostico FROM evoluciones WHERE Finish = TRUE) 
							AND Id NOT IN (SELECT Tratamiento FROM evoluciones WHERE Finish = TRUE) ORDER BY Tipe";

						$oldProcedures = BuscarDatos( $sql );//busco todos los procedimientos de la historia

						if( $oldProcedures[0] != 'msm' ){//si trae resultados
							
							$valores = $oldProcedures[0];
							$keys = $oldProcedures[1];

							foreach ($valores as $key => $value) {
							//itero por cada procedimiento que tenga la historia
								$fecha 		= $value->$keys[0];
								$zone 		= $value->$keys[2];
								$procedure 	= $value->$keys[3];
								$tipe 		= $value->$keys[4];

								if( $value->$keys[1] == null && $value->$keys[5] == null){//en caso de q el diente sea nulo y la causa (diagnosticos generales) **********************************************

									$sqlPP = "INSERT INTO pacienteprocedures(Fecha, Historia, Zone, `Procedure`, Tipe)
											VALUES('$fecha', '$padre','$zone','$procedure','$tipe')";

								}else if( $value->$keys[1] == null ){//si solo el diente es nulo (procedimientos generales) ***************************************************************************
									
									$causeOld 		= $value->$keys[5];

									$sqlCause = "SELECT * FROM pacienteprocedures WHERE Id = '$causeOld' LIMIT 1";

									$resultCause = BuscarDatos( $sqlCause );
									if( $resultCause[0] != 'msm' ){

										$fechaCause 	= $resultCause[0][0] -> $resultCause[1][1];
										$zoneCause 		= $resultCause[0][0] -> $resultCause[1][4];
										$procedureCause = $resultCause[0][0] -> $resultCause[1][5];

										$sqlCauseNew = "SELECT Id, Fecha FROM  pacienteprocedures WHERE 
												Fecha='$fechaCause' AND Historia='$padre' AND Diente IS NULL 
												AND Zone='$zoneCause' AND `Procedure`= '$procedureCause' AND Tipe='$TIP_PROCEDURE_DIAGNOSTICOS'
												AND Cause IS NULL";

										$resultTratamientoNew = BuscarDatos( $sqlCauseNew );//busco el id de la causa (el diagnostico) pero el nuevo registro insertado correspondiente a la nueva historia 

										if( $resultTratamientoNew[0] != 'msm' ){

											$newCause = $resultTratamientoNew[0][0] -> $resultTratamientoNew[1][0];

											$sqlPP = "INSERT INTO pacienteprocedures(Fecha, Historia, Zone, `Procedure`, Tipe, Cause)
											VALUES('$fecha', '$padre','$zone','$procedure','$tipe', '$newCause')";

											
										}else{
											echo json_encode( $resultCause );
										}

									}else{
										echo json_encode( $resultCause );
									}
								
								}else if( $value->$keys[5] == null ){//si solo la causa es nula (diagnosticos)
									
									$diente 	= $value -> $keys[1];

									$sqlPP = "INSERT INTO pacienteprocedures(Fecha, Historia,Diente, Zone, `Procedure`, Tipe)
											VALUES('$fecha', '$padre','$diente','$zone','$procedure','$tipe')";

								}else{//en caso de q ninguno sea nulo *********************************************

									$diente 	= $value -> $keys[1];
									$cause 		= $value -> $keys[5];

									$sqlCause = "SELECT * FROM pacienteprocedures WHERE Id = '$cause' LIMIT 1";

									$resultCause = BuscarDatos( $sqlCause );

									if( $resultCause[0] != 'msm' ){

										$fechaCause 	= $resultCause[0][0] -> $resultCause[1][1];
										$zoneCause 		= $resultCause[0][0] -> $resultCause[1][4];
										$procedureCause = $resultCause[0][0] -> $resultCause[1][5];

										$sqlCauseNew = "SELECT Id, Fecha FROM  pacienteprocedures WHERE 
												Fecha='$fechaCause' AND Historia='$padre' AND Diente IS NOT NULL 
												AND Zone='$zoneCause' AND `Procedure`= '$procedureCause' AND Tipe='$TIP_PROCEDURE_DIAGNOSTICOS'
												AND Cause IS NULL";
												
										$resultTratamientoNew = BuscarDatos( $sqlCauseNew );

										if( $resultTratamientoNew[0] != 'msm' ){

											$newCause = $resultTratamientoNew[0][0] -> $resultTratamientoNew[1][0];

											$sqlPP = "INSERT INTO pacienteprocedures(Fecha, Historia,Diente, Zone, `Procedure`, Tipe, Cause)
											VALUES('$fecha', '$padre','$diente','$zone','$procedure','$tipe', '$newCause')";
											
										}else{
											echo json_encode( $resultCause );
										}

									}else{
										echo json_encode( $resultCause );
									}
									
								}
								
								$result = InsertarDatos( $sqlPP );//inserto cada procedimiento que exista (correspondiente a la iteracion)

								if ( $result != $GLOBALS['resA4'] ) {
									$sql = "DELETE * FROM pacienteprocedures WHERE Historia =='$padre'";
									InsertarDatos( $sql );

									DelNewHistoriPaciente( $padre );//elimino la historia creada

									exit(0);
									echo json_encode( $GLOBALS['resB2'] );
								}			
								
							}//fin bucle

							echo json_encode( $GLOBALS['resB3'] );//si todo sale bn

							ChangeStatusCita( $cita );//cambio el estado de la cita

						}else{
							echo json_encode( $GLOBALS['resA4'] ); 
						}

					}else{
						echo json_encode( $newHistory );
					}
					
					
				}else{
					echo json_encode( $GLOBALS['resB2'] );
				}


			}
		}else{
			echo json_encode( $resultMotivo );
		}


		
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}


	function ChangeStatusCita( $IdCita ){
	//cambia el estado de la cita a atendida
		$sql = " UPDATE citas SET Estado = 3 WHERE Id = '$IdCita'";

		InsertarDatos( $sql );
	}

	function DelNewHistoriPaciente( $IdHistory ){
	//cambia el estado de la cita a atendida
		$sql = " DELETE FROM historias WHERE Codigo = '$IdHistory' ";

		InsertarDatos( $sql );
	}

?>