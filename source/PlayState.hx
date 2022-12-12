package;

import flixel.FlxState;

class PlayState extends FlxState
{
	var player1:Paddle;
	var player2:Paddle;

	override public function create()
	{
		player1 = new Paddle(20, 240 - 25, Player1);
		player2 = new Paddle(610, 240 - 25, Player2);

		add(player1);
		add(player2);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
