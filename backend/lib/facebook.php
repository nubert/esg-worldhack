<?php

require_once 'facebook-php-sdk/src/facebook.php';

$config = array();
$config['appId'] = '473854159303213';
$config['secret'] = '175a70ba2523c6eaff58ba2574593265';

$facebook = new Facebook($config);
$facebookId = $facebook->getUser();

if (!$facebookId) {
	$params = array(
		'scope' => 'email, publish_actions'
	);
	
	print('<script>top.location.href=\'' .  $facebook->getLoginUrl($params) . '\'</script>');
	exit;
}

function openGraph($action, $url)
{
	$facebook->api('/me:esg_parzns?' . $action . '=' . $url);
}