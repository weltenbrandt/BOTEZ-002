///  @description PLAY SOUND VARIANT
/// @param pitchVariation,snd1,...snd2
function scr_playSoundVariant() {

	var _pitchVariation = argument[0]; 
	var _soundList = ds_list_create(); 
	for (var i = 1; i < argument_count; ++i)
	{
		ds_list_add(_soundList, argument[i]); 
	}

	var _randomSound = ds_list_find_value(_soundList, irandom(ds_list_size(_soundList)- 1));

	var _snd = scr_playSound(_randomSound, false); 
	audio_sound_pitch(_snd, 1 + random_range(-_pitchVariation,_pitchVariation)); 

	return _snd; 

	ds_list_destroy(_soundList); 


}
