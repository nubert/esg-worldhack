package com.esg.parzns.core.gameplay
{
	import flash.utils.Dictionary;

	public class Games
	{
		private static var games:Dictionary;

		public static function setGames(gameList:*):void
		{
			games = parseGameList(gameList);
		}
		
		public static function getGames():Dictionary
		{
			return games;
		}
		
		private static function parseGameList(gameList:*):Dictionary
		{
			var returnedGames:Dictionary = new Dictionary();
			
			for each (var gameData:* in gameList)
			{
				returnedGames[gameData.gameId] = new GameData(gameData);
			}
			
			return returnedGames;
		}
	}
}