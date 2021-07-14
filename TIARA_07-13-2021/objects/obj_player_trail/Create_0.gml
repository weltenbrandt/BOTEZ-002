var spd;

// Color of the trail
color = c_white;

image_speed = 0;

// Defines how fast the trail will disappear per tick
fade_speed = 0.01;

// This is the percentage of the total speed of the player that will be aplied to the opacity.
// If this is set to 0.25, it will add 25% of the player's current speed (from 0 to 1) to the starting
//opacity. Note that doesn't mean that 1.00 doesn't mean that the trail will be fully visible, as it
//depends on the current speed of the player, it will be fully visible if the player's speed is 1.00 and
//the player_speed_percentage is 1.00 as well.
player_speed_percentage = 0.25; // The default value is 25% (0.25)


// Acess the player to get variables
with (obj_player)
{
	// Turns the current sprite into the current sprite of the player and the current frame
	other.sprite_index = sprite_index;
	other.image_index = image_index;
	
	
	// Grabs the absolute speed of the player in both X and Y axis and adds them to a local variable
	spd = abs(velocity[XAXIS]) + abs(velocity[YAXIS])
	
	// Changes the color depending on the player state
	if (launched == true)
	{
		// Launched by a bumper
		other.color = c_yellow
	}
	
	if (state == "Hit Stun")
	{
		// Got hit
		other.color = make_color_rgb(255, 102, 102);
	}
	
	if (state == "Dash")
	{
		// Dashing
		other.fade_speed = 0.02;
		other.color = c_aqua;
	}
}

// Clamps the speed of the player to 1
spd = clamp(spd, 0, 1);

// Applies the percentage
spd *= player_speed_percentage;

start_opacity = spd;
