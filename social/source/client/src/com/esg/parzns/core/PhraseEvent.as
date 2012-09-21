package com.esg.parzns.core
{
	import com.esg.parzns.core.gameplay.GameData;
	import com.esg.parzns.core.gameplay.GameVote;
	
	import flash.events.Event;
	
	public class PhraseEvent extends Event
	{
		public static const PHRASE_ADDED:String = "phraseAdded";
		
		public var gameData:GameData;
		
		public function PhraseEvent(type:String, gameData:GameData, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.gameData = gameData;
			super(type, bubbles, cancelable);
		}
	}
}