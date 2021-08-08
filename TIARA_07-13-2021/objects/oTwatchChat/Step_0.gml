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
			with (inst)
			{
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