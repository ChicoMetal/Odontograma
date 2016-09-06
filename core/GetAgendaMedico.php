<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$medico 		= isset( $_POST['medico'] ) ? $_POST['medico'] : '';
	$fecha 			= isset( $_POST['fecha'] ) ? $_POST['fecha'] : '';

	if( $medico != '' && $fecha != '' ){

		$sql = "SELECT c.Id, c.Hora, c.FechaRegistro, c.Estado, CONCAT(p.Nombres, ' ',p.Apellidos) AS Paciente, CONCAT(p.Tipoid, '. ',p.Id) AS Identificacion
				FROM citas c, pacientes p, medicos m
				WHERE m.Id = c.Medico AND
					p.Id = c.Paciente AND
					c.Fecha = '$fecha' AND
					m.Id = '$medico'";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );

	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

//hora, identificacion paciente, nombre paciente, telefono
?>
