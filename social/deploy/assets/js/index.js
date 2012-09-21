var PARZNS = {
    sendRequest: function(type, recipients)
    {
    	switch(type)
    	{
    		case 'sendInvite':
				var params = {
					method: 'apprequests',
					message: 'Come play P.A.R.Z.N.S with me!'
					frictionlessRequests: true
				};
				
				if(recipients) {
					params.to = recipients
				}
				
				FB.ui(params, function()
				{
					console.log('Sent');
				});
				break;
    	}
    }
	purchaseCoins: function(item_id)
	{
		FB.ui({
			method: 'pay',
			action: 'buy_item',
			order_info: {
				'item_id': item_id
			}
		}, function(data)
		{
			if (data['order_id']) {
				
			} else if (data['error_code']) {
				
			} else {
				
			}
		});
	},
	getUserInfo: function()
	{
		FB.api('/me', function(response) {
			  return response;
			});
	},
    postWallFeed: function(caption, description, picture)
    {
    	FB.ui(
    		{
    			method: 'feed',
    			name: 'P.A.R.Z.N.S',
    			link: 'http://apps.facebook.com/esg_parzns/',
    			picture: picture,
    			caption: caption,
    			description: description
    		},
    		function(response) {
    			if (response && response.post_id) {
    				console.log('Sent');
    			} else {
    				console.log('Failed');
    			}
    		}
    	);
    }
}