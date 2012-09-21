<?php

        require_once('../lib/db.php');

        $facebookUid = isset($_REQUEST['fbuid']) ? $_REQUEST['fbuid'] : '';

        if (!$facebookUid) {
                echo json_encode(array('success' => false, 'message' => 'missing facebook user id'));
                exit;
        }

        $query = "SELECT * FROM games WHERE starting_facebook_uid='" . $facebookUid . "' OR facebook_uid1='"$
        $result = mysql_query($query, $dbConn);

		if ($result) {
			while ($row = mysql_fetch_assoc($result)) {
				
			}
		}

