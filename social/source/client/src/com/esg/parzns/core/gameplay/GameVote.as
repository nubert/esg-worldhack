package com.esg.parzns.core.gameplay
{
	public class GameVote
	{
		private var def:String;
		private var votes:int;
		private var entryId:int;
		
		public function GameVote(gameVoteInfo:*)
		{
			this.def = gameVoteInfo.def;
			this.votes = gameVoteInfo.votes;
			this.entryId = gameVoteInfo.entryId;
		}
		
		public function getDef():String
		{
			return def;
		}
		
		public function getVotes():int
		{
			return votes;
		}
		
		public function vote():void
		{
			votes += 1;
		}
		
		public function getEntryId():int
		{
			return entryId;
		}
	}
}