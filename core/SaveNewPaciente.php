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

	echo json_encode( $result );
	



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