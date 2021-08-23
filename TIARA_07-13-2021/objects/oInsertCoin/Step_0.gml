
if (room != rm_Intro)
{
	image_alpha = 0;
	exit;
}

if (!selected)
{
	for (var i = 0; i < 11; ++i)
	{
		if gamepad_is_connected(i)
		{
			if (gamepad_button_check_pressed(i, gp_start))
			{
				selected = true;
				audio_play_sound(sndSelectButton, 1, false);
			}
		}
	}

	if (keyboard_check_pressed(vk_anykey))
	{
		selected = true;
		audio_play_sound(sndSelectButton, 1, false);
	}
}


if (!selected)
{
	flickering += 0.05;
}
else
{
	flickering += 0.2;
}

if (floor(flickering) == 0)
{
	image_alpha = 0;
}
else
{
	image_alpha = 1;
}

if (flickering >= 2.9)
{
	flickering = 0;
}