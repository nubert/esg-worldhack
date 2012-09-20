var PARZNS = {
    sendRequest: function(type, recipients)
    {
    	switch(type)
    	{
    		case 'sendInvite':
				var params = {
					method: 'apprequests',
					message: 'Come play P.A.R.Z.N.S with me!'
				};
				
				if(recipients) {
					params.to = recipients
				}
				
				FB.ui(params, function()
				{
					
				});
				break;
    	}
    },
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
    }
}