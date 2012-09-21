<?php 

require_once '../lib/db.php';

$facebookUid = isset($_REQUEST['fbuid']) ? $_REQUEST['fbuid'] : '';

$query = "SELECT * FROM games WHERE starting_facebook_uid = '$facebookUid'";
$result = mysql_query($query, $dbConn);
if (!mysql_error($dbConn)) {
	while($row=mysql_fetch_array($result)) {
		$return[] = $row;
	}
	return $return;
}


