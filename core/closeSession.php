<?php

	if( 
		isset( $_COOKIE['userOdonto'] ) &&
		isset( $_COOKIE['userid'] ) &&
		isset( $_COOKIE['tipeUser'] ) &&
		isset( $_COOKIE['tokenOdonto'] )
	){

		include_once("./conexion.php");
		
		$sql = " UPDATE logs SET estado = false where usuario ='".base64_decode( $_COOKIE['userOdonto'] )."' AND token='{$_COOKIE['tokenOdonto']}'";


		$resultado = insertarDatos( $sql );

		if( $resultado == $GLOBALS['resA4'] ){

			$time = time() - (60 * 60 * 5);

			setCookie('userOdonto', '', $time );
			setCookie('userid', '', $time );
			setCookie('tipeUser', '', $time );
			setCookie('tokenOdonto', '', $time );

			echo json_encode( $GLOBALS['resB3'] );// session cerrada
			
			
		}else{
			echo json_encode( $resultado );
		}	
		
	}else{
		echo json_encode( $GLOBALS['resB2'] );// session vencida
	}													


?>