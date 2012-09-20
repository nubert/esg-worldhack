package com.esg.parzns.creation
{
	import com.esg.parzns.art.UserThumbnail;
	import com.esg.parzns.core.gameplay.GameData;
	
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.Label;
	
	public class UsersBasePanel extends Group
	{
		public var firstUserThumbnail:UserThumbnail;
		public var secondUserThumbnail:UserThumbnail;
		public var verb:Label;
		public var acrynom:Label;

		private var gameData:GameData;
		
		public function UsersBasePanel()
		{
			super();
		}
		
		public function setGameData(gameData:GameData):void
		{
			this.gameData = gameData;
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		private function onCreationComplete(e:FlexEvent):void
		{
			firstUserThumbnail.setThumbnail(gameData.friend1Id);
			secondUserThumbnail.setThumbnail(gameData.friend2Id);
			
			verb.text = gameData.verb;
			acrynom.text = gameData.acronym;
		}
	}
}