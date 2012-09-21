package com.esg.parzns.voting
{
	import com.esg.parzns.core.gameplay.GameData;
	import com.esg.parzns.core.gameplay.GameVote;
	import com.esg.parzns.creation.InputPanel;
	
	import flash.utils.Dictionary;
	
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	
	public class VotingPage extends Group
	{
		public var optionsContainer:Group;
		public var suggestionSubmit:InputPanel;
		private var voteItems:Dictionary;
		private var gameData:GameData;
		
		public function VotingPage()
		{
			super();
		}
		
		public function setItems(voteItems:Dictionary, gameData:GameData):void
		{
			clear();
			
			this.voteItems = voteItems;
			this.gameData = gameData;
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
			suggestionSubmit.setItems(gameData);
		}
		
		public function createVoteItems(voteItems:Dictionary):void
		{
			for each (var vote:GameVote in voteItems)
			{
				var item:AcrynomVotePanel = new AcrynomVotePanelView();
				item.setInfo(vote, gameData.gameId);
				optionsContainer.addElement(item);
			}
		}
	}
}