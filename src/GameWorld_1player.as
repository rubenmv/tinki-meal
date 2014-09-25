package  
{
	import flash.events.TextEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import entities.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
		
	/**
	 * ...
	 * @author Ruben Martinez
	 */
	public class GameWorld_1player extends World 
	{
		private var scoreText:Text;
		private var timeText:Text;
		private var beginText:Text;
		private var pauseText:Text;
		private var restartText:Text;
		private var pause:Boolean = false;
		private var startGame:Boolean = false;
		private var beginTextEntity:Entity;
		private var music:Sfx = new Sfx(GC.SFX_GW);
		private var tinki:Tinki;
		private const controlsTinki:Entity = new Entity();

		public function GameWorld_1player()
		{
			super();
		}
		
		override public function begin():void 
		{
			// Init variables at GV
			GV.ScoreTinki = GC.INIT_SCORE;
			GV.Time = GC.INIT_TIME;
			
			startGame = false;
			
			add(new Bg1);
			add(new Bg1Anim);
			
			tinki = new Tinki(FP.screen.width / 2, 300);
			add(tinki);
			
			controlsTinki.graphic = new Image(GC.GFX_CONTROLS_WASD);
			controlsTinki.x = tinki.x - tinki.width / 2;
			controlsTinki.y = tinki.y + tinki.height;
			add(controlsTinki);
			
			// HUD content and position
			scoreText = new Text("PUNTOS\n"+GC.INIT_SCORE.toString(), 15, 35, FP.screen.width);
			timeText = new Text(GC.INIT_TIME.toString(), 0, 45, FP.screen.width);
			pauseText = new Text("'P' para pausar", 15, FP.screen.height - 30, FP.screen.width);
			restartText = new Text("'R' para reiniciar", -15, FP.screen.height - 30, FP.screen.width);
			beginText = new Text("HORA DE COMER", 0, 150, FP.screen.width);
			
			// HUD text align
			scoreText.align = "left";
			timeText.align = "center";
			beginText.align = "center";
			pauseText.align = "left";
			restartText.align = "right";
			
			// HUD text sizes
			scoreText.size = 30;
			timeText.size = 50;
			pauseText.size = 20;
			restartText.size = 20;
			beginText.size = 80;
			
			// HUD graphics
			beginTextEntity = addGraphic(beginText);
			addGraphic(scoreText);
			addGraphic(timeText);
			addGraphic(pauseText);
			addGraphic(restartText);
			
			music.loop();
			
			super.begin();
		}
		
		override public function update():void 
		{
			
			
			// Restart game if press R
			if (Input.pressed(Key.R))
			{
				music.stop();
				FP.world = new GameWorld_1player();
			}
			
			
			if (startGame)
			{
				if (!pause)
				{
					GV.Frame++;
					
					if (GV.Frame == 60)
					{
						// Don't drop food on the last second
						if (GV.Time > 1)
						{
							// Food chance
							if (FP.random > GC.FOOD_SPAWN_CHANCE) add(new Food(GC.TYPE_FOOD_2));
							else add(new Food(GC.TYPE_FOOD_1));
						}
						
						GV.Frame = 0;
						GV.Time--;
						
						// End game
						if (GV.Time == 0)
						{
							music.stop();
							FP.world = new GameOverScreen_1player();
						}
					}

					scoreText.text = "PUNTOS\n"+GV.ScoreTinki.toString();
					timeText.text = GV.Time.toString();

					super.update();
				}
			
				// Toggles pause variable
				if (Input.pressed(Key.P))
				{
					pause = !pause;
					if (music.volume == 0.2) music.volume = 1;
					else music.volume = 0.2;
				}
			}
			else
			{
				GV.Frame++;
				
				// Start text
				if (GV.Frame < 120)
				{
					// Awesome FX
					if (GV.Frame % 10 == 0)
					{
						beginTextEntity.visible = !beginTextEntity.visible;
					}					
				}
				// After 2 seconds starts game
				else
				{
					remove(beginTextEntity);
					remove(controlsTinki);
					startGame = true;
					GV.Frame = 0;
				}
				
			}

			
			 
		}
	}
}