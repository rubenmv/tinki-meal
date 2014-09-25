package 
{
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author Ruben Martinez
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(800, 600, 60, false);
			FP.screen.color = 0x666666;
			//FP.console.enable();
		}

		override public function init():void 
		{
			FP.world = new TitleScreen();
			super.init();
		}
	}
	
}