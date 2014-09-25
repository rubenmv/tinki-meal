package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Ruben Martinez
	 */
	public class Player extends Entity 
	{
		
		protected var spr:Spritemap = new Spritemap(GC.GFX_TINKI, 80, 60);
		private var pressed:Boolean = false;
		private var xspeed:Number = 0;
		private var yspeed:Number = 0;
		private var speed:Number = 0;
		private var enemy:Player = null;
		private var hitTime:int = 0; // When gets hit, starts countdown
		// Keys
		protected var leftKey:int = Key.A;
		protected var rightKey:int = Key.D;
		protected var upKey:int = Key.W;
		protected var downKey:int = Key.S;
		
		public function Player(x:Number = 0, y:Number = 0) 
		{
			super();
			
			spr.add("stand", [0, 1, 2, 3, 4, 5], 3, true);
			spr.add("swim", [0, 1, 2, 3, 4, 5], 10, true);
			spr.add("hit", [6], 0, true);
			this.graphic = spr;
			
			this.type = GC.TYPE_PLAYER;
			
			this.setHitbox(60, 55, -10, 0);
		}
		
		override public function update():void 
		{
			pressed = false;
			
			// Check collision with other player
			checkCollision();
			
			// No hit, keyboard
			if (hitTime == 0)
			{
				if (Input.check(leftKey))
				{
					spr.flipped = true;
					xspeed -= GC.PLAYER_ACCEL;
					pressed=true;
				}

				if (Input.check(rightKey))
				{
					spr.flipped = false;
					xspeed += GC.PLAYER_ACCEL;
					pressed=true;
				}

				if (Input.check(upKey))
				{
					yspeed -= GC.PLAYER_ACCEL;
					pressed=true;
				}

				if (Input.check(downKey))
				{
					yspeed += GC.PLAYER_ACCEL;
					pressed=true;
				}
			}
			// Hit, other player speed (just first time)
			else 
			{
				if(GV.Frame == 59) hitTime--;
			}
			
			xspeed *= GC.PLAYER_FRICTION;
			yspeed *= GC.PLAYER_FRICTION;
			
			// Keep player inside boundaries
			// x
			if (x < 15)	{ x = 15; xspeed = 0; }
			else if (x > FP.screen.width - 90) { x = FP.screen.width - 90; xspeed = 0; }
			else { x += xspeed; }
			// y
			if (y < 100) { y = 100; yspeed = 0; }
			else if (y > FP.screen.height - 100) { y = FP.screen.height - 100; yspeed = 0; }
			else { y += yspeed; }
			
			// Animation
			if (hitTime > 0) { spr.play("hit"); }
			else if (pressed) { spr.play("swim"); }
			else { spr.play("stand"); }

			super.update();
		}
		
		// Gets total speed
		private function checkCollision():void
		{
			enemy = Player(this.collideTypes([GC.TYPE_PLAYER_1, GC.TYPE_PLAYER_2], x, y));
			
			// If collision sets timer
			if (enemy != null)
			{
				// So it doesn't get stuck
				if (this.xspeed > 0) this.x -= 1;
				else this.x += 1;
				if (this.yspeed > 0) this.y -= 1;
				else this.y += 1;
				
				// If enemy not nocked, check speeds
				if (enemy.getHitTime() == 0 && this.getSpeed() < enemy.getSpeed() && enemy.getSpeed() > 5)
				{
					xspeed = enemy.getXSpeed();
					yspeed = enemy.getYSpeed();
					hitTime = GC.HIT_TIME;
				}
				// If greater speed, reflects with half speed
				else
				{
					xspeed = -xspeed / 2;
					yspeed = -yspeed / 2;
				}
			}
		}
		
		// x speed
		public function getXSpeed():Number
		{
			return xspeed;
		}
		
		// y speed		
		public function getYSpeed():Number
		{
			return yspeed;
		}
		
		// Total speed
		public function getSpeed():Number
		{
			speed = Math.sqrt(Math.pow(xspeed, 2) + Math.pow(yspeed, 2));
			return speed;
		}
		
		// Hit time
		public function getHitTime():int
		{
			return hitTime;
		}
	}
}