<?php
require_once '../lib/config.php';

$request = parse_signed_request($_POST['signed_request'], $appSecret);
$request_type = $_POST['method'];
$response = '';

if ($request_type == 'payments_get_items') {
	$order_info = json_decode($request['credits']['order_info'], true);
	$item_id = $order_info['item_id'];
	$item = array(
		'title' => '100 some game cash',
		'description' => 'Spend cash in some game.',
		'price' => 1,
		'image_url' => 'http://some_image_url/coin.jpg',
	);
	
	$response = array(
		'content' => array(
			0 => $item,
		),
		'method' => $request_type,
	);
	
	$response = json_encode($response);

} else if ($request_type == "payments_status_update") {
	$order_details = json_decode($request['credits']['order_details'], true);
	$item_data = json_decode($order_details['items'][0]['data'], true);
	$earned_currency_order = (isset($item_data['modified'])) ?
	$item_data['modified'] : null;
	$current_order_status = $order_details['status'];

	if ($current_order_status == 'placed') {
		if ($earned_currency_order) {
			$product = $earned_currency_order['product'];
			$product_title = $earned_currency_order['product_title'];
			$product_amount = $earned_currency_order['product_amount'];
			$credits_amount = $earned_currency_order['credits_amount'];
		}
		
		$response = array(
				'content' => array(
						'status' => 'settled',
						'order_id' => $order_details['order_id'],
				),
				'method' => $request_type,
		);
		
		$response = json_encode($response);

	} else if ($current_order_status == 'disputed') {

	} else if ($current_order_status == 'refunded') {
		
	} else {
		
	}
}

echo $response;

function parse_signed_request($signed_request, $secret) {
	list($encoded_sig, $payload) = explode('.', $signed_request, 2);
	
	$sig = base64_url_decode($encoded_sig);
	$data = json_decode(base64_url_decode($payload), true);

	if (strtoupper($data['algorithm']) !== 'HMAC-SHA256') {
		error_log('Unknown algorithm. Expected HMAC-SHA256');
		return null;
	}
	
	$expected_sig = hash_hmac('sha256', $payload, $secret, $raw = true);
	if ($sig !== $expected_sig) {
		error_log('Bad Signed JSON signature!');
		return null;
	}

	return $data;
}

function base64_url_decode($input) {
	return base64_decode(strtr($input, '-_', '+/'));
}