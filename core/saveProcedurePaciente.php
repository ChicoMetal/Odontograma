<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");
	include_once($PATH."/functions.php");

	$historia 	= isset( $_POST['historia'] ) ? $_POST['historia'] : '';
	$dent 		= isset( $_POST['dent'] ) ? $_POST['dent'] : '';
	$zone 		= isset( $_POST['zone'] ) ? $_POST['zone'] : '';
	$procedure 	= isset( $_POST['procedure'] ) ? $_POST['procedure'] : '';

	$TIP_PROCEDURE_DIAGNOSTICOS = 1;
	$TIP_PROCEDURE_TRATAMIENTOS = 2;

	if( $historia != ''  && $zone != '' && $procedure != '' ){
		
		
		$sql = "SELECT ti.Id, ti.Nombre
				FROM items i, groupitemsdent gi, tipeitems ti
				WHERE i.GroupParent = gi.Id AND gi.Tipe = ti.Id AND i.Id = '$procedure' ";

		$tipeProcedure = BuscarDatos( $sql ) ;

		if( $tipeProcedure[0] != 'msm' ){//verifico un resuultado esperado 

			$tipe = $tipeProcedure[0][0]->$tipeProcedure[1][0];//diagnostico/tratamiento
			
			if( $dent != ''){//verifico si es procedimiento que requiere especificar un diente
				
				if( $tipe == $TIP_PROCEDURE_TRATAMIENTOS){//si es un tratamiento busco el diagnostico correspondiente para relacionarlos
						
						$sql = "SELECT Id, Fecha FROM pacienteprocedures WHERE Historia='$historia'
																	AND Diente = '$dent'
																	AND Zone = '$zone'
																	AND Tipe = '$TIP_PROCEDURE_DIAGNOSTICOS' 
																	ORDER BY Fecha
																	LIMIT 1";

						$codDiagnostico = BuscarDatos( $sql ); 


						if( $codDiagnostico[0] != 'msm' ){
							
							$diagnostico = $codDiagnostico[0][0]->$codDiagnostico[1][0];

							$sql = "INSERT INTO pacienteprocedures(Historia, Diente, Zone, `Procedure`, Tipe, Cause) 
								VALUES('$historia', '$dent', '$zone', '$procedure', '$tipe', '$diagnostico')";

						}else{
							echo json_encode( $codDiagnostico );
							exit(0);
						}

				}else{

					$sql = "INSERT INTO pacienteprocedures(Historia, Diente, Zone, `Procedure`, Tipe) 
							VALUES('$historia', '$dent', '$zone', '$procedure', '$tipe')";
				}
										
			}else{//si el procedimiento requiere un diente, verifico que no este guardado un registro 
				//con los mismos valores 

				$sql = "SELECT Id, count(*) AS existe FROM pacienteprocedures WHERE 
											Historia='$historia' AND 
											Diente IS NULL AND
											Zone = '$zone' AND 
											`Procedure` = '$procedure' ";

				$temResult = BuscarDatos( $sql );

				if( $temResult[0] != 'msm' && $temResult[0][0]->$temResult[1]['1'] > 0 ){//verifico si no se ha insertado un registro igual anteriormente
					echo json_encode( $GLOBALS['resB2'] );
					exit(0);

				}else{	

					$sql = "INSERT INTO pacienteprocedures(Historia, Zone, `Procedure`, Tipe) 
							VALUES('$historia', '$zone', '$procedure', '$tipe')";				
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