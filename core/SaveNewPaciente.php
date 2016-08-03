<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");


$IdPacienteForm			 = isset( $_POST["IdPacienteForm"] )		  ? $_POST["IdPacienteForm"]		  : '';
$TipeIdForm				 = isset( $_POST["TipeIdForm"] )			  ? $_POST["TipeIdForm"]			  : '';
$NamePacienteForm		 = isset( $_POST["NamePacienteForm"] )		  ? $_POST["NamePacienteForm"]		  : '';
$LastNamePacienteForm	 = isset( $_POST["LastNamePacienteForm"] )	  ? $_POST["LastNamePacienteForm"]	  : '';
$EdadForm				 = isset( $_POST["EdadForm"] )				  ? $_POST["EdadForm"]				  : '';
$SexoPacienteForm		 = isset( $_POST["SexoPacienteForm"] )		  ? $_POST["SexoPacienteForm"]		  : '';
$TelpacienteForm		 = isset( $_POST["TelpacienteForm"] )		  ? $_POST["TelpacienteForm"]		  : '';
$CelPacienteForm		 = isset( $_POST["CelPacienteForm"] )		  ? $_POST["CelPacienteForm"]		  : '';
$OcupacionPacienteForm	 = isset( $_POST["OcupacionPacienteForm"] )	  ? $_POST["OcupacionPacienteForm"]	  : '';
$CivilPacienteForm		 = isset( $_POST["CivilPacienteForm"] )		  ? $_POST["CivilPacienteForm"]		  : '';
$MunicipioPacienteForm	 = isset( $_POST["MunicipioPacienteForm"] )	  ? $_POST["MunicipioPacienteForm"]	  : '';
$AdressPacienteForm		 = isset( $_POST["AdressPacienteForm"] )	  ? $_POST["AdressPacienteForm"]	  : '';
$NacimientoPacienteForm	 = isset( $_POST["NacimientoPacienteForm"] )  ? $_POST["NacimientoPacienteForm"]  : '';
$ResponsablePacienteForm = isset( $_POST["ResponsablePacienteForm"]	) ? $_POST["ResponsablePacienteForm"] : '';
$TelResponsablePteForm	 = isset( $_POST["TelResponsablePteForm"] )	  ? $_POST["TelResponsablePteForm"]	  : '';
$TipPacienteForm		 = isset( $_POST["TipPacienteForm"] )		  ? $_POST["TipPacienteForm"]		  : '';
$IpsPacienteForm		 = isset( $_POST["IpsPacienteForm"] )		  ? $_POST["IpsPacienteForm"]		  : '';
$EpsPacienteForm		 = isset( $_POST["EpsPacienteForm"] )		  ? $_POST["EpsPacienteForm"]		  : '';

if( 
	$IdPacienteForm
	&& $TipeIdForm != ''
	&& $NamePacienteForm != ''
	&& $LastNamePacienteForm != ''
	&& $EdadForm != ''
	&& $SexoPacienteForm != ''
	&& $CelPacienteForm != ''
	&& $CivilPacienteForm != ''
	&& $MunicipioPacienteForm != ''
	&& $AdressPacienteForm != ''
	&& $NacimientoPacienteForm != ''
	&& $TipPacienteForm != ''
	&& $IpsPacienteForm != ''
	&& $EpsPacienteForm != '' 
){

	$sql = "INSERT INTO 
			pacientes(Id,Tipoid,Nombres,Apellidos,Edad,Sexo,Telefono,Celular,Direccion,Ocupacion,EstadoCivil,Municipio,FechaNacimiento,Responsable,TelResponsable,TipPaciente,Ips,Eps) 
		VALUES('$IdPacienteForm','$TipeIdForm','$NamePacienteForm','$LastNamePacienteForm','$EdadForm','$SexoPacienteForm','$TelpacienteForm','$CelPacienteForm','$AdressPacienteForm','$OcupacionPacienteForm','$CivilPacienteForm','$MunicipioPacienteForm','$NacimientoPacienteForm','$ResponsablePacienteForm','$TelResponsablePteForm','$TipPacienteForm','$IpsPacienteForm','$EpsPacienteForm')";


	$result = InsertarDatos( $sql );


	if( $result == $GLOBALS['resA4'] ){//si se guardaron los datos

		$sql = "SELECT * FROM antecedentes";

		$antecedentes = BuscarDatos( $sql );

		$codAntecedentes = new stdClass();//nuevo json

		if( $antecedentes[0] != 'msm' ){//si obtengo resultados de los items de antecedentes

			$valores = $antecedentes[0];
			$keys = $antecedentes[1];

			foreach ($valores as $key => $value) {//itero por cada item
				$clave = $value->$keys['1'];
				$codAntecedentes->$clave = $value->$keys['0'];//asigno al json como clave el codigo del antecedente y como valor el id
			}

			//Guardo cada item de antecdentes del paciente
			$AntecedenteFamiliar = isset( $_POST["AntecedenteFamiliar"] ) ? $_POST["AntecedenteFamiliar"] : ''; 
			$valorFamiliar = ( $AntecedenteFamiliar == '' ) ? 0 : 1; 
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A1', $valorFamiliar, '$AntecedenteFamiliar')";


			$result = InsertarDatos( $sql );

			$alergias = $_POST["alergias"];
			$txtAlergias = isset($_POST["txtAlergias"]) ? $_POST["txtAlergias"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A2', $alergias, '$txtAlergias')";
			InsertarDatos( $sql );

			$discrasias = $_POST["discrasias"];
			$txtDiscrasias = isset($_POST["txtDiscrasias"]) ? $_POST["txtDiscrasias"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A3', $discrasias, '$txtDiscrasias')";
			InsertarDatos( $sql );

			$cardiopatias = $_POST["cardiopatias"];
			$txtCardiopatias = isset($_POST["txtCardiopatias"]) ? $_POST["txtCardiopatias"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A4', $cardiopatias, '$txtCardiopatias')";
			InsertarDatos( $sql );

			$embarazo = $_POST["embarazo"];
			$txtEmbarazo = isset($_POST["txtEmbarazo"]) ? $_POST["txtEmbarazo"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A5', $embarazo, '$txtEmbarazo')";
			InsertarDatos( $sql );

			$presionArterial = $_POST["presionArterial"];
			$txtPresionarterial = isset($_POST["txtPresionarterial"]) ? $_POST["txtPresionarterial"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A6', $presionArterial, '$txtPresionarterial')";
			InsertarDatos( $sql );

			$tomaMedicamentos = $_POST["tomaMedicamentos"];
			$txtTomamedicamentos = isset($_POST["txtTomamedicamentos"]) ? $_POST["txtTomamedicamentos"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A7', $tomaMedicamentos, '$txtTomamedicamentos')";
			InsertarDatos( $sql );

			$tratamientoActual = $_POST["tratamientoActual"];
			$txtTratamientoactual = isset($_POST["txtTratamientoactual"]) ? $_POST["txtTratamientoactual"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A8', $tratamientoActual, '$txtTratamientoactual')";
			InsertarDatos( $sql );

			$hepatitis = $_POST["hepatitis"];
			$txtHepatitis = isset($_POST["txtHepatitis"]) ? $_POST["txtHepatitis"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A9', $hepatitis, '$txtHepatitis')";
			InsertarDatos( $sql );

			$diabetes = $_POST["diabetes"];
			$txtDiabetes = isset($_POST["txtDiabetes"]) ? $_POST["txtDiabetes"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A10', $diabetes, '$txtDiabetes')";
			InsertarDatos( $sql );

			$fiebreReumatica = $_POST["fiebreReumatica"];
			$txtFiebrereumatica = isset($_POST["txtFiebrereumatica"]) ? $_POST["txtFiebrereumatica"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A11', $fiebreReumatica, '$txtFiebrereumatica')";
			InsertarDatos( $sql );

			$sida = $_POST["sida"];
			$txtSida = isset($_POST["txtSida"]) ? $_POST["txtSida"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A12', $sida, '$txtSida')";
			InsertarDatos( $sql );

			$inmunosupresion = $_POST["inmunosupresion"];
			$txtInmunosupresion = isset($_POST["txtInmunosupresion"]) ? $_POST["txtInmunosupresion"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A13', $inmunosupresion, '$txtInmunosupresion')";
			InsertarDatos( $sql );

			$patologiasRenales = $_POST["patologiasRenales"];
			$txtPatologiasrenales = isset($_POST["txtPatologiasrenales"]) ? $_POST["txtPatologiasrenales"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A14', $patologiasRenales, '$txtPatologiasrenales')";
			InsertarDatos( $sql );

			$patologiasRespiratorias = $_POST["patologiasRespiratorias"];
			$txtPatologiasrespiratorias = isset($_POST["txtPatologiasrespiratorias"]) ? $_POST["txtPatologiasrespiratorias"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A15', $patologiasRespiratorias, '$txtPatologiasrespiratorias')";
			InsertarDatos( $sql );

			$trastornosGastricos = $_POST["trastornosGastricos"];
			$txtTrastornosgastricos = isset($_POST["txtTrastornosgastricos"]) ? $_POST["txtTrastornosgastricos"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A16', $trastornosGastricos, '$txtTrastornosgastricos')";
			InsertarDatos( $sql );

			$trastornosEmocionales = $_POST["trastornosEmocionales"];
			$txtTrastornosemocionales = isset($_POST["txtTrastornosemocionales"]) ? $_POST["txtTrastornosemocionales"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A17', $trastornosEmocionales, '$txtTrastornosemocionales')";
			InsertarDatos( $sql );

			$sinusitis = $_POST["sinusitis"];
			$txtSinusitis = isset($_POST["txtSinusitis"]) ? $_POST["txtSinusitis"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A18', $sinusitis, '$txtSinusitis')";
			InsertarDatos( $sql );

			$cirujias = $_POST["cirujias"];
			$txtCirujias = isset($_POST["txtCirujias"]) ? $_POST["txtCirujias"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A19', $cirujias, '$txtCirujias')";
			InsertarDatos( $sql );

			$exodoncias = $_POST["exodoncias"];
			$txtExodoncias = isset($_POST["txtExodoncias"]) ? $_POST["txtExodoncias"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A20', $exodoncias, '$txtExodoncias')";
			InsertarDatos( $sql );

			$enfermedadesOrales = $_POST["enfermedadesOrales"];
			$txtEnfermedadesorales = isset($_POST["txtEnfermedadesorales"]) ? $_POST["txtEnfermedadesorales"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A21', $enfermedadesOrales, '$txtEnfermedadesorales')";
			InsertarDatos( $sql );

			$aparatologiaOral = $_POST["aparatologiaOral"];
			$txtAparatologiaoral = isset($_POST["txtAparatologiaoral"]) ? $_POST["txtAparatologiaoral"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A22', $aparatologiaOral, '$txtAparatologiaoral')";
			InsertarDatos( $sql );



			
			$habitos = isset( $_POST["habitos"] ) ? $_POST["habitos"] : ''; 
			$valorHabitos = ( $habitos == '' ) ? 0 : 1; 
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A23', $valorHabitos, '$habitos')";
			InsertarDatos( $sql );



			$labioInferior = $_POST["labioInferior"];
			$txtLabioinferior = isset($_POST["txtLabioinferior"]) ? $_POST["txtLabioinferior"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A24', $labioInferior, '$txtLabioinferior')";
			InsertarDatos( $sql );

			$labioSuperior = $_POST["labioSuperior"];
			$txtLabiosuperior = isset($_POST["txtLabiosuperior"]) ? $_POST["txtLabiosuperior"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A25', $labioSuperior, '$txtLabiosuperior')";
			InsertarDatos( $sql );

			$comisuras = $_POST["comisuras"];
			$txtComisuras = isset($_POST["txtComisuras"]) ? $_POST["txtComisuras"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A26', $comisuras, '$txtComisuras')";
			InsertarDatos( $sql );

			$mucosaOral = $_POST["mucosaOral"];
			$txtMucosaoral = isset($_POST["txtMucosaoral"]) ? $_POST["txtMucosaoral"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A27', $mucosaOral, '$txtMucosaoral')";
			InsertarDatos( $sql );

			$surcosYugales = $_POST["surcosYugales"];
			$txtSurcosyugales = isset($_POST["txtSurcosyugales"]) ? $_POST["txtSurcosyugales"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A28', $surcosYugales, '$txtSurcosyugales')";
			InsertarDatos( $sql );

			$frenillos = $_POST["frenillos"];
			$txtFrenillos = isset($_POST["txtFrenillos"]) ? $_POST["txtFrenillos"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A29', $frenillos, '$txtFrenillos')";
			InsertarDatos( $sql );

			$orofaringe = $_POST["orofaringe"];
			$txtOrofaringe = isset($_POST["txtOrofaringe"]) ? $_POST["txtOrofaringe"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A30', $orofaringe, '$txtOrofaringe')";
			InsertarDatos( $sql );

			$paladar = $_POST["paladar"];
			$txtPaladar = isset($_POST["txtPaladar"]) ? $_POST["txtPaladar"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A31', $paladar, '$txtPaladar')";
			InsertarDatos( $sql );

			$glandulasSalivales = $_POST["glandulasSalivales"];
			$txtGlandulassalibales = isset($_POST["txtGlandulassalibales"]) ? $_POST["txtGlandulassalibales"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A32', $glandulasSalivales, '$txtGlandulassalibales')";
			InsertarDatos( $sql );

			$pisoBoca = $_POST["pisoBoca"];
			$txtPisoboca = isset($_POST["txtPisoboca"]) ? $_POST["txtPisoboca"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A33', $pisoBoca, '$txtPisoboca')";
			InsertarDatos( $sql );

			$dorsoLengua = $_POST["dorsoLengua"];
			$txtDorsolengua = isset($_POST["txtDorsolengua"]) ? $_POST["txtDorsolengua"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A34', $dorsoLengua, '$txtDorsolengua')";
			InsertarDatos( $sql );

			$vientreLengua = $_POST["vientreLengua"];
			$txtVientrelengua = isset($_POST["txtVientrelengua"]) ? $_POST["txtVientrelengua"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A35', $vientreLengua, '$txtVientrelengua')";
			InsertarDatos( $sql );

			$ruidos = $_POST["ruidos"];
			$txtRuidos = isset($_POST["txtRuidos"]) ? $_POST["txtRuidos"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A36', $ruidos, '$txtRuidos')";
			InsertarDatos( $sql );

			$desviacion = $_POST["desviacion"];
			$txtDesviacion = isset($_POST["txtDesviacion"]) ? $_POST["txtDesviacion"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A37', $desviacion, '$txtDesviacion')";
			InsertarDatos( $sql );

			$cambioVolumen = $_POST["cambioVolumen"];
			$txtCambiovolumen = isset($_POST["txtCambiovolumen"]) ? $_POST["txtCambiovolumen"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A38', $cambioVolumen, '$txtCambiovolumen')";
			InsertarDatos( $sql );

			$bloqueoMandibula = $_POST["bloqueoMandibula"];
			$txtBloqueomandibula = isset($_POST["txtBloqueomandibula"]) ? $_POST["txtBloqueomandibula"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A39', $bloqueoMandibula, '$txtBloqueomandibula')";
			InsertarDatos( $sql );

			$limitacionApertura = $_POST["limitacionApertura"];
			$txtLimitacionapertura = isset($_POST["txtLimitacionapertura"]) ? $_POST["txtLimitacionapertura"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A40', $limitacionApertura, '$txtLimitacionapertura')";
			InsertarDatos( $sql );

			$dolorArticular = $_POST["dolorArticular"];
			$txtDolorarticular = isset($_POST["txtDolorarticular"]) ? $_POST["txtDolorarticular"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A41', $dolorArticular, '$txtDolorarticular')";
			InsertarDatos( $sql );

			$dolorMuscular = $_POST["dolorMuscular"];
			$txtDolormuscular = isset($_POST["txtDolormuscular"]) ? $_POST["txtDolormuscular"] : '';
			$sql = "INSERT INTO pacienteantecedentes(Paciente, Antecedente, Respuesta, Observacion)
					VALUES('$IdPacienteForm', '$codAntecedentes->A42', $dolorMuscular, '$txtDolormuscular')";
			$resultEnd = InsertarDatos( $sql );

			echo json_encode(  $resultEnd );


		}else{
			echo json_encode( $GLOBALS['resA2'] );
		}



	}else{
		echo json_encode( $result );
	}


}else{
	echo json_encode( $GLOBALS['resB4'] );
}

	/*$paciente 			= isset( $_POST['pacienteCita'] ) ? 	$_POST['pacienteCita'] : '';
	$medico 				= isset( $_POST['DrCita'] ) ? 			$_POST['DrCita'] : '';
	$fecha 					= isset( $_POST['dateCita'] ) ? 		$_POST['dateCita'] : '';
	$hora 					= isset( $_POST['HoraCita'] ) ? 		$_POST['HoraCita'] : '';
	$usuario 				= isset( $_POST['usuario'] ) ? 			$_POST['usuario'] : '';
	

	if( $paciente != '' && $medico != '' && $fecha != '' && $hora != '' ){

	

		
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}*/

?>