package game
{
	public class FoodGenerator
	{
		public function FoodGenerator()
		{	
		}
		public function makeFood():Food{
			var x:Number = randomCoordinate();
			var y:Number = randomCoordinate();
			var food:Food = new Food();
			food.x = x;
			food.y = y;
			return food;
		}
		private function randomCoordinate():Number{
			var num:Number = Math.floor(Math.random() * 385);
			num = num+5 - num%5;
			num = (num%10==0)?num+5:num;
			return num;
		}
	}
}