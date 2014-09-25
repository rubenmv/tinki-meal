package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Ruben Martinez
	 */
	public class Remi extends Player 
	{
		
		public function Remi(x:Number = 0, y:Number = 0) 
		{
			super();
			
			this.x = FP.screen.width - (FP.screen.width / 4) - this.width;
			this.y = 300;
			
			spr = new Spritemap(GC.GFX_REMI, 80, 60);
			spr.add("stand", [0, 1, 2, 3, 4, 5], 3, true);
			spr.add("swim", [0, 1, 2, 3, 4, 5], 10, true);
			spr.add("hit", [6], 0, true);
			this.graphic = spr;
			// Face tinki
			spr.flipped = true;
			
			// Remi motion keys
			leftKey = Key.LEFT;
			rightKey = Key.RIGHT;
			upKey = Key.UP;
			downKey = Key.DOWN;
						
			this.type = GC.TYPE_PLAYER_2;
		}
	}
}