hspd += hor_speed * dir;

hspd = clamp(hspd, -2, 2);

x += hspd;
y -= ver_speed;

show_debug_message(alpha);

if (!collision_rectangle(x - 5, y, x + 5, y, oTwatchChat, false, false) and got_in)
{
	hspd = clamp(hspd, -.5, .5);
	
	got_in = false;
	dir *= -1;
}

if (collision_rectangle(x - 5, y, x + 5, y, oTwatchChat, false, false))
{
	got_in = true;
	if (alpha < 1) alpha += 0.05;
	tick = 0;
}
else
{
	
	if (got_in == false)
	{
		tick++;
	}
}

if (tick > 25)
{
	if (alpha > 0) alpha -= 0.05;
}

//alpha = clamp(alpha, 0, 1);
if(tick >= 30 and alpha = 0)
{
	instance_destroy();
}

