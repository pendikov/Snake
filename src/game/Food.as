package game
{
	import flash.display.Sprite;

	public class Food extends Sprite
	{
		public function Food()
		{
			this.graphics.beginFill(0xffff00);
			this.graphics.drawRect(0, 0, 10, 10);
			this.graphics.endFill();
		}
	}
}