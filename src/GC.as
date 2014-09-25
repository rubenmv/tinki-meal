package  
{
	/**
	 * ...
	 * @author Ruben Martinez
	 */
	
	public class GC 
	{
		/*
		 * GRAPHICS
		 */
		
		// Tinki
		[Embed(source = '../assets/graphics/Tinki.png')]
		public static const GFX_TINKI:Class;
		
		// Remi
		[Embed(source = '../assets/graphics/Remi.png')]
		public static const GFX_REMI:Class;
		
		// Food
		[Embed(source = '../assets/graphics/larva_roja.png')]
		public static const GFX_FOOD_RED:Class;
		
		[Embed(source = '../assets/graphics/larva_verde.png')]
		public static const GFX_FOOD_GREEN:Class;
		
		// Title Screen Background
		[Embed(source = '../assets/graphics/background0.jpg')]
		public static const GFX_BG0:Class;
		
		// Game World Background
		[Embed(source = '../assets/graphics/background1.jpg')]
		public static const GFX_BG1:Class;
		
		// Game World Background Animation
		[Embed(source = '../assets/graphics/background1Move.jpg')]
		public static const GFX_BG1_MOTION:Class;
		
		// Controls graphic
		[Embed(source = "../assets/graphics/keys_wasd.png")]
		public static const GFX_CONTROLS_WASD:Class;
		
		[Embed(source="../assets/graphics/keys_arrows.png")]
		public static const GFX_CONTROLS_ARROWS:Class;

		// Fonts
		[Embed(source = '../assets/fonts/BUBBB___.TTF',
				fontFamily = 'MainFont',
				mimeType = 'application/x-font',
				embedAsCFF = 'false')]
		public static const GFX_MAINFONT:Class
		
		[Embed(source = '../assets/fonts/GFSCUS1D.TTF',
				fontFamily = 'TitleFont',
				mimeType = 'application/x-font',
				embedAsCFF = 'false')]
		public static const GFX_TITLEFONT:Class
		
		/*
		 * MUSIC AND SOUNDS
		 */
		
		// Music GameWorld
		[Embed(source = '../assets/music/GameWorld.mp3')]
		public static const SFX_GW:Class;
		
		// Music GameOverScreen
		[Embed(source = '../assets/music/over.mp3')]
		public static const SFX_OVER:Class;
		
		/*
		* OTHER CONSTANTS
		*/
		
		// Types
		public static const TYPE_FOOD_1:String = "red";
		public static const TYPE_FOOD_2:String = "green";
		public static const TYPE_PLAYER:String = "player";
		public static const TYPE_PLAYER_1:String = "tinki";
		public static const TYPE_PLAYER_2:String = "remi";
		
		// Food spawn chance
		public static const FOOD_SPAWN_CHANCE:Number = 0.65;
		
		// SPEEDS
		// Food
		public static const FOOD_SPEED_MIN:Number = 150;
		
		// Player
		public static const PLAYER_FRICTION:Number = 0.97;
		public static const PLAYER_ACCEL:Number=0.2;
		
		// TIME AND SCORE CONSTANTS
		public static const FOOD_RED_SCORE:int = 10;
		public static const FOOD_GREEN_SCORE:int = 5;
		public static const INIT_TIME:int = 40;
		public static const INIT_SCORE:int = 0;
		public static const START_TIME:int = 3;
		public static const HIT_TIME:int = 1;
		
	}

}