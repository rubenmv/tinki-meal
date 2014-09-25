package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Bg1Anim extends Entity 
	{
		private var sprBg:Spritemap = new Spritemap(GC.GFX_BG1_MOTION, 539, 132);
		
		public function Bg1Anim()
		{
			super(138,0);
						
			sprBg.add("move", [0, 1], 2, true);
			this.graphic = sprBg;
			
			sprBg.play("move");
		}
		
	}

}