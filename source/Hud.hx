package;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

class HUD extends FlxTypedGroup<FlxSprite>
{
	var p1Score:FlxText;
	var p2Score:FlxText;

	public function new()
	{
		super();

		p1Score = new FlxText(137, 0, 0, "0", 64);
		p1Score.alignment = FlxTextAlign.CENTER;

		p2Score = new FlxText(452, 0, 0, "0", 64);
		p2Score.alignment = FlxTextAlign.CENTER;

		add(p1Score);
		add(p2Score);
	}

	public function updateHUD(plyr1Score:Int, plyr2Score:Int)
	{
		p1Score.text = Std.string(plyr1Score);
		p2Score.text = Std.string(plyr2Score);
	}
}