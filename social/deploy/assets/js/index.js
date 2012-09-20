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
    }
}