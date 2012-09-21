<?php

require_once '../lib/db.php';

$phrase_id = isset($_GET['phrase_id']) ? $_GET['phrase_id'] : 0;
$query = "SELECT p.phrase, g.letters FROM game_phrases AS p LEFT JOIN games AS g ON games.game_id = p.game_id WHERE p.phrase_id = " . mysql_real_escape_string($phrase_id);
$result = mysql_query($query, $dbConn);
$phrase = '';

if (mysql_num_rows($result) > 0) {
	$row = mysql_fetch_assoc($result);
	$phrase = $row['phrase'];
}

if ($phrase) {
?>
<!DOCTYPE html>
<html>
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# esg_parzns: http://ogp.me/ns/fb/esg_parzns#">
  <meta property="fb:app_id" content="473854159303213" /> 
  <meta property="og:type"   content="esg_parzns:phrase" /> 
  <meta property="og:url"    content="http://hackathon.eastsidegamestudio.com/esg-worldhack/backend/opengraph/phrase.php?phrase_id=<?php echo $phrase_id; ?>" /> 
  <meta property="og:title"  content="<?php echo $phrase; ?>" /> 
  <meta property="og:image"  content="<?php echo $baseUrl . '/assets/images/phrase.png'; ?>" />
</head>
<body>
<img src="<?php echo $baseUrl . '/assets/images/phrase.png'; ?>" />
</body>
</html>
<?php
}
?>