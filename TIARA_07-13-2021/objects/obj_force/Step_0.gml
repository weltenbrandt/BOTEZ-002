
with (obj_player)
{	
	if (!place_meeting(x, y, obj_force) and launched == false)
	{
		// Resets the speed if the player isn't touching a speed object
		horizontalWindForce = 0;
		verticalWindForce = 0;
	}
}

// Launches the player to a direction
if (place_meeting(x, y, obj_player))
{
	with(obj_player)
	{
		if (scr_isOnGround() and other.vertical_force != 0)
		{
			y--;
		}
		// Adds the speed to the player
		horizontalWindForce = other.horizontal_force;
		verticalWindForce = other.vertical_force;
		velocity[YAXIS] += other.vertical_force;
	}
}