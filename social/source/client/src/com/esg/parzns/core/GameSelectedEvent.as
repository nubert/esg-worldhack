package com.esg.parzns.core
{
	import com.esg.parzns.core.gameplay.GameData;
	
	import flash.events.Event;
	
	public class GameSelectedEvent extends Event
	{
		public static const GAME_SELECTED:String = "gameSelected";
		
		private var game:GameData;
		
		public function GameSelectedEvent(type:String, game:GameData, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.game = game;
			super(type, bubbles, cancelable);
		}
		
		public function getGameData():GameData
		{
			return game;
		}
	}
}