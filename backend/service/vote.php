<?php 

	require_once('../lib/config.php');
	require_once('../lib/auth.php');
	
	$fbuid = $_REQUEST['fbuid'];
	$phraseId = isset($_REQUEST['entryId']) ? $_REQUEST['entryId'] : null;

	if (!$phraseId) {
		echo json_encode(array('success' => false, 'message' => 'missing phrase id'));
		exit;
	}
	
	require_once('../lib/db.php');
	
	// check for valid phrase ID
	$query = "SELECT * FROM game_phrases WHERE phrase_id=" . $phraseId;
	$result = mysql_query($query, $dbConn);
	
	if (!$result || mysql_num_rows($result) != 1) {
		echo json_encode(array('success' => false, 'message' => 'phrase id doesnt exist'));
		exit;
	}
	
	// insert into the database!
	$query = "INSERT INTO game_votes ('facebook_uid', 'phrase_id') VALUES ('" . $fbuid . "', " . $phraseId . ")";
	$result = mysql_query($query, $dbConn);
	
	if ($result !== true) {
		echo json_encode(array('success' => false, 'message' => 'vote failed'));
		exit;
	} else {
		echo json_encode(array('success' => true, 'message' => 'Vote registered'));
	}