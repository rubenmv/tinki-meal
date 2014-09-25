package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Food extends Entity 
	{
		private var speed:Number;
		private var player:Entity;
		private var xDir:int = 1;
		private const xSpeed:Number = 50;
		
		public function Food(foodType:String = "red") 
		{
			// Random b/w 32 and width-32 (32 to 768)
			super(FP.rand(FP.screen.width - 64)+32, -16);
			
			this.type = foodType;
			
			if (foodType == "red") this.graphic = new Image(GC.GFX_FOOD_RED);
			else this.graphic = new Image(GC.GFX_FOOD_GREEN);
			
			// Speed b/w FOOD_SPEED_MIN and 2*FOOD_SPEED_MIN
			this.speed = FP.rand(GC.FOOD_SPEED_MIN) + GC.FOOD_SPEED_MIN
			
			this.setHitbox(16, 16);
		}
		
		override public function update():void
		{
			this.y += FP.elapsed * this.speed;
			this.x += FP.elapsed * this.xSpeed * xDir;
			
			if (GV.Frame % 20 == 0) xDir *= -1;
			
			player = this.collideTypes([GC.TYPE_PLAYER_1, GC.TYPE_PLAYER_2], x, y)
			
			if (player != null)
			{
				if (this.type == GC.TYPE_FOOD_1)
				{
					if (player.type == GC.TYPE_PLAYER_1) GV.ScoreTinki += GC.FOOD_RED_SCORE;
					else GV.ScoreRemi += GC.FOOD_RED_SCORE;
				}
				// Substract if not zero
				else 
				{
					if (player.type == GC.TYPE_PLAYER_1 && GV.ScoreTinki >= GC.FOOD_GREEN_SCORE)
						GV.ScoreTinki -= GC.FOOD_GREEN_SCORE;
					else if (player.type == GC.TYPE_PLAYER_2 && GV.ScoreRemi >= GC.FOOD_GREEN_SCORE)
						GV.ScoreRemi -= GC.FOOD_GREEN_SCORE;
				}
				
				this.world.remove(this);
			}
			
			// Destroy food when gets to the bottom
			if (this.y > FP.screen.height-50)
			{
				this.world.remove(this);
			}
			
			super.update();
		}
	}
}