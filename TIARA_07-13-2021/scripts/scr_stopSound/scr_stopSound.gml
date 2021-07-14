/// @description STOPS A SOUND WITHOUT CRASHING THE GAME
/// @param soundID
function scr_stopSound() {

	var _snd = argument[0]; 

	if (_snd != NULLVALUE and audio_is_playing(_snd))
	{
		audio_stop_sound(_snd); 
	}


}
