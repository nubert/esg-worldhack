package com.esg.parzns.core.gameplay
{
	import flash.utils.Dictionary;

	public class GameData
	{
		private var friend1Id:String;
		private var friend2Id:String;
		private var friend1Name:String;
		private var friend2Name:String;
		private var verb:String;
		private var acronym:String;
		private var entries:Dictionary;
		
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