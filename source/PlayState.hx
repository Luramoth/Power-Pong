package;

import flixel.FlxState;

class PlayState extends FlxState
{
	var player:Paddle;

	override public function create()
	{
		player = new Paddle(100, 100);
		add(player);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
