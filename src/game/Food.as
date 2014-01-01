package game
{
	import flash.display.Sprite;

	public class Food extends Sprite
	{
		public function Food(x:Number, y:Number)
		{
			this.graphics.beginFill(0xffff00);
			this.graphics.drawRect(x, y, 10, 10);
			this.graphics.endFill();
		}
	}
}