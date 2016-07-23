<?php
	/* aqui obtengo el objeto con los diagnosticos de una historia y busco cuales de estos diagnosticos tienen evolucion para reemplazar el diagnostico por el tratamiento y que se muestre este tratamiento en lugar del diagnostico en el odontograma, en el area de evolucion*/

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$diagnosticos = isset( $_POST['diagnosticos'] ) ? $_POST['diagnosticos'] : '';
	
	if( $diagnosticos!= '' ){

		$TIP_PROCEDURE_TRATAMIENTOS = 2;

/*		foreach ($diagnosticos[0] as $key => $value) {//retiro los antiguos procedimientos que sean tratameintos
			
			if( $diagnosticos[0][ $key ][ $diagnosticos[1][3] ] == $TIP_PROCEDURE_TRATAMIENTOS )
				unset( $diagnosticos[0][ $key ] );
		}*/

		$valores = $diagnosticos[0];
		$keys = $diagnosticos[1];

		foreach ($valores as $key => $value) {//itero por cada objeto 
			
			
			$codigo = $value[ $keys[8] ];
			$sql = "SELECT Codigo, Tratamiento FROM evoluciones WHERE Diagnostico = '$codigo' AND Finish = TRUE LIMIT 1";

			$resultOne = BuscarDatos( $sql );

			if( $resultOne[0] != 'msm' ){

				$codTratamiento = $resultOne[0][0]-> $resultOne[1][1];

				$sql = "SELECT pp.Diente, pp.Zone, pp.Procedure, pp.Tipe, i.resource, i.Representacion, i.Codigo, i.Nombre, pp.Id
					FROM pacienteprocedures pp, items i
					WHERE  pp.Procedure = i.Id AND pp.Id = '$codTratamiento'";//busco los mismos datos, pero esta ves corresponde a los del tratamiento del diagnostico

				$result = BuscarDatos( $sql );

				if( $result[0] != 'msm' ){

					$diagnosticos[0][$key] = $result[0][0];//reemplazo el nuevo objeto con el tratamiento en la posicion donde se encontraba el diagnostico

				}

			}

		}

		echo json_encode( $diagnosticos );

	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

	

?>