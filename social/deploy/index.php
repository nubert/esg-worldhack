<?php
require_once '../../backend/lib/config.php';
require_once '../../backend/lib/facebook.php';
require_once '../../backend/lib/db.php';

if (!$facebookId) {
	$params = array(
			'scope' => 'email, publish_actions'
	);

	print('<script>top.location.href=\'' .  $facebook->getLoginUrl($params) . '\'</script>');
	exit;
}

$user = null;
$query = "SELECT * FROM players WHERE facebook_uid = '$facebookId'";
$result = mysql_query($query, $dbConn);

if (!mysql_num_rows($result)) {
	$userProfile = $facebook->api('/me','GET');
	$query = "INSERT INTO players (facebook_uid, first_name, last_name, email) VALUES ('$facebookId', '" . $userProfile['first_name'] . "', '" . $userProfile['last_name'] . "', '" . $userProfile['email'] . "')";
	$result = mysql_query($query, $dbConn);
	$user = array(
			'facebook_uid' => $facebookId,
			'first_name' => $userProfile['first_name'],
			'last_name' => $userProfile['last_name'],
			'email' => $userProfile['email']
	);
} else {
	$user = mysql_fetch_assoc($result);
}
?>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8" />

	<title>P.A.R.Z.N.S</title>
	
	<link href="<?php echo $baseUrl; ?>/assets/css/styles.css" rel="stylesheet" type="text/css" />
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
	<script src="<?php echo $baseUrl; ?>/assets/js/index.js"></script>
	<script type="text/javascript">
	var flashvars = {
		facebookId: "<?php echo $facebookId; ?>"
	};
	var params = {
	};
	var attributes = {
		id: "game",
		name: "game"
	};
	swfobject.embedSWF(
		"<?php echo $baseUrl; ?>/assets/swf/parzns.swf", 
		"game", 
		"760", "600", 
		"9.0.0",
		"<?php echo $baseUrl; ?>/assets/swf/expressInstall.swf", 
		flashvars, params, attributes);
	</script>

</head>

<body>

<div id="header">
	<img id="logo" src="<?php echo $baseUrl; ?>/assets/images/logo.png" alt="P.A.R.Z.N.S" />
	<div id="menu">
		<a href="<?php echo $baseUrl; ?>"><img src="<?php echo $baseUrl; ?>/assets/images/tab_play.png" alt="Play" /></a>
		<a href="javascript:void(0);" onClick="PARZNS.sendRequest('sendInvite', null);"><img src="<?php echo $baseUrl; ?>/assets/images/tab_friends.png" alt="Invite Friends" /></a>
		<a href="javascript:void(0);" onClick="PARZNS.purchaseCoins('1');"><img src="<?php echo $baseUrl; ?>/assets/images/tab_add_coins.png" alt="Add Coins" /></a>
	</div>
</div>

<div id="gameWrapper">
	<div id="game">
	    <a href="http://www.adobe.com/go/getflashplayer/">
		    <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
		</a>
	</div>
</div>

<div id="fb-root"></div>

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '473854159303213', // App ID
      channelUrl : '<?php echo $baseUrl; ?>/channel.html', // Channel File
      frictionlessRequests: true,
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });

    // Additional initialization code here
  };

  // Load the SDK Asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));
</script>

</body>

</html>