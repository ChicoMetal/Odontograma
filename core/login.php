<?php
	

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");
	include_once($PATH."/functions.php");

	$user = isset( $_POST['user'] ) ? $_POST['user'] : '';
	$pass = isset( $_POST['pass'] ) ? $_POST['pass'] : '';

	if( $user != '' && $pass != ''){

		$sql = " SELECT count(*) as existencia, Id
				FROM usuarios 
				WHERE usuario = '$user'  AND password = '$pass' AND estado = true";

		$resultado = buscarDatos( $sql );

		if ( is_array( $resultado ) && $resultado[0] != 'msm' ){//si es un array

			$valores = $resultado[0][0];

			if(  $valores -> $resultado[1][0] > 0  ){//si esta en la tabla usuario
				
				
				Loguear($user, $pass, "usuarios");


			}else{//si no esta en la tabla usuarios se busca en la de medicos

				$sql = " SELECT count(*) as existencia, Id
				FROM medicos 
				WHERE usuario = '$user'  AND password = '$pass' AND estado = true";


				$resultado = buscarDatos( $sql );

				if ( is_array( $resultado ) && $resultado[0] != 'msm' ){//si es un array

					$valores = $resultado[0][0];

					if(  $valores -> $resultado[1][0] > 0  ){
												
						Loguear($user, $pass, "medicos");

					}else{
						
						$sql = "INSERT INTO logfails(Usuario, Password, Fecha) 
							VALUES ('$user','$pass', NOW() )";
							
						insertarDatos( $sql );

						echo json_encode( $GLOBALS['resA3'] );

					}


				}else{

					echo json_encode( $resultado );

				}
				
				

			}


		}else{

			echo json_encode( $resultado );

		}

	}else{
		echo json_encode( $GLOBALS['resB4'] );
	}


	function Loguear($user, $pass, $table){
		$token = md5( $user.fechaHora()."-".date('u') );

		$sql = " INSERT INTO logs( usuario, token, estado) 
				VALUES( '$user','$token', 1 )  ";				

		$respuesta = insertarDatos( $sql );
		
		if( $respuesta === $GLOBALS['resA4'] ){


			$sql = "SELECT id, Tipo FROM ".$table." WHERE usuario = '$user' AND estado = true";
			$resultado = buscarDatos( $sql );

			if( is_array( $resultado ) && $resultado[0] != 'msm' ){

				$valores = $resultado[0][0];
				$duracion = time() + (60 * 60 * 5);

				setcookie("userOdonto", base64_encode( $user ), $duracion );
				setcookie("userid", base64_encode(  $valores -> $resultado[1][0] ), $duracion );
				setcookie("tipeUser", base64_encode(  $valores -> $resultado[1][1] ), $duracion );
				setcookie("tokenOdonto", $token, $duracion );
				

				echo json_encode( $GLOBALS['resB3'] );

			}else{
				echo json_encode( $GLOBALS['resB2'] );
				
			}

		}else{
			
			echo $respuesta;

		}
	}


	
?>