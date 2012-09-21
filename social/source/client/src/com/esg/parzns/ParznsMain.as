package com.esg.parzns
{
	import com.esg.parzns.core.GlobalDisptacher;
	import com.esg.parzns.core.gameplay.PlayerInfo;
	
	import flash.display.LoaderInfo;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.system.Security;
	import flash.utils.Timer;
	
	import mx.events.FlexEvent;
	
	import spark.components.Application;
	
	public class ParznsMain extends Application
	{
		public function ParznsMain()
		{
			super();
			
			addEventListener(FlexEvent.APPLICATION_COMPLETE, init);
		}
		
		private function init(e:FlexEvent):void
		{
			Security.allowDomain("hackathon.eastsidegamestudio.com");
			Security.allowDomain("graph.facebook.com");
			
			handleParams();
			
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			
			GlobalDisptacher.disptacher = new EventDispatcher();
		}
		
		private function handleParams():void
		{
			var parameters:Object = LoaderInfo(stage.loaderInfo).parameters;
			var id:String = (parameters.userId);
			
			PlayerInfo.init({id:"807610435", username:"Alon", points:6054});
		}
		
		private function loadUser():void
		{
			
		}
		
		private function onTimer(e:TimerEvent):void
		{
			e.target.removeEventListener(TimerEvent.TIMER, onTimer);
			e.target.stop();
			currentState="game";
		}
	}
}