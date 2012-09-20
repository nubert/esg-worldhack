package com.esg.parzns.core
{
	import flash.events.Event;
	
	public class BaseLoaderEvent extends Event
	{
		public static const LOAD_COMPLETE:String = "loadComplete";
		
		private var response:*;
		
		public function BaseLoaderEvent(type:String, response:*, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.response = response;
			super(type, bubbles, cancelable);
		}
		
		public function getResponse():*
		{
			return response;
		}	
	}
}