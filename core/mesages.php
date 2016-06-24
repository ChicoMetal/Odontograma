<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once


	$resA1 = ["msm","0000"]; /* error al conectar  */
	$resA2 = ["msm","0001"]; /* error al ejecutar el query */
	$resA3 = ["msm","0010"]; /* No existen datos*/
	$resA4 = ["msm","1000"]; /* Query ejecutado correctamente */
	$resA5 = ["msm","0100"]; /* error al seleccionar la tabla*/
	$resB2 = ["msm","0011"]; /* Error en la instruccion*/
	$resB3 = ["msm","1100"]; /* Instruccion ejecutada correctamente*/
	$resB4 = ["msm","1101"]; /* Peticion indeterminada */
	$resC4 = ["msm","1001"]; /* Ya hay una cita pendiente */

	
?>
