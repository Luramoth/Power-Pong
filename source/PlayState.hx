package;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	var player1:Paddle;
	var player2:Paddle;

	override public function create()
	{
		// create player 1 and 2
		player1 = new Paddle(20, 240 - 25, Player1);
		player2 = new Paddle(610, 240 - 25, Player2);

		// add them to the game
		add(player1);
		add(player2);

		// fbi
		#if debug
		FlxG.watch.add(player1, "x", "player 1 x");
		FlxG.watch.add(player1, "y", "player 1 y");

		FlxG.watch.add(player2, "x", "player 2 x");
		FlxG.watch.add(player2, "y", "player 2 y");
		#end

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
