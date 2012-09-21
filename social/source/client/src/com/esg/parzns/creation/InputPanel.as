package com.esg.parzns.creation
{
	import com.adobe.net.URI;
	import com.esg.parzns.core.BaseLoader;
	import com.esg.parzns.core.BaseLoaderEvent;
	import com.esg.parzns.core.GlobalDisptacher;
	import com.esg.parzns.core.PhraseEvent;
	import com.esg.parzns.core.gameplay.GameData;
	import com.esg.parzns.core.gameplay.GameVote;
	import com.esg.parzns.core.gameplay.PlayerInfo;
	
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.TextInput;
	
	public class InputPanel extends Group
	{
		public var text1:TextInput;
		public var text2:TextInput;
		public var text3:TextInput;
		public var submit:Button;
		
		private var gameData:GameData;
		
		public function InputPanel()
		{
			super();
			
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		public function setItems(gameData:GameData):void
		{
			this.gameData = gameData;
		}
		
		public function onCreationComplete(e:FlexEvent):void
		{
			submit.addEventListener(MouseEvent.CLICK, onSubmit);
		}
		
		private function onSubmit(e:MouseEvent):void
		{
			var submitLoader:BaseLoader = new BaseLoader();
			var params:Dictionary = new Dictionary();
			params["fbuid"] = PlayerInfo.getUserId();
			params["gameId"] = gameData.gameId;
			params["phrase"] = text1.text + " " + text2.text + " " + text3.text;
			
			submitLoader.addEventListener(BaseLoaderEvent.LOAD_COMPLETE, onPhraseAdded);
			submitLoader.setCall("addPhrase.php", params);
		}
		
		private function onPhraseAdded(e:BaseLoaderEvent):void
		{
			var response = e.getResponse();
			
			if (response.success == true)
			{
				GlobalDisptacher.disptacher.dispatchEvent(new PhraseEvent(PhraseEvent.PHRASE_ADDED, gameData));
			}
		}
	}
}