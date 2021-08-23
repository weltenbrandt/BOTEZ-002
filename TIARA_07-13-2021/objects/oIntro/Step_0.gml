


// Takes current frame from animation
if (image_index >= 51 and !audio_1)
{
	audio_play_sound(sndIntroNarration, 1, false);
	audio_1 = true;
}
	
if (image_index >= 60 and !audio_2)
{
	audio_play_sound(sndThunder, 1, false);
	audio_2 = true;
}
	
