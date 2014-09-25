package  
{
	import net.flashpunk.graphics.Spritemap;
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
	public class GameOverScreen_2players extends World 
	{
		private var endText:Text;
		private var pointsText:Text;
		private var scoreTinkiText:Text;
		private var scoreRemiText:Text;
		private var restartText:Text;
		private var scoreCountTinki:int = 0;
		private var scoreCountRemi:int = 0;
		private var endOfEverything:Boolean = false;
		private var music:Sfx = new Sfx(GC.SFX_OVER);
		// Background
		private const bg:Image = new Image(GC.GFX_BG0);
		// Tinki and Remi sprites and entities
		private var sprTinki:Spritemap = new Spritemap(GC.GFX_TINKI, 80, 60);
		private var sprRemi:Spritemap = new Spritemap(GC.GFX_REMI, 80, 60);
		private var tinki:Entity = new Entity(-80, 380);
		private var remi:Entity = new Entity(FP.screen.width, 380);
		
		public function GameOverScreen_2players() 
		{
			super();
		}
		
		override public function begin():void 
		{
			endText = new Text("FIN DEL TIEMPO", 0, 100, FP.screen.width);
			endText.size = 50;
			endText.align = "center";
			
			pointsText = new Text("PUNTOS", 0, 200, FP.screen.width);
			pointsText.size = 50;
			pointsText.align = "center";
			
			scoreTinkiText = new Text("TINKI\n" + scoreCountTinki.toString() , 50, 250, FP.screen.width)
			scoreTinkiText.size = 50;
			scoreTinkiText.align = "left";
			
			scoreRemiText = new Text("REMI\n"+scoreCountRemi.toString(), -50, 250, FP.screen.width)
			scoreRemiText.size = 50;
			scoreRemiText.align = "right";
			
			restartText = new Text("Pulsa ESPACIO para reiniciar", 0, 500, FP.screen.width);
			restartText.size = 30;
			restartText.align = "center";
			
			// Background
			addGraphic(bg);
			
			addGraphic(endText);
			addGraphic(pointsText);
			addGraphic(scoreTinkiText);
			addGraphic(scoreRemiText);
			
			// Tinki and remi sprites
			if (GV.ScoreTinki > GV.ScoreRemi) // Tinki wins
			{
				sprTinki.add("tinki", [0, 1, 2, 3, 4, 5], 10, true);
				sprRemi.add("remi", [6], 0, true);
			}
			else if (GV.ScoreTinki < GV.ScoreRemi) // Remi wins
			{
				sprTinki.add("tinki", [6], 0, true);
				sprRemi.add("remi", [0, 1, 2, 3, 4, 5], 10, true);
			}
			else // Draw
			{
				sprTinki.add("tinki", [0, 1, 2, 3, 4, 5], 10, true);
				sprRemi.add("remi", [0, 1, 2, 3, 4, 5], 10, true);
			}
			sprRemi.flipped = true;
			tinki.graphic = sprTinki;
			remi.graphic = sprRemi;
			add(tinki);
			add(remi);
			sprTinki.play("tinki");
			sprRemi.play("remi");
			
			music.play();
			
			super.begin();
		}
		
		override public function update():void 
		{
			if(!endOfEverything)
			{
				// If counters has ended, move sprites
				if(scoreCountTinki == GV.ScoreTinki && scoreCountRemi == GV.ScoreRemi)
				{
					// If sprites are on place, end count
					if(tinki.x > 80)
					{
						addGraphic(restartText);
						endOfEverything = true;
					}
					else // Not in place, keep moving
					{
						tinki.x += FP.elapsed * 100;
						remi.x -= FP.elapsed * 100;
					}
				}
				else
				{
					if (Input.pressed(Key.SPACE))
					{
						scoreCountTinki = GV.ScoreTinki;
						scoreCountRemi = GV.ScoreRemi;
					}
					else
					{
						if(scoreCountTinki < GV.ScoreTinki) scoreCountTinki++;
						if(scoreCountRemi < GV.ScoreRemi) scoreCountRemi++;
					}
					
					scoreTinkiText.text = ("TINKI\n"+scoreCountTinki.toString());
					scoreRemiText.text = ("REMI\n"+scoreCountRemi.toString());
					
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