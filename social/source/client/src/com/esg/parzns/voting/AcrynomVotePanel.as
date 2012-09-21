package com.esg.parzns.voting
{
	import com.esg.parzns.core.BaseLoader;
	import com.esg.parzns.core.BaseLoaderEvent;
	import com.esg.parzns.core.GlobalDisptacher;
	import com.esg.parzns.core.gameplay.GameData;
	import com.esg.parzns.core.gameplay.GameVote;
	import com.esg.parzns.core.gameplay.PlayerInfo;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.Label;
	
	public class AcrynomVotePanel extends Group
	{
		public var votes:Label;
		public var acrynom:Label;
		public var voteButton:Button;
		
		private var gameVote:GameVote;
		private var gameId:String;
		
		public function AcrynomVotePanel()
		{
			super();
		}
		
		public function setInfo(gameVote:GameVote, gameId:String):void
		{
			this.gameVote = gameVote;
			this.gameId = gameId;
			
			votes.text = gameVote.getVotes().toString();
			acrynom.text = gameVote.getDef();
			
			voteButton.addEventListener(MouseEvent.CLICK, onVote);
		}
		
		private function onVote(e:MouseEvent):void
		{
			// Do a local update
			gameVote.vote();
			onVoted(null);
			//voteBackend();
			// Update backend
			
		}
		
		private function voteBackend():void
		{
			var gamesList:BaseLoader = new BaseLoader();
			var params:Dictionary = new Dictionary();
			params["fbuid"] = PlayerInfo.getUserId();
			params["gameId"] = gameId;
			params["entryId"] = gameVote.getEntryId();
			gamesList.addEventListener(BaseLoaderEvent.LOAD_COMPLETE, onVoted);
			gamesList.setCall("vote.php", params);
		}
		
		private function onVoted(e:BaseLoaderEvent):void
		{
			GlobalDisptacher.disptacher.dispatchEvent(new Event("voted"));
		}
	}
}