package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;

enum PlayerType
{
	Player1;
	Player2;
}

class Paddle extends FlxSprite
{
	public var Speed:Float = 500;

	public var type:PlayerType;

	public function new(x, y, type:PlayerType)
	{
		super(x, y);

		this.type = type;

		makeGraphic(10, 50, FlxColor.WHITE);

		drag.x = drag.y = 5000;
	}

	function updateMovement()
	{
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		if (this.type == Player1)
		{
			up = FlxG.keys.anyPressed([W]);
			down = FlxG.keys.anyPressed([S]);
			left = FlxG.keys.anyPressed([A]);
			right = FlxG.keys.anyPressed([D]);
		}
		else
		{
			up = FlxG.keys.anyPressed([UP]);
			down = FlxG.keys.anyPressed([DOWN]);
			left = FlxG.keys.anyPressed([LEFT]);
			right = FlxG.keys.anyPressed([RIGHT]);
		}

		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;

		if (up || down || left || right)
		{
			var newAngle:Float = 0;
			if (up)
			{
				newAngle = -90;
				if (left)
					newAngle -= 45;
				else if (right)
					newAngle += 45;
			}
			else if (down)
			{
				newAngle = 90;
				if (left)
					newAngle += 45;
				else if (right)
					newAngle -= 45;
			}
			else if (left)
				newAngle = 180;
			else if (right)
				newAngle = 0;

			velocity.setPolarDegrees(Speed, newAngle);
		}
	}

	override function update(elapsed)
	{
		updateMovement();
		super.update(elapsed);
	}
}