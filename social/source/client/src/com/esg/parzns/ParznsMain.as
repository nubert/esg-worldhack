package com.esg.parzns
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import spark.components.Application;
	
	public class ParznsMain extends Application
	{
		public function ParznsMain()
		{
			super();
			
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(e:TimerEvent):void
		{
			e.target.removeEventListener(TimerEvent.TIMER, onTimer);
			e.target.stop();
			currentState="game";
		}
	}
}