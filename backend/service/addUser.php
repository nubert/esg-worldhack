<?php 

require_once '../lib/db.php';

$facebookUid = isset($_REQUEST['fbuid']) ? $_REQUEST['fbuid'] : '';
$email = isset($_REQUEST['email']) ? $_REQUEST['email'] : '';
$firstName = isset($_REQUEST['first_name']) ? $_REQUEST['first_name'] : '';
$lastName = isset($_REQUEST['last_name']) ? $_REQUEST['last_name'] : '';

if (!$facebookUid) {
    echo json_encode(array('success' => false, 'message' => 'missing facebook user id'));
    exit;
}

$query = "INSERT INTO players (facebook_uid, first_name, last_name, email) VALUES ('$facebookUid', '$firstName', '$lastName', '$email')";
$result = mysql_query($query, $dbConn);

$response = array('success' => true,
                    'message' => 'player created'
                    );
echo json_encode($response);
