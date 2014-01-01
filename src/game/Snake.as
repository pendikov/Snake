package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Snake extends Sprite
	{
		private var _speed:Number = 10;
		private var _elements:Array = [];
		private var _timer:Timer;
		public function Snake()
		{
			this.x = 195;
			this.y = 195;
			_elements.push(new Food(0, 0));
			addChild(_elements[0]);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_timer = new Timer(250, 0);
		}
		private function onAddedToStage(e:Event):void{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		private function onKeyDown(e:KeyboardEvent):void{
			trace(e.keyCode);
			switch (e.keyCode){
				case 37:
					_timer.removeEventListener(TimerEvent.TIMER, moveRight);
					_timer.removeEventListener(TimerEvent.TIMER, moveUp);
					_timer.removeEventListener(TimerEvent.TIMER, moveDown);
					_timer.addEventListener(TimerEvent.TIMER, moveLeft);					
					_timer.start();					
					break;
				case 38:
					_timer.removeEventListener(TimerEvent.TIMER, moveRight);
					_timer.removeEventListener(TimerEvent.TIMER, moveLeft);					
					_timer.removeEventListener(TimerEvent.TIMER, moveDown);
					_timer.addEventListener(TimerEvent.TIMER, moveUp);
					_timer.start();	
					break;
				case 39:
					_timer.removeEventListener(TimerEvent.TIMER, moveUp);
					_timer.removeEventListener(TimerEvent.TIMER, moveDown);
					_timer.removeEventListener(TimerEvent.TIMER, moveLeft);
					_timer.addEventListener(TimerEvent.TIMER, moveRight);
					_timer.start();					
					break;
				case 40:
					_timer.removeEventListener(TimerEvent.TIMER, moveRight);
					_timer.removeEventListener(TimerEvent.TIMER, moveLeft);
					_timer.removeEventListener(TimerEvent.TIMER, moveUp);
					_timer.addEventListener(TimerEvent.TIMER, moveDown);
					_timer.start();	
					break;
				default:
					trace(e.keyCode);
					break;
			}
		}
		private function moveRight(e:TimerEvent):void{
			//trace(this.width);
			if (this.x <stage.stageWidth - this.width - _speed)
				this.x += _speed;
		}
		private function moveLeft(e:TimerEvent):void{
			if (this.x > _speed)
				this.x -= _speed;
		}
		private function moveUp(e:TimerEvent):void{
			if (this.y > _speed)
				this.y -= _speed;
		}
		private function moveDown(e:TimerEvent):void{
			if (this.y <stage.stageHeight - this.height -  _speed)
				this.y += _speed;
		}
	}
}