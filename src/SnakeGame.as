package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	
	[SWF(width="400", height="400", frameRate="24", backgroundColor="#0")]
	public class SnakeGame extends Sprite
	{
		private var _game:Game;
		public function SnakeGame()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(e:Event):void{
			_game = new Game();
		}
	}
}