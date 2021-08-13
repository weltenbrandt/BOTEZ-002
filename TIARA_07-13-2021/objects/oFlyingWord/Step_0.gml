if (global.inputAttackPressed)
{
	obj_player.carrying_word = false;
	threw = true;
}

// Gets grabbed by the player
if (place_meeting(x, y, obj_player) and !carrying and !obj_player.carrying_word)
{
	carrying = true;
	movement_speed = 0;
}

if (carrying = true)
{
	if (movement_speed == 0)
	{
		with (obj_player)
		{
			carrying_word = true;
			other.x = x - 10;
			other.y = y - 50;
		}
	}
	
	if (threw)
	{
		movement_speed = 4;
	}
	
	y += movement_speed;
}
else
{
	y += yspd;
	x += xspd;
}