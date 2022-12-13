package;

import flixel.util.FlxTimer;
import Hud.HUD;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	var player1:Paddle;
	var player2:Paddle;

	var ball:Ball;

	var line:Line;

	var hud:HUD;

	function hitBall(player:Paddle, ball:Ball)
	{
		if (player == player1)
			ball.lastPlayer = Player1;
		else
			ball.lastPlayer = Player2;

		ball.moveAngle = 180 - ball.moveAngle + FlxG.random.int(-10, 10);
	}

	function scored()
	{
		var timer:FlxTimer =  new FlxTimer().start(1, reset);

		Main.stop = true;

		hud.updateHUD(player1.score, player2.score);
	}

	function reset(timer:FlxTimer)
	{
		ball.resetBall();

		Main.stop = false;
	}

	override public function create()
	{
		// create hud
		hud = new HUD();

		// create center line
		line = new Line(320, 0);

		// create ball
		ball = new Ball(315, 235);

		// create player 1 and 2
		player1 = new Paddle(20, 240 - 25, Player1);
		player2 = new Paddle(610, 240 - 25, Player2);

		// add hud
		add(hud);

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
		FlxG.watch.add(player1, "score", "player 1 score");

		FlxG.watch.add(player2, "x", "player 2 x");
		FlxG.watch.add(player2, "y", "player 2 y");
		FlxG.watch.add(player2, "score", "player 2 score");

		FlxG.watch.add(ball, "lastPlayer", "last player hit");

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

		if (!Main.stop)
		{
			if (ball.x <= 0)
			{
				player2.score++;

				scored();
			}
			else if (ball.x >= 640)
			{
				player1.score++;

				scored();
			}
		}

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