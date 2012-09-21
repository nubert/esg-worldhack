<?php 

require_once '../lib/db.php';

$facebookUid = isset($_REQUEST['fbuid']) ? $_REQUEST['fbuid'] : '';
$gameId = isset($_REQUEST['gameId']) ? $_REQUEST['gameId'] : '';
$phrase = isset($_REQUEST['phrase']) ? $_REQUEST['phrase'] : '';

if (!$facebookUid) {
    echo json_encode(array('success' => false, 'message' => 'missing facebook user id'));
    exit;
}

$query = "INSERT INTO game_phrases (game_id, facebook_uid, phrase) VALUES ('$gameId', '$facebookUid', '" . $phrase . "')";
$result = mysql_query($query, $dbConn);

$response = array('success' => true,
                    'message' => 'phrase added'
                    );
echo json_encode($response);
