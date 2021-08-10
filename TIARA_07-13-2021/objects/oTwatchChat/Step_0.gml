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