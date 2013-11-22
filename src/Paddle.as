package
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/** 
	 * The Paddle class represents the in-game paddle that the two players use to hit the ball 
	 */
	public class Paddle extends starling.display.Sprite
	{
		private var m_width:uint = 15; /** width of the paddle */
		private var m_height:uint = 100; /** height of the paddle */
		private var m_color:uint = 0x000000; /** color of the paddle */
		
		public function Paddle()
		{
		}
		
		/** 
		 * Creates a paddle by drawing a rectangle and creating a starling image from it
		 */
		public function draw():void
		{
			var sprite:flash.display.Sprite = new flash.display.Sprite();
			with(sprite.graphics) 
			{
				beginFill(m_color, 1);
				drawRect(0, 0, m_width, m_height);
				endFill();
			}
			
			var bmd:BitmapData = new BitmapData(m_width, m_height, true, 0xffffff);
			bmd.draw(sprite);
			var texture:Texture = Texture.fromBitmapData(bmd);
			var image:Image = new Image(texture);
			this.addChild(image);
		}
		
		public function setStartPosition():void
		{
		}
	}
}