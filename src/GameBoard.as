package 
{
	import flash.display.BitmapData;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	/** 
	 * Game board for the Pong game 
	 */
	public class GameBoard extends starling.display.Sprite
	{
		
		private var m_width:int = 0; /** board width */
		private var m_height:int = 0;/** board height */
		
		private var p1ScoreField:TextField; /** player one score */
		private var p2ScoreField:TextField; /** player two score */
		
		public function GameBoard() 
		{
			m_width = Starling.current.stage.stageWidth;
			m_height = Starling.current.stage.stageHeight;
			p1ScoreField = new TextField(40, 40, '0');
			p2ScoreField = new TextField(40, 40, '0');
		}
		
		/** 
		 * draws the game board
		 */
		public function draw():void
		{
			var sprite:flash.display.Sprite = new flash.display.Sprite();
			with(sprite.graphics) 
			{
				lineStyle(2,0x000000);
				beginFill(0x000000, 0);
				drawRect(0, 0, m_width, m_height);
				moveTo(m_width/2, 0);
				lineTo(m_width/2, m_height);
				endFill();
			}
			
			var bmd:BitmapData = new BitmapData(m_width, m_height, true, 0xffffff);
			bmd.draw(sprite);
			var texture:Texture = Texture.fromBitmapData(bmd);
			var image:Image = new Image(texture);
			this.addChild(image);
	
			p1ScoreField.x = 250;
			p1ScoreField.y = 10;
			p1ScoreField.fontSize = 14;
			this.addChild(p1ScoreField);
			p2ScoreField.x = 310;
			p2ScoreField.y = 10;
			p2ScoreField.fontSize = 14;
			this.addChild(p2ScoreField);
		}
		
		/** 
		 * Sets the score in the text fields 
		 */
		public function setScore(p1Score:int, p2Score:int ):void
		{
			p1ScoreField.text = p1Score.toString();
			p2ScoreField.text = p2Score.toString();
		}
	}
}
