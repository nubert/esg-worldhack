<?php

	if (!isset($_POST['fbuid'])) {
		$response = array('success' => false, 'message' => 'You need to pass the FB UID');
		echo json_encode($response);
		exit;
	}
	
	// TODO: check for a private key secret thingie to make sure it's coming from a valid source.
