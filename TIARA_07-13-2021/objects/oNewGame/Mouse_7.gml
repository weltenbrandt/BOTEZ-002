if (file_exists("save.sav"))
{
	audio_play_sound(snd_placeholderPop, 1, false);
	file_delete("save.sav");
}

room_goto(rm_initiate_systems);