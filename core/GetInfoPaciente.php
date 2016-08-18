<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$paciente 			= isset( $_POST['paciente'] ) ? $_POST['paciente'] : '';
	$cita 				= isset( $_POST['cita'] ) 	  ? $_POST['cita'] : '';
	$option 			= isset( $_POST['option'] )   ? $_POST['option'] : '';

	$TIPE_ANTECEDENTES_GENERALES = 1;
	$TIPE_ANTECEDENTES_ESTOMATOLOGICO = 2;
	$TIPE_ANTECEDENTES_HALLAZGOS = 3;

	if( $paciente != '' && $cita != '' ){
		
		if( $option == 1 ){//buscar informacion general del peciente

			$sql = "
					SELECT 
						CONCAT(p.Tipoid,' - ',p.Id) AS Identificacion,	
						p.Nombres,
						p.Apellidos,
						p.Edad,
						p.Sexo,
						CONCAT(p.Telefono,' - ', p.Celular) AS Telefonos,
						p.Direccion,
						p.Ocupacion,
						p.EstadoCivil,
						p.Municipio,
						p.FechaNacimiento,
						p.Responsable,
						p.TelResponsable,
						tp.Nombre AS tipoPaciente,
						e.Nombre AS pacienteEps,
						i.Nombre AS pacienteIps,
						mc.Motivo AS motivoSimple,
						mc.MotivoAmpliado,
						pa.Observacion AS antecedenteFamiliar
					FROM pacientes p, tipopacientes tp, eps e, ips i, motivosconsulta mc, pacienteantecedentes pa
					WHERE p.TipPaciente = tp.Id AND
							p.Ips = i.Id AND
							p.Eps = e.Id AND
							mc.Cita = '$cita' AND
							pa.Antecedente = 1 AND
							pa.Paciente = p.Id AND
							p.Id = '$paciente'
							LIMIT 1";

		
			$result = BuscarDatos( $sql );

			echo json_encode( $result );

		}else if( $option == 2 ){//buscar informacion de la historia

			$sql = "SELECT MIN(h.FechaApertura) FROM historias h WHERE h.Paciente = '$paciente' GROUP BY h.Paciente ";

			$result = BuscarDatos( $sql );

			echo json_encode( $result );
		
		}else if( $option == 3 ){//buscar los antecedentes generales

			$sql = "SELECT pa.Id, a.Grupo, a.Codigo, a.Antecedente, pa.Observacion
					FROM pacienteantecedentes pa, antecedentes a
					WHERE a.Id = pa.Antecedente AND
							a.Grupo = '$TIPE_ANTECEDENTES_GENERALES' AND
							pa.Paciente = '$paciente' AND 
							pa.Respuesta IS TRUE
					ORDER BY pa.id  DESC";

			$result = BuscarDatos( $sql );

			echo json_encode( $result );

		}else if( $option == 4 ){//buscar los antecedentes estomatologicos

			$sql = "SELECT pa.Id, a.Grupo, a.Codigo, a.Antecedente, pa.Observacion
					FROM pacienteantecedentes pa, antecedentes a
					WHERE a.Id = pa.Antecedente AND
							a.Grupo = '$TIPE_ANTECEDENTES_ESTOMATOLOGICO' AND
							pa.Paciente = '$paciente' AND 
							pa.Respuesta IS TRUE
					ORDER BY pa.id  DESC";

			$result = BuscarDatos( $sql );

			echo json_encode( $result );

		}else if( $option == 5 ){//buscar los antecedentes estomatologicos

			$sql = "SELECT pa.Id, a.Grupo, a.Codigo, a.Antecedente, pa.Observacion
					FROM pacienteantecedentes pa, antecedentes a
					WHERE a.Id = pa.Antecedente AND
							a.Grupo = '$TIPE_ANTECEDENTES_HALLAZGOS' AND
							pa.Paciente = '$paciente' AND 
							pa.Respuesta IS TRUE
					ORDER BY pa.id  DESC";

			$result = BuscarDatos( $sql );

			echo json_encode( $result );
		}else{
			echo json_encode( $GLOBALS['resB4'] );
		}

	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>