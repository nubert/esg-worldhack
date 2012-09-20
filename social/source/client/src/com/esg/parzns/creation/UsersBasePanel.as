package com.esg.parzns.creation
{
	import com.esg.parzns.art.UserThumbnail;
	
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	
	public class UsersBasePanel extends Group
	{
		public var firstUserThumbnail:UserThumbnail;
		public var secondUserThumbnail:UserThumbnail;
		
		public function UsersBasePanel()
		{
			super();
			
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		private function onCreationComplete(e:FlexEvent):void
		{
			firstUserThumbnail.setThumbnail("807610435");
			secondUserThumbnail.setThumbnail("807610435");
		}
	}
}