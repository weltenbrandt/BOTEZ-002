
with(obj_player)
{
	if (!variable_instance_exists(id, "carrying_word"))
	{
		carrying_word = false;
	}
}

// Movement
movement_speed = 5;
threw = false;

// Do not change
myWord = "";
carrying = false;

xspd = 0;
yspd = 0;