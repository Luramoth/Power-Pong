package;

import flixel.util.FlxColor;
import haxe.macro.Expr.Case;
import flixel.FlxSprite;

enum Powerups{
	SPEED;
}

class Powerup extends FlxSprite
{
	public function new(x:Float, y:Float, type:Powerups)
	{
		super (x, y);

		switch(type)
		{
			case SPEED:
				makeGraphic(16, 16, FlxColor.BLUE);
			case _:
		}
	}
}