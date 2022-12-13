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