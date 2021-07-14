if (point_to_player)
{
	var point = lengthdir_x(1, point_direction(x, y, obj_player.x, obj_player.y));
	if (point != 0)
	{
		image_xscale = sign(obj_player.x - x);
	}
}

if (tick >= cooldown)
{
	tick = 0;
	
	var inst = instance_create_depth(x + (sprite_width / 2) * image_xscale, y, depth, obj_testProjectile);
	inst.dir = point_direction(x, y, x + image_xscale, y);
	inst.spd = launch_speed;
}

tick++;