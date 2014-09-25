package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Ruben Martinez
	 */
	public class Tinki extends Player 
	{
		public function Tinki(x:Number = 0, y:Number = 0) 
		{
			super();
			
			this.x = x - this.width / 2;
			this.y = y;
			
			// Tinki keys are the default ones (arrow keys)
			this.type = GC.TYPE_PLAYER_1;
		}
	}
}