draw_text(x, y, myWord);

if (!threw)
{
	y += fallingSpd;
}
else
{
	x += spd;
	if (place_meeting(x, y, oTwatchChat))
	{
		
		show_debug_message(myDamage)
		oTwatchChat.hp -= myDamage;
		instance_destroy();
	}
}

// Gets hit by the player
if (place_meeting(x, y, obj_hitbox))
{
	if (obj_hitbox.myTeam == teams.player)
	{
		threw = true;
				
		scr_screenShake(4, 0.1, 4, 0.1);
		
	}
}