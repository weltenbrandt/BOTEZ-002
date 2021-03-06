// Creates the object
if (!already_spawned and image_index == spawn_at_frame)
{
	// Creates the spawned object
	instance_create_depth(x + x_offset, y + y_offset, depth - 1, spawn);
	already_spawned = true;
}

#region collision with bees

if (!immune)
{
	// This code checks the bees that are colliding within that collision redius we set earlier
	var _list = ds_list_create();

	var quantity = collision_circle_list(collision_x, collision_y, collision_radius, spawn, false, false, _list, false);

	for (var i = 0; i < quantity;  i++)
	{
		var inst= _list[| i];
	
		// If we're colliding with a bee that exploded, destroyed is set to true
		if (inst.sprite_index == inst.deathSprite)
		{
			destroyed = true;
		}
	}
	
	ds_list_destroy(_list);
}

#endregion

#region managing cooldown and destruction
if (!destroyed)
{
	image_blend = c_white;
	
	// Plays the animation for creating the bee if the cooldown time has expired
	if (tick >= creation_cooldown)
	{
		image_speed = 1;
	}
	tick++;
}
else
{
	image_blend = c_red;
}
#endregion 

// Regenerates after decreasing a cooldown variable

if (regenerate_after > 0)
{
	if (destroyed == true)
	{
		if (regenerate_tick >= regenerate_after)
		{
			destroyed = false;
			regenerate_tick = 0;
		}
		else
		{
			regenerate_tick++;
		}

	}
}