<?php 
	
	$arrayCookies = array(

		"userOdonto" => $_COOKIE['userOdonto'], 
		"userid" => $_COOKIE['userid'], 
		"tipeUser" => $_COOKIE['tipeUser'], 
		"tokenOdonto" => $_COOKIE['tokenOdonto'] 
	);

	echo json_encode( $arrayCookies );

?>