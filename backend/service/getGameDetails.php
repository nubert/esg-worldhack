<?php 

require_once '../lib/db.php';

$gameId = isset($_REQUEST['gameId']) ? $_REQUEST['gameId'] : '';

if (!$gameId) {
    echo json_encode(array('success' => false, 'message' => 'missing game id'));
    exit;
}

$query = "SELECT g.game_id, unix_timestamp(g.created_at) as unix_created_at, p0.facebook_uid AS starting_uid, p0.first_name AS starting_first_name, p0.last_name AS starting_last_name, p1.facebook_uid AS p1_uid, p1.first_name AS p1_first_name, p1.last_name AS p1_last_name, p2.facebook_uid AS p2_uid, p2.first_name AS p2_first_name, p2.last_name AS p2_last_name, v.verb_multiple AS verb, g.letters, g.created_at FROM games g, players p0, players p1, players p2, verbs v WHERE g.starting_facebook_uid=p0.facebook_uid AND g.facebook_uid1=p1.facebook_uid AND g.facebook_uid2=p2.facebook_uid AND g.verb_id=v.verb_id AND g.game_id = '$gameId'";
$result = mysql_query($query, $dbConn);

if (!mysql_num_rows($result)) {
    echo json_encode(array('success' => false, 'message' => 'game not found'));
    exit;
}

$row = mysql_fetch_assoc($result);
$response = array('success' => true,
                    'gameId' => $gameId,
                    'friend1' => $row['p1_first_name'] . ' ' . $row['p1_last_name'],
                    'friend2' => $row['p2_first_name'] . ' ' . $row['p2_last_name'],
                    'friend1_id' => $row['p1_uid'],
                    'friend2_id' => $row['p2_uid'],
                    'verb' => $row['verb'],
                    'acronym' => $row['letters'],
                    'created_at' => $row['unix_created_at']
            );

$query = "SELECT phrase_id, phrase FROM game_phrases WHERE game_id = '$gameId'";
$result = mysql_query($query, $dbConn);
$entries = array();
while ($row = mysql_fetch_assoc($result)) {
    $entry = array('phraseId' => $row['phrase_id'],
                    'phrase' => $row['phrase']
                  );
    $subQuery = "SELECT COUNT(*) AS count FROM game_votes WHERE phrase_id = " . $row['phrase_id'];
    $subResult = mysql_query($subQuery, $dbConn);
    $subRow = mysql_fetch_assoc($subResult);
    $entry['votes'] = $subRow['count'];
    $entries[] = $entry;
}
$response['entries'] = $entries;

echo json_encode($response);

