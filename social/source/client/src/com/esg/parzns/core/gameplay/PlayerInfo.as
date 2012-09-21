package com.esg.parzns.core.gameplay
{
	public class PlayerInfo
	{
		private static var userId:String;
		private static var username:String;
		private static var points:int;
		
		public static function init(info:*):void
		{
			userId = info.id;
			username = info.username;
			points = info.points;
		}
		
		public static function getUserId():String
		{
			return userId;
		}
		
		public function getUserName():String
		{
			return username;
		}
		
		public function getPoints():int
		{
			return points;
		}
	}
}