<?php

require_once 'facebook-php-sdk/src/facebook.php';

$config = array();
$config['appId'] = '473854159303213';
$config['secret'] = '175a70ba2523c6eaff58ba2574593265';

$facebook = new Facebook($config);
$facebookId = $facebook->getUser();

function openGraph($action, $url)
{
	try {
		$facebook->api('/me:esg_parzns?' . $action . '=' . $url);
	} catch (Exception $e) {
		
	}
}

function notifyUsers($userList, $notif)
{

/*	$appAccessToken = $facebook->getAccessToken();
	foreach ($userList as $user) {
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, "https://graph.facebook.com/" . $user . "/notifications?access_token=" . $appAccessToken);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POST, true);

		$data = array(
			'template' => 'Hey buddy, a P.A.R.Z.N.S. game you were involved in just got a new vote!',
			'ref' => $notif
		);

		curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		$output = curl_exec($ch);
		$info = curl_getinfo($ch);
		curl_close($ch);
	}*/
}
