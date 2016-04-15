<?php 
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");


	function GetFecha($time){
		
		$date = date("Y")."-".date("m")."-".( date("d") -1);

		if( $time === true )
			$date .= " ".date("G").":".date("H").":".date("s");
		
		return $date;
	}
?>