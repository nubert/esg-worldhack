package com.esg.parzns.gameFlow
{
	import com.esg.parzns.core.GameSelectedEvent;
	import com.esg.parzns.core.GlobalDisptacher;
	import com.esg.parzns.core.gameplay.GameData;
	import com.esg.parzns.voting.GameList;
	import com.esg.parzns.voting.VotingPage;
	
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.Label;
	
	public class GameFlow extends Group
	{
		public var gameList:GameList;
		public var votes:VotingPage;
		public var title:Label;
		
		public function GameFlow()
		{
			super();
			
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		private function onCreationComplete(e:FlexEvent):void
		{
			GlobalDisptacher.disptacher.addEventListener(GameSelectedEvent.GAME_SELECTED, onGameSelected);
			GlobalDisptacher.disptacher.addEventListener("voted", onVoted);
		}
		
		private function onGameSelected(e:GameSelectedEvent):void
		{
			var gameData:GameData = e.getGameData();
			currentState = "game";
			title.text = gameData.friend1Name + " and " + gameData.friend2Name + " " + gameData.verb + " " + gameData.acronym;
			votes.setItems(gameData.entries, gameData.gameId);
		}
		
		private function onVoted(e:Event):void
		{
			currentState = "gameSelect";
		}
	}
}