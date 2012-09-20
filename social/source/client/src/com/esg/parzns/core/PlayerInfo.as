package com.esg.parzns.core
{
	public class PlayerInfo
	{
		private var userId:String;
		
		public function PlayerInfo(info:*)
		{
			userId = info.id;
		}
		
		public function getUserId():String
		{
			return userId;
		}
	}
}