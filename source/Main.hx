package;

import flixel.FlxGame;
import openfl.display.Sprite;

var stop:Bool = false;

class Main extends Sprite
{
	public function new()
	{
		super();

		// start up the damn game!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		addChild(new FlxGame(640, 480, PlayState));
	}
}
