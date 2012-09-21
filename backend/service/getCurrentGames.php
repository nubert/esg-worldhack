<?php

        require_once('../lib/db.php');

        $facebookUid = isset($_REQUEST['fbuid']) ? $_REQUEST['fbuid'] : '';

        if (!$facebookUid) {
                echo json_encode(array('success' => false, 'message' => 'missing facebook user id'));
                exit;
        }

        $query = "SELECT game_id, unix_timestamp(games.created_at) as unix_created_at, facebook_uid1, facebook_uid2, verb_multiple, letters, p1.first_name as friend1_name, p2.first_name AS friend2_name FROM games,verbs,players p1, players p2 WHERE p1.facebook_uid=games.facebook_uid1 AND p2.facebook_uid=games.facebook_uid2 AND games.verb_id=verbs.verb_id AND (starting_facebook_uid='" . $facebookUid . "' OR facebook_uid1='" . $facebookUid . "' OR facebook_uid2='" . $facebookUid . "')";
        $result = mysql_query($query, $dbConn);

	if ($result) {
		$games = array();
		while ($row = mysql_fetch_assoc($result)) {
			$game = array();
			$game['gameId'] = $row['game_id'];
			$game['friend1_id'] = $row['facebook_uid1'];
			$game['friend2_id'] = $row['facebook_uid2'];
			$game['friend1'] = $row['friend1_name'];
			$game['friend2'] = $row['friend2_name'];
			$game['verb'] = $row['verb_multiple'];
			$game['acronym'] = $row['letters'];
			$game['created_at'] = $row['unix_created_at'];
			//$games[] = $game;
			$subquery1 = "SELECT phrase_id, phrase FROM game_phrases WHERE game_id = '" . $row['game_id'] . "'";
			$subresult1 = mysql_query($subquery1, $dbConn);
			$entries = array();
			while ($subrow = mysql_fetch_assoc($subresult1)) {
				$entry = array('phraseId' => $subrow['phrase_id'],'phrase' => $subrow['phrase']);
    				$subquery2 = "SELECT COUNT(*) AS count FROM game_votes WHERE phrase_id = " . $subrow['phrase_id'];
    				$subresult2 = mysql_query($subquery2, $dbConn);
    				$subrow2 = mysql_fetch_assoc($subresult2);
    				$entry['votes'] = $subrow2['count'];
    				$entries[] = $entry;
			}
			$game['entries'] = $entries;
			$games[] = $game;
		}
		echo json_encode(array('success' => true, 'games' => $games));
	} else {
		echo json_encode(array('success' => false, 'query' => $query));
	}

