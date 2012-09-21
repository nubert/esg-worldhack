<?php

require_once '../lib/db.php';

$game_id = isset($_GET['game_id']) ? $_GET['game_id'] : 0;
$query = "SELECT * FROM games WHERE game_id = " . mysql_real_escape_string($game_id);
$result = mysql_query($query, $dbConn);

if (mysql_num_rows($result) > 0) {
	$game = mysql_fetch_assoc($result);
}

if ($game) {
?>
<!DOCTYPE html>
<html>
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# esg_parzns: http://ogp.me/ns/fb/esg_parzns#">
  <meta property="fb:app_id" content="473854159303213" /> 
  <meta property="og:type"   content="esg_parzns:game" /> 
  <meta property="og:url"    content="http://hackathon.eastsidegamestudio.com/esg-worldhack/backend/opengraph/game.php?game_id=<?php echo $game_id; ?>" /> 
  <meta property="og:title"  content="<?php echo $game['letters']; ?>" /> 
  <meta property="og:image"  content="<?php echo $baseUrl . '/assets/images/game.png'; ?>" />
</head>
<body>
<img src="<?php echo $baseUrl . '/assets/images/game.png'; ?>" /><br />
</body>
</html>
<?php
}
?>
