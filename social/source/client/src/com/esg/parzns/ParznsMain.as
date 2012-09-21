package com.esg.parzns
{
	import com.esg.parzns.core.BaseLoader;
	import com.esg.parzns.core.BaseLoaderEvent;
	import com.esg.parzns.core.GlobalDisptacher;
	import com.esg.parzns.core.gameplay.GameData;
	import com.esg.parzns.core.gameplay.Games;
	import com.esg.parzns.core.gameplay.PlayerInfo;
	import com.esg.parzns.gameFlow.GameFlow;
	
	import flash.display.LoaderInfo;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.system.Security;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	import mx.events.FlexEvent;
	
	import spark.components.Application;
	import spark.components.Button;
	
	public class ParznsMain extends Application
	{
		public var createGame:Button;
		public var gameFlow:GameFlow;
		
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
			var id:String = (parameters.facebookId) != null ? parameters.facebookId : "807610435";
			
			var gamesList:BaseLoader = new BaseLoader();
			var params:Dictionary = new Dictionary();
			params["fbuid"] = id;
			gamesList.addEventListener(BaseLoaderEvent.LOAD_COMPLETE, onUserLoaded);
			gamesList.setCall("getUser.php", params);
		}

		private function onUserLoaded(e:BaseLoaderEvent):void
		{
			PlayerInfo.init({id:e.getResponse().id, username:e.getResponse().name, points:e.getResponse().points});
		}
		
		private function onTimer(e:TimerEvent):void
		{
			e.target.removeEventListener(TimerEvent.TIMER, onTimer);
			e.target.stop();
			currentState="game";
			
			createGame.addEventListener(MouseEvent.CLICK, onCreateGame);
		}
		
		private function onCreateGame(e:MouseEvent):void
		{
			var gamesList:BaseLoader = new BaseLoader();
			var params:Dictionary = new Dictionary();
			params["fbuid"] = PlayerInfo.getUserId();
			gamesList.addEventListener(BaseLoaderEvent.LOAD_COMPLETE, onGameCreated);
			gamesList.setCall("startGame.php", params);
		}
		
		private function onGameCreated(e:BaseLoaderEvent):void
		{
			gameFlow.refresh();
		}
	}
}