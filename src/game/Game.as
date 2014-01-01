package game
{
	import flash.display.Sprite;

	public class Game extends Sprite
	{
		private var _foodGenerator:FoodGenerator;
		private var _snake:Snake;
		public function Game()
		{
			_foodGenerator = new FoodGenerator();
			_snake = new Snake();
			addChild(_snake);
			//_food = new Food(100, 100);
			//addChild(_food);
		}
	}
}