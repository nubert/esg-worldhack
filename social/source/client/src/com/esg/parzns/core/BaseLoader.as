package com.esg.parzns.core
{
	import com.adobe.serialization.json.JSON;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	public class BaseLoader extends EventDispatcher
	{
		public static var GAME_SERVER_URL:String = "http://hackathon.eastsidegamestudio.com/esg-worldhack/backend/service/";
			
		public function BaseLoader(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setCall(serviceCallName:String, params:Dictionary):void
		{
			var url:String = GAME_SERVER_URL + serviceCallName + encodeParams(params)
			var urlRequest:URLRequest = new URLRequest(url);
			var loader:URLLoader = new URLLoader();
			
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.load(urlRequest);
		}
		
		private function encodeParams(params:Dictionary):String
		{
			if (params == null)
			{
				return "";
			}
			
			var returnedParams:String = "?";
			for (var param:String in params)
			{
				returnedParams +=  param + "=" + params[param] +"&";
			}
			
			returnedParams = returnedParams.slice(0, returnedParams.lastIndexOf("&"));
			return returnedParams;
		}
		
		private function onComplete(e:Event):void
		{
			var response:* = JSON.decode(e.target.data);
			dispatchEvent(new BaseLoaderEvent(BaseLoaderEvent.LOAD_COMPLETE, response));
		}
									 
	}
}