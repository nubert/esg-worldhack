package com.esg.parzns
{
	import com.esg.parzns.core.GlobalDisptacher;
	import com.esg.parzns.core.gameplay.PlayerInfo;
	
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import spark.components.Application;
	
	public class ParznsMain extends Application
	{
		public function ParznsMain()
		{
			super();
			
			PlayerInfo.init({id:"807610435", username:"Alon", points:6054});
			
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			
			GlobalDisptacher.disptacher = new EventDispatcher();
		}
		
		private function onTimer(e:TimerEvent):void
		{
			e.target.removeEventListener(TimerEvent.TIMER, onTimer);
			e.target.stop();
			currentState="game";
		}
	}
}