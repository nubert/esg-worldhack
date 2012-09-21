<?php 

require_once '../lib/db.php';
require_once '../lib/facebook.php';

$facebookUid = isset($_REQUEST['fbuid']) ? $_REQUEST['fbuid'] : '';

if (!$facebookUid) {
    echo json_encode(array('success' => false, 'message' => 'missing facebook user id'));
    exit;
}

$query = "SELECT * FROM players WHERE facebook_uid != '$facebookUid' ORDER BY rand() LIMIT 2";
$result = mysql_query($query, $dbConn);
if (mysql_num_rows($result) != 2) {
    echo json_encode(array('success' => false, 'message' => 'could not find 2 players'));
    exit;
}

$row = mysql_fetch_assoc($result);
$player1 = $row;

$row = mysql_fetch_assoc($result);
$player2 = $row;

$query = "SELECT * FROM verbs ORDER BY rand() LIMIT 1";
$result = mysql_query($query, $dbConn);
$row = mysql_fetch_assoc($result);
$verb = $row;

$characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
$letters = '';
for ($i = 0; $i < 3; $i++) {
    $letters .= $characters[mt_rand(0, 25)];
}

$query = "INSERT INTO games (starting_facebook_uid, facebook_uid1, facebook_uid2, verb_id, letters) VALUES ('$facebookUid', '" . $player1['facebook_uid'] . "', '" . $player2['facebook_uid'] . "', " . $verb['verb_id'] . ", '$letters')";
$result = mysql_query($query, $dbConn);
$game_id = mysql_insert_id($dbConn);

if (!mysql_error($dbConn)) {
    $gameId = mysql_insert_id($dbConn);   
    $query = "SELECT g.game_id, unix_timestamp(g.created_at) as unix_created_at, p0.facebook_uid AS starting_uid, p0.first_name AS starting_first_name, p0.last_name AS starting_last_name, p1.facebook_uid AS p1_uid, p1.first_name AS p1_first_name, p1.last_name AS p1_last_name, p2.facebook_uid AS p2_uid, p2.first_name AS p2_first_name, p2.last_name AS p2_last_name, v.verb_multiple AS verb, g.letters, g.created_at FROM games g, players p0, players p1, players p2, verbs v WHERE g.starting_facebook_uid=p0.facebook_uid AND g.facebook_uid1=p1.facebook_uid AND g.facebook_uid2=p2.facebook_uid AND g.verb_id=v.verb_id AND g.game_id = '$gameId'";
    
    $result = mysql_query($query, $dbConn);
    $row = mysql_fetch_assoc($result);
    
    openGraph('create', 'http://hackathon.eastsidegamestudio.com/esg-worldhack/backend/opengraph/game.php?game_id=' . $game_id);
    
    $response = array('success' => true,
                        'gameId' => $gameId,
                        'friend1' => $row['p1_first_name'] . ' ' . $row['p1_last_name'],
                        'friend2' => $row['p2_first_name'] . ' ' . $row['p2_last_name'],
                        'friend1_id' => $row['p1_uid'],
                        'friend2_id' => $row['p2_uid'],
                        'verb' => $row['verb'],
                        'acronym' => $row['letters'],
                        'created_at' => $row['unix_created_at'],
                        'entries' => array()
                );
    echo json_encode($response);
    exit;
}
