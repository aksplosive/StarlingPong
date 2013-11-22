package
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import starling.core.Starling;
	
	/** 
	 * PlayerOne is the paddle of the left player. It responds to keyboard keys 'W' and 'S' for moving up and down respectively 
	 */
	public class PlayerOne extends Paddle
	{
		private var wKeyDown:Boolean; /** to detect when a player has pushed down the W key */
		private var sKeyDown:Boolean; /** to detect when a player has pushed down the S key */
		
		private var offset:Number = 2; /** the offset for each key press */
		private var vY:Number = 0; /** y velocity */
		
		private var friction:Number = 0.1; /** friction for the paddle when key press stops */
		private var maxSpeed:Number = 3; /** maximum y velocity */
		
		public function PlayerOne()
		{
			Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		/** 
		 * Initial position for the left player
		 */
		override public function setStartPosition():void
		{
			this.x = 0;
			this.y = Starling.current.stage.stageHeight * .5 - (height * .5);
		}
		
		/** 
		 * On keyboard key down
		 */
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W) 
			{
				wKeyDown = true;
			}
			else if (e.keyCode == Keyboard.S)
			{
				sKeyDown = true;
			}
		}
		
		/** 
		 * On keyboard key up
		 */
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W) 
			{
				wKeyDown = false;
			}
			else if (e.keyCode == Keyboard.S)
			{
				sKeyDown = false;
			}
		}
		
		/** 
		 * For each frame, update the position of the paddle
		 */
		public function updatePosition():void
		{
			if (wKeyDown)
			{
				vY -= offset;
			}
			else if (sKeyDown)
			{
				vY += offset;
			}
			else 
			{
				vY *= friction;
			}
			
			this.y += vY;
			
			if (vY > maxSpeed)
			{
				vY = maxSpeed;
			}
				
			else if (vY < - maxSpeed)
			{
				vY = - maxSpeed;
			}
			
			//set limits
			if(this.y < 0)
			{
				this.y = 0;
			}
			if(this.y > Starling.current.stage.stageHeight - this.height)
			{
				this.y = Starling.current.stage.stageHeight - this.height;
				
			}
			
		}
	}
}