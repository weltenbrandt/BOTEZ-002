
// Calculates the direciton that the player will be launched to
horizontal_force = lengthdir_x(1, bumper_angle + 90) * force;
vertical_force = lengthdir_y(1, bumper_angle + 90) * force;

// Handles input
var dir = (global.inputLeftHeld - global.inputRightHeld) * turn_speed;
var launch = global.inputJumpPressed;

// If the player is in, activate
if ((distance_to_object(obj_player) < collision_radius) and launch == false)
{	
	obj_player.in_bumper = true;
	
	if (active == false)
	{
		obj_player.image_speed = 0.4;
		obj_player.sprite_index = spr_player_transition_bumper;
	}
	
	active = true;
}


// If active, let player control the bumper
if (active)
{
	// Controls the red flashing
	flash_tick += 5 * tick_speed;
	
	if (flash_tick >= initial_timer + timer)
	{
		tick_speed++;
		flashAlpha = 0.5;
		flash_tick = 0;
	}
	
	if (timer >= 0)
	{
		timer--;
	}
	
	if (timer == 0)
	{
		launch = true;
	}
	
	// Controls the direction of the bumper
	bumper_angle += (angle - bumper_angle) / (30 / turn_speed);

	if !(angle + dir >= orig_angle + 60) and !(angle + dir <= orig_angle - 60)
	{
		angle += dir;
	}
	
	// Sets the player positon, speed and visual variables
	with(obj_player)
	{
		velocity[YAXIS] = 0;
		velocity[XAXIS] = 0;
		x += (other.x - x) / 10;
		y += (other.y - y) / 10;
		verticalWindForce = 0;
		horizontalWindForce = 0;
	}
	
	// Launches the player
	if (launch)
	{
		active = false;
		timer = initial_timer;
		tick_speed = 1;
		flash_tick = 0;
		with(obj_player)
		{
			
			x = x + lengthdir_x(other.sprite_height + 20, other.bumper_angle + 90);
			y = y + lengthdir_y(other.sprite_height + 25, other.bumper_angle + 90);
			visible = true;
			launched = true;
			in_bumper = false;
			
			horizontalWindForce = other.horizontal_force;
			verticalWindForce = other.vertical_force;
		}
	}
}
else
{
	// Gets the bumber on the direction the player is coming without the player bing in it
	angle = orig_angle + (30 * dir);
	
	bumper_angle = angle;
}

