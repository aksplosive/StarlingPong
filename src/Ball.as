package
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.textures.Texture;
	
	/** 
	 * The Ball class represents the in-game ball
	 */
	public class Ball extends starling.display.Sprite
	{
		private var m_radius:uint = 10; /** radius of the ball */
		private var m_color:uint = 0x000000; /** color of the ball */
		
		private var vX:Number = 6; /** x velocity of the ball */
		private var vY:Number = 6; /** y velocity of the ball */
		
		private var m_p1Score:int = 0; /** player one score */
		private var m_p2Score:int = 0; /** player two score */
		
		public function Ball()
		{
		}
		
		/** 
		 * Creates a ball by drawing a circle and creating a starling image from it
		 */
		public function draw():void
		{
			var sprite:flash.display.Sprite = new flash.display.Sprite();
			with(sprite.graphics)
			{
				beginFill(m_color, 1);
				drawCircle(m_radius, m_radius, m_radius);
				endFill();
			}
			var bmd:BitmapData = new BitmapData(m_radius *2, m_radius *2, true, 0xffffff);
			bmd.draw(sprite);
			var texture:Texture = Texture.fromBitmapData(bmd);
			var image:Image = new Image(texture);
			this.addChild(image);
		}
		
		/** 
		 * Set starting position for the ball at the center of the board
		 */
		public function setStartPosition():void
		{
			this.x = Starling.current.stage.stageWidth * 0.5;
			this.y = Starling.current.stage.stageHeight * 0.5;
		}
		
		/** 
		 * Update ball position
		 */
		public function updatePosition():void
		{
			this.x += vX;
			this.y += vY;
		}
		
		/** 
		 * Detect collision with walls or the paddles
		 */
		public function detectCollision(playerOne:Paddle, playerTwo:Paddle):void
		{
			//detect wall collision
			detectWallCollision();
			//detect paddle collisions
			detectPaddleCollision(playerOne);
			detectPaddleCollision(playerTwo);
		}
		
		/** 
		 * Detect collision with walls
		 */
		private function detectWallCollision():void
		{
			//hits left or right walls
			if (this.x < 0)
			{
				this.x = 0;
				vX *= -1;
				m_p2Score++;
			}
			else if (this.x > Starling.current.stage.stageWidth)
			{
				this.x = Starling.current.stage.stageWidth - this.width;
				vX *= -1;
				m_p1Score++;
			}
			//hits upper or lower walls
			if (this.y < 0)
			{
				this.y = 0;
				vY *= -1;
			}
			else if(this.y > Starling.current.stage.stageHeight - this.height)
			{
				this.y = Starling.current.stage.stageHeight - this.height;
				vY *= -1;
			}
		}
		
		/** 
		 * Detect collision with a paddle
		 */
		private function detectPaddleCollision(paddle:Paddle):void
		{
			//see if paddle bounds intersect with ball bounds
			var paddleRect:Rectangle = paddle.getBounds(this);
			var ballRect:Rectangle = this.getBounds(this);
			if(paddleRect.intersects(ballRect))
			{
				vX *= -1;
			}
		}
		
		/** 
		 * player one score 
		 */
		public function get p1Score():int
		{
			return m_p1Score;
		}
		
		/** 
		 * player two score
		 */
		public function get p2Score():int
		{
			return m_p2Score;
		}
	}
}