//balls
package;

import Paddle.PlayerType;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Ball extends FlxSprite
{
	public var moveAngle:Int;

	public var Speed:Float = 300;

	public var lastPlayer:PlayerType;

	public function resetBall()
	{
		this.x = 315;
		this.y = 235;

		moveAngle = FlxG.random.int(-180, 180);
	}

	public function new(x, y)
	{
		super(x, y);

		// set random direction to go towards
		moveAngle = FlxG.random.int(-180, 180);

		makeGraphic(10, 10, FlxColor.WHITE);
	}

	override public function update(elapsed)
	{
		if (!Main.stop)
		{
			if (this.y <= 0 || this.y >= 470)
			{
				moveAngle = 360 - moveAngle;
			}

			// move
			velocity.setPolarDegrees(Speed, moveAngle);
		}

		super.update(elapsed);
	}
}