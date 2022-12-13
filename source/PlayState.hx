package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import haxe.ds.BalancedTree;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	var player1:Paddle;
	var player2:Paddle;

	var ball:Ball;

	var line:Line;

	function hitBall(player:Paddle, ball:Ball)
	{
		if (player == player1)
			ball.lastPlayer = Player1;
		else
			ball.lastPlayer = Player2;

		ball.moveAngle = 180 - ball.moveAngle;
	}

	override public function create()
	{
		// create center line
		line = new Line(320, 0);

		// create ball
		ball = new Ball(315, 235);

		// create player 1 and 2
		player1 = new Paddle(20, 240 - 25, Player1);
		player2 = new Paddle(610, 240 - 25, Player2);

		// add line
		add(line);

		// add ball
		add(ball);

		// add players to the game
		add(player1);
		add(player2);

		#if debug
		//fbi
		FlxG.watch.add(player1, "x", "player 1 x");
		FlxG.watch.add(player1, "y", "player 1 y");

		FlxG.watch.add(player2, "x", "player 2 x");
		FlxG.watch.add(player2, "y", "player 2 y");

		// console command to make the paddles move around freely
		FlxG.console.registerFunction("free", function(){
			player1.axisLocked = false;
			player2.axisLocked = false;
		});
		#end

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.collide(player1, ball, hitBall);
		FlxG.collide(player2, ball, hitBall);
	}
}

class Line extends FlxSprite
{
	public function new(x, y)
	{
		super(x, y);

		makeGraphic(1, 480, FlxColor.WHITE);
	}
}