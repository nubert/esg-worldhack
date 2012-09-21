package com.esg.parzns.voting
{
	import com.esg.parzns.core.gameplay.GameVote;
	
	import flash.utils.Dictionary;
	
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	
	public class VotingPage extends Group
	{
		public var optionsContainer:Group;
		
		private var voteItems:Dictionary;
		private var gameId:String;
		
		public function VotingPage()
		{
			super();
		}
		
		public function setItems(voteItems:Dictionary, gameId:String):void
		{
			clear();
			
			this.voteItems = voteItems;
			this.gameId = gameId;
			if (initialized)
			{
				createVoteItems(voteItems);
			}
			else
			{
				addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
			}
		}
		
		private function clear():void
		{
			optionsContainer.removeAllElements();
		}

		private function onCreationComplete(e:FlexEvent):void
		{
			createVoteItems(voteItems);
		}
		
		public function createVoteItems(voteItems:Dictionary):void
		{
			for each (var vote:GameVote in voteItems)
			{
				var item:AcrynomVotePanel = new AcrynomVotePanelView();
				item.setInfo(vote, gameId);
				optionsContainer.addElement(item);
			}
		}
	}
}