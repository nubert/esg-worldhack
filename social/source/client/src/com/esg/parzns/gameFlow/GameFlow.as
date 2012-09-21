package com.esg.parzns.gameFlow
{
	import com.esg.parzns.core.GameSelectedEvent;
	import com.esg.parzns.core.GlobalDisptacher;
	import com.esg.parzns.core.PhraseEvent;
	import com.esg.parzns.core.gameplay.GameData;
	import com.esg.parzns.core.gameplay.Games;
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
		
		private var pendingGameId:String;
		
		public function GameFlow()
		{
			super();
			
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		public function refresh():void
		{
			currentState = "gameSelect";
			gameList.refresh();
		}
		
		private function onCreationComplete(e:FlexEvent):void
		{
			GlobalDisptacher.disptacher.addEventListener(GameSelectedEvent.GAME_SELECTED, onGameSelected);
			GlobalDisptacher.disptacher.addEventListener("voted", onVoted);
			GlobalDisptacher.disptacher.addEventListener(PhraseEvent.PHRASE_ADDED, onPhraseAdded);
			
			gameList.addEventListener("gamesCreated", onGamesCreated);
		}
		
		private function onGameSelected(e:GameSelectedEvent):void
		{
			setGame(e.getGameData());
		}
		
		private function setGame(gameData:GameData):void
		{
			currentState = "game";
			title.text = gameData.friend1Name + " and " + gameData.friend2Name + " " + gameData.verb + " " + gameData.acronym;
			votes.setItems(gameData.entries, gameData);
		}
		
		private function onVoted(e:Event):void
		{
			currentState = "gameSelect";
		}
		
		private function onPhraseAdded(e:PhraseEvent):void
		{
			currentState = "game";
			pendingGameId = e.gameData.gameId;
			
			gameList.refresh();
		}
		
		private function onGamesCreated(e:Event):void
		{
			if (pendingGameId)
			{
				setGame(Games.getGames()[pendingGameId]);
			}
		}
	}
}