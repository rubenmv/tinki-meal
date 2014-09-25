package  
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class GameOverScreen_1player extends World 
	{
		private var endText:Text;
		private var pointsText:Text;
		private var scoreText:Text;
		private var restartText:Text;
		private var scoreCount:int = 0;
		private var countEnd:Boolean = false;
		private var music:Sfx = new Sfx(GC.SFX_OVER);
		// Background
		private const bg:Image = new Image(GC.GFX_BG0);
		
		public function GameOverScreen_1player() 
		{
			super();
		}
		
		override public function begin():void 
		{
			endText = new Text("FIN DEL TIEMPO", 0, 150, FP.screen.width);
			endText.size = 50;
			endText.align = "center";
			
			pointsText = new Text("PUNTOS", 0, 250, FP.screen.width);
			pointsText.size = 30;
			pointsText.align = "center";
			
			
			scoreText = new Text("0", 0, 300, FP.screen.width)
			scoreText.size = 50;
			scoreText.align = "center";
			
			restartText = new Text("Pulsa ESPACIO para reiniciar", 0, 500, FP.screen.width);
			restartText.size = 30;
			restartText.align = "center";
			
			// Background
			addGraphic(bg);
			
			addGraphic(endText);
			addGraphic(pointsText);
			addGraphic(scoreText);
			
			music.play();
			
			super.begin();
		}
		
		override public function update():void 
		{
			if (!countEnd)
			{
				if (scoreCount == GV.ScoreTinki)
				{
					addGraphic(restartText);
					countEnd = true;
				}
				else
				{
					if (Input.pressed(Key.SPACE)) scoreCount = GV.ScoreTinki;
					else scoreCount++;
					
					scoreText.text = scoreCount.toString();
					
				}
			}
			else if (Input.pressed(Key.SPACE))
			{
				music.stop();
				FP.world = new TitleScreen();
			}

			super.update();
		}
		
	}

}