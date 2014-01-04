package game
{
	public class GameMath
	{
		public function GameMath()
		{
		}
		public static function randomCoordinate(num:Number = 0):Number{
			num = (num!=0)?num:Math.floor(Math.random() * 385);
			num = num+5 - num%5;
			num = (num%10==0)?num+5:num;
			return num;
		}
	}
}