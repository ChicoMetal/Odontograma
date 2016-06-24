<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");



	$paciente 				= isset( $_POST['pacienteCita'] ) ? 	$_POST['pacienteCita'] : '';
	$medico 				= isset( $_POST['DrCita'] ) ? 			$_POST['DrCita'] : '';
	$fecha 					= isset( $_POST['dateCita'] ) ? 		$_POST['dateCita'] : '';
	$hora 					= isset( $_POST['HoraCita'] ) ? 		$_POST['HoraCita'] : '';
	$usuario 				= isset( $_POST['usuario'] ) ? 			$_POST['usuario'] : '';
	

	if( $paciente != '' && $medico != '' && $fecha != '' && $hora != '' ){

		$sql = "SELECT Id, Paciente FROM citas WHERE Medico='$medico' AND Fecha='$fecha' AND Hora = '$hora'";

		$free =  BuscarDatos( $sql );

		if( $free[0] == 'msm' && $free == $GLOBALS['resA3']  ){

			$sql = "INSERT INTO citas(Paciente,Medico, Fecha, Hora, Usuario)
					VALUES('$paciente', '$medico', '$fecha', '$hora', '$usuario')";

			$result = InsertarDatos( $sql );

			echo json_encode( $result );

		}else{
			echo json_encode( $GLOBALS['resC4'] );
			exit(0);

		}

		
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>