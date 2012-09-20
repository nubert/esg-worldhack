package com.esg.parzns.core
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	public class BaseLoader extends EventDispatcher
	{
		public static var GAME_SERVER_URL:String = "http://";
			
		public function BaseLoader(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setCall(serviceCallName:String, params:Dictionary):void
		{
			var url:String = GAME_SERVER_URL + "/" + serviceCallName + encodeParams(params)
			var urlRequest:URLRequest = new URLRequest(GAME_SERVER_URL + "/" + serviceCallName);
			var loader:URLLoader = new URLLoader()
		}
		
		private function encodeParams(params:Dictionary):String
		{
			if (dictionary == null)
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
									 
	}
}