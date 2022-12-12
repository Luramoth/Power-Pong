package;

import flixel.FlxState;

class PlayState extends FlxState
{
	var player1:Paddle;
	var player2:Paddle;

	override public function create()
	{
		player1 = new Paddle(100, 100, Player1);
		player2 = new Paddle(200, 100, Player2);

		add(player1);
		add(player2);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
