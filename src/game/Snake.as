package game
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Snake extends Sprite
	{
		private var _elements:Array = [];
		public function Snake()
		{
			_elements.push(new Food(195, 195));
			addChild(_elements[0]);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(e:Event):void{
			
		}
		public function eat():void{

		}
	}
}