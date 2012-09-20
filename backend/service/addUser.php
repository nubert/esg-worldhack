<?php 

require_once '../lib/db.php';

$facebookUid = isset($_GET['fbuid']) ? $_GET['fbuid'] : '';
$email = isset($_GET['email']) ? $_GET['email'] : '';

if (!$facebookUid) {
    echo json_encode(array('success' => false, 'message' => 'missing facebook user id'));
    exit;
}

$query = "INSERT INTO players (facebook_uid, email) VALUES ('$facebookUid', '$email')";
$result = mysql_query($query, $dbConn);

$response = array('success' => true,
                    'message' => 'player created'
                    );
echo json_encode($response);
