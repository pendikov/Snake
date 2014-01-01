package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Game extends Sprite
	{
		private var _foodGenerator:FoodGenerator;
		private var _snake:Snake;
		private var _timer:Timer;
		private var _food:Food;
		public function Game()
		{
			this.x = 0;
			this.y = 0;
			_snake = new Snake();
			addChild(_snake);		
			_foodGenerator = new FoodGenerator();
			makeFood();
			_timer = new Timer(250, 0);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_timer.addEventListener(TimerEvent.TIMER, timerHandler);
			_timer.start();	
		}
		private function onAddedToStage(e:Event):void{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		private function onKeyUp(e:KeyboardEvent):void{
			_snake.speed = 10;
		}
		private function onKeyDown(e:KeyboardEvent):void{
			trace(e.keyCode);
			switch (e.keyCode){
				case 37:
					if (!_snake.isMovingRight){
						_snake.isMovingUp = false;
						_snake.isMovingDown = false;
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveRight);
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveUp);
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveDown);
						_timer.addEventListener(TimerEvent.TIMER, _snake.moveLeft);	
					}
					if(_snake.isMovingLeft)
						_snake.speed +=1;
					break;
				case 38:
					if (!_snake.isMovingDown){
						_snake.isMovingLeft = false;
						_snake.isMovingRight = false;
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveRight);
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveLeft);					
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveDown);
						_timer.addEventListener(TimerEvent.TIMER, _snake.moveUp);
					}
					if(_snake.isMovingUp)
						_snake.speed +=1;
					break;
				case 39:
					if (!_snake.isMovingLeft){
						_snake.isMovingUp = false;
						_snake.isMovingDown = false;
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveUp);
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveDown);
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveLeft);
						_timer.addEventListener(TimerEvent.TIMER, _snake.moveRight);	
					}
					if(_snake.isMovingRight)
						_snake.speed +=1;
					break;
				case 40:
					if (!_snake.isMovingUp){
						_snake.isMovingLeft = false;
						_snake.isMovingRight = false;
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveRight);
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveLeft);
						_timer.removeEventListener(TimerEvent.TIMER, _snake.moveUp);
						_timer.addEventListener(TimerEvent.TIMER, _snake.moveDown);	
					}
					if(_snake.isMovingDown)
						_snake.speed +=1;
					break;
				default:
					trace(e.keyCode);
					break;
			}
		}
		private function timerHandler(e:TimerEvent):void{
			if (_snake.head.hitTestPoint(_food.x+5, _food.y+5)){
				_snake.dispatchEvent(new Event(Snake.TOUCH_FOOD));
				removeChild(_food);
				makeFood();
			}
		}
		private function makeFood():void{
			_food = _foodGenerator.makeFood();
			addChild(_food);
		}
	}
}