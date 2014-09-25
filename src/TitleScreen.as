package  {
	import entities.Tinki;
	import flash.events.TextEvent;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import entities.Bg1;
	
	/**
	 * ...
	 * @author ...
	 */
	public class TitleScreen extends World {
		
		private var titleText:Text;
		private var insText:Text;
		private var startText:Text;
		private var creditsText:Text;
		// Background
		private const bg:Image = new Image(GC.GFX_BG0);
		
		// Tinki
		private var tinki:Entity = new Entity( -80, 175);
		private var spr_tinki:Spritemap = new Spritemap(GC.GFX_TINKI, 80, 60);
		// Remi
		private var remi:Entity = new Entity(FP.screen.width, 355);
		private var spr_remi:Spritemap = new Spritemap(GC.GFX_REMI, 80, 60);
		
		private var xDir:int = 1;
		
		public function TitleScreen()
		{
			titleText = new Text("TINKI MEAL", 0, 25, FP.screen.width);
			titleText.font = "TitleFont";
			titleText.align = "center";
			titleText.size = 90;
			
			insText = new Text("CONSIGUE LAS DELICIOSAS LARVAS ROJAS", 0, 275, FP.screen.width);
			insText.align = "center";
			insText.size = 30;
			
			startText = new Text("Pulsa 1 para un jugador\nPulsa 2 para dos jugadores", 0, 455, FP.screen.width);
			startText.align = "center";
			startText.size = 30;
			
			creditsText = new Text("Realizado por Ruben Martinez Vilar. Fondo por Cristina Palomares Crespo.\nGracias a Flashpunk y FlashDevelop.", 0, FP.screen.height-50, FP.screen.width);
			creditsText.align = "center";
			creditsText.size = 18;
			
			// Background
			addGraphic(bg);
			
			// Tinki
			spr_tinki.add("swim", [0, 1, 2, 3, 4, 5], 10, true);
			tinki.graphic = spr_tinki;
			add(tinki);
			spr_tinki.play("swim");
			
			// Remi
			spr_remi.add("swim", [0, 1, 2, 3, 4, 5], 10, true);
			remi.graphic = spr_remi;
			add(remi);
			spr_remi.play("swim");
			spr_remi.flipped = true;
			
			// Text
			addGraphic(titleText);
			addGraphic(insText);
			addGraphic(startText);
			addGraphic(creditsText);
		}
		
		override public function update():void
		{	
			// Tinki swimming around
			if (tinki.x > FP.screen.width + 100 || tinki.x < -100) {
				xDir *= -1;
				spr_tinki.flipped = !spr_tinki.flipped;
				spr_remi.flipped = !spr_remi.flipped;
			}
			
			tinki.x += FP.elapsed * 100 * xDir;
			remi.x += FP.elapsed * 100 * -xDir;
			
			if (Input.check(Key.DIGIT_1)) { FP.world = new GameWorld_1player(); }
			else if (Input.check(Key.DIGIT_2)) { FP.world = new GameWorld_2players(); }
			super.update();
		}
		
	}

}