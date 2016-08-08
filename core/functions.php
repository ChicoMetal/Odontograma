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

	function ReplaceCharacter($cadena){

		$no_permitidas= array ("á","é","í","ó","ú","Á","É","Í","Ó","Ú","ñ","À","Ã","Ì","Ò","Ù","Ã™","Ã ","Ã¨","Ã¬","Ã²","Ã¹","ç","Ç","Ã¢","ê","Ã®","Ã´","Ã»","Ã‚","ÃŠ","ÃŽ","Ã”","Ã›","ü","Ã¶","Ã–","Ã¯","Ã¤","«","Ò","Ã","Ã„","Ã‹");
		
		$permitidas= array ("a","e","i","o","u","A","E","I","O","U","n","N","A","E","I","O","U","a","e","i","o","u","c","C","a","e","i","o","u","A","E","I","O","U","u","o","O","i","a","e","U","I","A","E");
		
		$texto = str_replace($no_permitidas, $permitidas ,$cadena);
		
		$texto = str_replace(" ", "_" ,$texto);
		
		return $texto;

	}

	
	function fechaHora(){
		return date("Y")."-".date("m")."-".date("d")."~".date("G")."-".date("H")."-".date("s");
	}
?>