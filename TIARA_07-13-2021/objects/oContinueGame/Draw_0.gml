draw_self();

if (!place_meeting(x, y, oSelection))
{
	play_hover_sound = true;
}

if (place_meeting(x, y, oSelection))
{
	if (play_hover_sound)
	{
		audio_play_sound(sndSelectButton, 1, false);
	}
	play_hover_sound = false;
	
	draw_sprite(sArrow, 0, x - 60, y);
}