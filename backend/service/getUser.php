<?php 

require_once '../lib/db.php';

$facebookUid = isset($_REQUEST['fbuid']) ? $_REQUEST['fbuid'] : '';

if (!$facebookUid) {
    echo json_encode(array('success' => false, 'message' => 'missing facebook user id'));
    exit;
}

$query = "SELECT * FROM players WHERE facebook_uid = '$facebookUid'";
$result = mysql_query($query, $dbConn);

if (!mysql_num_rows($result)) {
    echo json_encode(array('success' => false, 'message' => 'player not found'));
    exit;
}

$row = mysql_fetch_assoc($result);
$portrait = 'http://graph.facebook.com/' . $facebookUid . '/picture';
$response = array('success' => true,
                    'user' => array('id' => $facebookUid, 
                                    'name' => $row['first_name'] . ' ' . $row['last_name'],
                                    'portrait' => $portrait,
                                    'points' => $row['score']
                              )
                    );
echo json_encode($response);
