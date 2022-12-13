//balls
package;

import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Ball extends FlxSprite
{
	var moveAngle:Int;

	public var Speed:Float = 300;

	public function new(x, y)
	{
		super(x, y);

		// set random direction to go towards
		moveAngle = FlxG.random.int(-180, 180);

		makeGraphic(10, 10, FlxColor.WHITE);
	}

	override public function update(elapsed)
	{
		if (this.y <= 0 || this.y >= 470)
		{
			moveAngle = 360 - moveAngle;
		}

		// move
		velocity.setPolarDegrees(Speed, moveAngle);

		super.update(elapsed);
	}
}