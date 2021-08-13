hp = clamp(hp, 0, hp_max)

// Grabs the curve animation and plays it

var _curveStruct = animcurve_get(curve_asset);
var _channel = animcurve_get_channel(_curveStruct, "y");

var _value = animcurve_channel_evaluate(_channel, curve_position);

curve_position += curve_speed;

curve_position = curve_position mod 1;

y = lastHoverY + _value * 6;

// Spawns a word around the boss
spawn_word_tick++;
if (spawn_word_tick >= 10)
{
	spawn_word_tick = 0;
	var _x = x + sprite_width / 2;
	var _y = y + sprite_width / 4;
	instance_create_depth(_x, _y, depth, oSurroundingWord);
}

switch(state)
{
	
	
	case(twatchstates.idle):
		
		break;
		
		
	case(twatchstates.word):
		
		if (throw_tick >= throw_cooldown)
		{
			var choice = random_range(0, array_length(word));
			choice = floor(choice);
			
			var inst = instance_create_depth(x, y, depth, oFlyingWord);
			
			// Points to player
			var dir = point_direction(x, y, obj_player.x, obj_player.y);
			
			// Shoots at the player
			with (inst)
			{
				xspd = lengthdir_x(movement_speed, dir);
				yspd = lengthdir_y(movement_speed, dir);
				myWord = other.word[choice];
			}
			
			throw_tick = 0;
		}
		else
		{
			throw_tick++;
		}
		
		
		
		break;
	
	
}