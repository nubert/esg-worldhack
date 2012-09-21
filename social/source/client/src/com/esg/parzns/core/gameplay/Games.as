package com.esg.parzns.core.gameplay
{
	import flash.utils.Dictionary;

	public class Games
	{
		private static var games:Dictionary;

		public static function setGames(gameList:*):void
		{
			games = parseGameList(gameList.games);
		}
		
		public static function addGame(gameData:*):void
		{
			getGames()[gameData.gameId] = new GameData(gameData);
		}
		
		public static function getGames():Dictionary
		{
			return games;
		}
		
		private static function parseGameList(gameList:*):Dictionary
		{
			var returnedGames:Dictionary = new Dictionary();
			
			for (var i:int = 0; i < gameList.length; i++)
			{
				var gameData:* = gameList[i];
				returnedGames[gameData.gameId] = new GameData(gameData);
			}
			
			return returnedGames;
		}
	}
}