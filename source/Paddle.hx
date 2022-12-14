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

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxMath;

enum PlayerType
{
	Player1;
	Player2;
}

class Paddle extends FlxSprite
{
	public var Speed:Float = 500;

	public var type:PlayerType;

	public var axisLocked:Bool = false;

	public var score:Int = 0;

	var boundXMax: Float;
	var boundXMin: Float;

	public function new(x, y, type:PlayerType)
	{
		super(x, y);

		this.type = type;

		boundXMax = if (this.type == Player1) 300 else 620;
		boundXMin = if (this.type == Player1) 20 else 320;

		makeGraphic(10, 50, FlxColor.WHITE);

		drag.x = drag.y = 5000;
	}

	function updateMovement()
	{
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		if (this.type == Player1)// change bindings based on what player type current class is
		{
			up = FlxG.keys.anyPressed([W]);
			down = FlxG.keys.anyPressed([S]);
			if (!axisLocked)// if axis lock is enabled then dont even read other binds
			{
				left = FlxG.keys.anyPressed([A]);
				right = FlxG.keys.anyPressed([D]);
			}
		}
		else
		{
			up = FlxG.keys.anyPressed([UP]);
			down = FlxG.keys.anyPressed([DOWN]);
			if (!axisLocked)
			{
				left = FlxG.keys.anyPressed([LEFT]);
				right = FlxG.keys.anyPressed([RIGHT]);
			}
		}

		// cancel out keypresses that cancel eachother out (pressing left and right at the same time and etc..)
		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;

		if (up || down || left || right)// pseudo "normalise" the movement direction based on inputs
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

			velocity.setPolarDegrees(Speed, newAngle);// actually move the player
		}

		// clamp the value so player cant just run out the screen
		this.y = FlxMath.bound(this.y, 0, 480 - 50);
		this.x = FlxMath.bound(this.x, boundXMin, boundXMax);
	}

	override function update(elapsed)
	{
		if (!Main.stop)
		{
			updateMovement();
		}
		super.update(elapsed);
	}
}
// why are you down here wierdo