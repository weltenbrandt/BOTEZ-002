///  @description PLAY SOUND VARIANT
/// @param id,pitchVariation,snd1,...snd2
function scr_playSoundVocalize() {

	var _id = argument[0]; 
	var _pitchVariation = argument[1]; 


	if (audio_exists(_id.currentVocalization) and audio_is_playing(_id.currentVocalization))
	{
		audio_stop_sound(_id.currentVocalization); 
	}

	var _soundList = ds_list_create(); 
	for (var i = 2; i < argument_count; ++i)
	{
		ds_list_add(_soundList, argument[i]); 
	}

	var _randomSound = ds_list_find_value(_soundList, irandom(ds_list_size(_soundList)- 1));

	var _snd = scr_playSound(_randomSound, false); 
	audio_sound_pitch(_snd, 1 + random_range(-_pitchVariation,_pitchVariation)); 

	_id.currentVocalization = _snd; 

	return _snd; 

	ds_list_destroy(_soundList); 


}
