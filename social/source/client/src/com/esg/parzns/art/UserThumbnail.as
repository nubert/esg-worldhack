package com.esg.parzns.art
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.primitives.BitmapImage;
	
	public class UserThumbnail extends Group
	{
		public function UserThumbnail()
		{
			super();
		}

		public function setThumbnail(id:String):void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.load(new URLRequest("http://graph.facebook.com/" + id +"/picture"), new LoaderContext());	
		}
		
		private function onLoadComplete(e:Event):void
		{
			var bitmap:BitmapImage = new BitmapImage();
			bitmap.source = e.target.content as Bitmap;
			this.addElement(bitmap);
		}
	}
}