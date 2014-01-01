package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;

	public class Snake extends Sprite
	{
		public static const HIT_WALL:String = "hitWall";
		public static const TOUCH_FOOD:String = "touchFood";
		public var speed:Number = 10;
		
		//public function set speed(value:Number):void{_speed = value; }
		private var _elements:Array = [];
		
		public var isMovingLeft:Boolean = false;
		public var isMovingRight:Boolean = false;
		public var isMovingUp:Boolean = false;
		public var isMovingDown:Boolean = false;
		
		public function Snake()
		{
			this.x = 195;
			this.y = 195;
			_elements.push(new Food());
			addChild(_elements[0]);	
			this.addEventListener(TOUCH_FOOD, eatFood);
		}		
		
		public function moveRight(e:TimerEvent):void{
			if (this.x <stage.stageWidth - this.width - speed){
				isMovingRight = true;				
				takePlaceOfPrevious();
				_elements[0].x += speed;
			}				
			else 
				this.dispatchEvent(new Event(HIT_WALL));
		}
		public function moveLeft(e:TimerEvent):void{
			if (this.x > speed){
				isMovingLeft = true;
				takePlaceOfPrevious();
				_elements[0].x -= speed;
			}
			else 
				this.dispatchEvent(new Event(HIT_WALL));
		}
		public function moveUp(e:TimerEvent):void{
			if (this.y > speed){
				isMovingUp = true;				
				takePlaceOfPrevious();
				_elements[0].y -= speed;
			}
			else 
				this.dispatchEvent(new Event(HIT_WALL));
		}
		public function moveDown(e:TimerEvent):void{
			if (this.y <stage.stageHeight - this.height -  speed){
				isMovingDown = true;				
				takePlaceOfPrevious();
				_elements[0].y += speed;
			}
			else 
				this.dispatchEvent(new Event(HIT_WALL));
		}
		public function get head():Food{
			return _elements[0];
		}
		private function eatFood(e:Event):void{
			trace("numnum");
			var food:Food = new Food();

			_elements.push(food);
			addChild(food);
		}
		private function takePlaceOfPrevious():void{
			for (var i:uint=_elements.length-1; i>0; i--){
				_elements[i].x = _elements[i-1].x;
				_elements[i].y = _elements[i-1].y;
			}
		}
	}
}