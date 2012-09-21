<?php 

	require_once('../lib/config.php');
	require_once('../lib/auth.php');
	
	$fbuid = $_REQUEST['fbuid'];
	$phraseId = isset($_REQUEST['entryId']) ? (int)$_REQUEST['entryId'] : null;

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
	$query2 = "INSERT INTO game_votes (facebook_uid, phrase_id) VALUES ('" . $fbuid . "', " . $phraseId . ")";
	$result2 = mysql_query($query2, $dbConn);
	
	if ($result2 !== true) {
		echo json_encode(array('success' => false, 'message' => 'vote failed', 'query' => $query2));
		exit;
	} else {
		// get all people involved in this game and send them a notification via the open grpah
		$nquery = "SELECT g.starting_facebook_uid as id0, g.facebook_uid1 as id1, g.facebook_uid2 as id2 FROM games g, game_phrases gp WHERE g.game_id=gp.game_id AND gp.phrase_id=" . $phraseId;
		$nresult = mysql_query($nquery, $dbConn);
		$ids = array();
		while ($row = mysql_fetch_assoc($nresult)) {
			$ids[] = $row['id0'];
			$ids[] = $row['id1'];
			$ids[] = $row['id2'];
		}
		if (!empty($ids)) {
			/*/ notification code
			require_once('../lib/facebook.php');
			try {
				notifyUsers($ids, 'vote');
			} catch (Exception $e) {
				// do nothing
			}*/
		}
		echo json_encode(array('success' => true, 'message' => 'Vote registered'));
	}
