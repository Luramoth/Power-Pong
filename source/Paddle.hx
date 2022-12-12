package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;

class Paddle extends FlxSprite
{
	public var Speed:Float = 500;

	public function new(x, y)
	{
		super(x, y);

		makeGraphic(10, 50, FlxColor.WHITE);

		drag.x = drag.y = 5000;
	}

	function updateMovement()
	{
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);

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