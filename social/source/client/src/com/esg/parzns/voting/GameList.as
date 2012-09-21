package com.esg.parzns.voting
{
	import com.esg.parzns.core.BaseLoader;
	import com.esg.parzns.core.BaseLoaderEvent;
	import com.esg.parzns.core.gameplay.GameData;
	import com.esg.parzns.core.gameplay.Games;
	import com.esg.parzns.core.gameplay.PlayerInfo;
	import com.esg.parzns.creation.UsersBasePanel;
	import com.esg.parzns.creation.UsersBasePanelView;
	
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	
	public class GameList extends Group
	{
		public function GameList()
		{
			super();
			
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		private function onCreationComplete(e:FlexEvent):void
		{
			// Genereate the list
			
			// Service call get the game list
			getGameList();
		}
		
		public function refresh():void
		{
			getGameList();
		}

		private function getGameList():void
		{
			var gamesList:BaseLoader = new BaseLoader();
			var params:Dictionary = new Dictionary();
			params["fbuid"] = PlayerInfo.getUserId();
			gamesList.addEventListener(BaseLoaderEvent.LOAD_COMPLETE, onGameListLoaded);
			gamesList.setCall("getCurrentGames.php", params);
		}
		
		private function getDummyList():*
		{
			return 	  {game1:
					  {gameId:"222",
					   friend1Id:"807610435", friend1Name:"Alon",
					   friend2Id:"807610435", friend2Name:"Alon",
					   verb:"are", acronym:"pto",
					   entries:[{def:"Potatoes turban oranges", votes:22, entryId:3}]}}
		}
		
		private function onGameListLoaded(e:BaseLoaderEvent):void
		{
			setGames(e.getResponse());
		}
		
		private function onDummyGameListLoaded():void
		{
			setGames(getDummyList());
		}
		
		private function setGames(gamesData:*):void
		{
			Games.setGames(gamesData);
			
			clear();
			for each (var game:GameData in Games.getGames())
			{
				var userBasePanel:UsersBasePanel = new UsersBasePanelView();
				userBasePanel.setGameData(game);
				addElement(userBasePanel);
				
			}
			
			dispatchEvent(new Event("gamesCreate"));
		}
		
		private function clear():void
		{
			this.removeAllElements();
		}
	}
}