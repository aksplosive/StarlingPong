package
{
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.Color;
	
	/** 
	 * Pong Game Class
	 */
	public class Game extends Sprite
	{
		private var playerOne:PlayerOne; /** left paddle */
		private var playerTwo:PlayerTwo; /** right paddle */
		private var ball:Ball; /** ball */
		private var gameBoard:GameBoard; /** game board */
		
		public function Game()
		{
			playerOne = new PlayerOne();
			playerTwo = new PlayerTwo();
			ball = new Ball();
			gameBoard = new GameBoard();
			createGame();
			setStartPositions();
			Starling.current.stage.addEventListener(Event.ENTER_FRAME, updateGameState);
		}
		
		/** 
		 * Create game components 
		 */
		private function createGame():void
		{
			/** draw the game board */
			gameBoard.draw();
			addChild(gameBoard);
			
			/** draw player one paddle */
			playerOne.draw();
			addChild(playerOne);

			/** draw player two paddle */
			playerTwo.draw();
			addChild(playerTwo);
			
			/** draw the ball */
			ball.draw();
			addChild(ball);
		}
		
		/** 
		 * Set starting positions for paddles and ball 
		 */
		private function setStartPositions():void
		{
			playerOne.setStartPosition();
			playerTwo.setStartPosition();
			ball.setStartPosition();
		}
		
		/** 
		 * For each frame, check for score changes and paddle/ball position changes 
		 */
		private function updateGameState(e:Event):void
		{
			playerOne.updatePosition();
			playerTwo.updatePosition();
			ball.updatePosition();
			ball.detectCollision(playerOne, playerTwo);
			gameBoard.setScore(ball.p1Score,ball.p2Score);
		}
	}
}