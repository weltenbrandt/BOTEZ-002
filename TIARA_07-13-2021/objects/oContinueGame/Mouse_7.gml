if (file_exists("save.sav"))
{
	audio_play_sound(snd_placeholderPop, 1, false);
	room_goto(rm_initiate_systems);
}