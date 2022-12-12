package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Paddle extends FlxSprite
{
	public function new(x, y)
	{
		super(x, y);

		makeGraphic(10, 50, FlxColor.WHITE);
	}
}