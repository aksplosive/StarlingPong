package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	/** 
	 * Starling Pong Class - Entry point into the game
	 */
	[SWF(width="600", height="400", frameRate="60", backgroundColor="#ffffff")]
	public class StarlingPong extends Sprite
	{
		private var mStarling:Starling;
		
		public function StarlingPong()
		{
			// These settings are recommended to avoid problems with touch handling
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			// Create a Starling instance that will run the "Game" class
			mStarling = new Starling(Game, stage);
			mStarling.start();
		}
	}
}