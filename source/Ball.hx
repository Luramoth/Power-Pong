//balls
package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Ball extends FlxSprite
{
	public function new(x, y)
	{
		super(x, y);

		makeGraphic(10, 10, FlxColor.WHITE);
	}
}