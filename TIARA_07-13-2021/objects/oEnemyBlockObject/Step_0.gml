if (instance_exists(enemy_id))
{
	with (enemy_id)
	{

		show_debug_message(state)

		if (variable_instance_exists(id, "hp"))
		{
			if (hp <= 0)
			{
				other.shrink = true;
			}
		}
		
		if (variable_instance_exists(id, "dead"))
		{
			if (dead == true)
			{
				other.shrink = true;
			}
		}
		
		if (variable_instance_exists(id, "state"))
		{
			if (state == "Dead")
			{
				other.shrink = true;
			}
		}
	}
}
else
{
	shrink = true;	
}

if (shrink)
{
	image_xscale += (0 - image_xscale) / 15;
	image_yscale += (0 - image_yscale) / 15;
}