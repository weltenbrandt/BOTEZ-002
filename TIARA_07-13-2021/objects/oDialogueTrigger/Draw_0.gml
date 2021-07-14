var grounded = false;

draw_self();

// Checks if the player is on the ground, so the dialogue can be started
with (obj_player)
{
	if (onGround)
	{
		grounded = true;
	}
}

if (activate == true)
{
	
	// Cancels the dialogue		
	if (global.inputGuardPressed)
	{
		instance_destroy(oTextbox);
		activate = false;
		cooldown = 10 * room_speed;
	}
	
	// If the dialogue is finished, destroy this trigger
	if (!instance_exists(oTextbox) and activate == true)
	{
		instance_destroy();
	}
}

// If the cooldown is on 0 and player is on dialogue trigger object
if (place_meeting(x, y, obj_player) and grounded and cooldown <= 0)
{
	
	// Creates the dialogue
	if (activate == false)
	{
		// Throws an error if the dialogue wasn't started
		if  !(variable_instance_exists(id, "msg"))
		{
			show_error("No dialogue set up on the instance creation code", true);
		}
		else
		{
			create_dialogue(msg);
		}
		activate = true;
	}
}

// If the cooldown is active, decrease it
if (cooldown > 0)
{
	cooldown--;
}