<?php

	require_once('../lib/config.php');
	require_once('../lib/auth.php');
	
	$response = array('success' => true, 'message' => 'Getting game settings...');
	echo json_encode($response);