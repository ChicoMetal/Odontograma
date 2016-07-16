<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$sql = "SELECT c.Id, p.Id AS `Id Paciente`,  CONCAT(p.Nombres, ' ',p.Apellidos) AS Paciente, m.Id AS `Id Medico`, CONCAT(m.Nombres, ' ',m.Apellidos) AS Medico, c.Hora AS `Hora programada`
			FROM citas c, pacientes p, medicos m
			WHERE c.Paciente = p.Id AND c.Medico = m.Id AND c.Id NOT IN ( SELECT Cita FROM admisiones) AND Fecha = CURDATE() AND c.Estado = 1 ORDER BY c.Hora DESC";

	$result = BuscarDatos( $sql );

	echo json_encode( $result );

?>