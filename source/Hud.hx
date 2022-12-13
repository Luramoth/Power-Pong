/*
 * GNU Affero General Public License
 *
 * Copyright (c) 2022 Luramoth
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package;

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