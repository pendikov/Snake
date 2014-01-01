package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;

	public class Snake extends Sprite
	{
		public static const HIT_WALL:String = "hitWall";
		public static const TOUCH_FOOD:String = "touchFood";
		private var _speed:Number = 10;
		private var _elements:Array = [];
		
		public function Snake()
		{
			this.x = 195;
			this.y = 195;
			_elements.push(new Food());
			addChild(_elements[0]);	
			this.addEventListener(TOUCH_FOOD, eatFood);
		}		
		
		public function moveRight(e:TimerEvent):void{
			if (this.x <stage.stageWidth - this.width - _speed)
				this.x += _speed;
			else 
				this.dispatchEvent(new Event(HIT_WALL));
		}
		public function moveLeft(e:TimerEvent):void{
			if (this.x > _speed)
				this.x -= _speed;
			else 
				this.dispatchEvent(new Event(HIT_WALL));
		}
		public function moveUp(e:TimerEvent):void{
			if (this.y > _speed)
				this.y -= _speed;
			else 
				this.dispatchEvent(new Event(HIT_WALL));
		}
		public function moveDown(e:TimerEvent):void{
			if (this.y <stage.stageHeight - this.height -  _speed)
				this.y += _speed;
			else 
				this.dispatchEvent(new Event(HIT_WALL));
		}
		public function get head():Food{
			return _elements[0];
		}
		private function eatFood(e:Event):void{
			trace("numnum");
		}
	}
}