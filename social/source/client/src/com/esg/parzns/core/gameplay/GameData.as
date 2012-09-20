package com.esg.parzns.core.gameplay
{
	import flash.utils.Dictionary;

	public class GameData
	{
		public var friend1Id:String;
		public var friend2Id:String;
		public var friend1Name:String;
		public var friend2Name:String;
		public var verb:String;
		public var acronym:String;
		public var entries:Dictionary;
		
		public function GameData(info:*)
		{
			friend1Id = info.friend1Id;
			friend2Id = info.friend2Id;
			friend1Name = info.friend1Name;
			friend2Name = info.friend2Name;
			verb = info.verb;
			acronym = info.acronym;
			entries = generateEntries(info.entries);
		}
		
		private function generateEntries(gameVotes:*):Dictionary
		{
			var votes:Dictionary = new Dictionary();
			
			for each (var gameVote:* in gameVotes)
			{
				votes[gameVote.entryId] = new GameVote(gameVote);
			}
			
			return votes;
		}
	}
}