<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");
	include_once($PATH."/functions.php");
	

	if( 
		isset( $_COOKIE['userOdonto'] ) &&
		isset( $_COOKIE['userid'] ) &&
		isset( $_COOKIE['tipeUser'] ) &&
		isset( $_COOKIE['tokenOdonto'] )
	){

		if( ValidarToken() != 0 ){
			echo json_encode( $GLOBALS['resB3'] );
		}else{
			
			include_once("./CloseSession.php"); 
			
		}

	}else{
		echo json_encode( $GLOBALS['resB2']);
	}

?>