/// @description ACTOR HIT ON HIT
function scr_playActorHitSounds() {

	var _actorHit = argument[0]; 

	if (scr_isValidInstance(_actorHit))
	{
		var _hearts = 0; 
		if (_actorHit.object_index == obj_player.object_index)
		{_hearts = obj_gameDataController.currentHearts; }
		else
		{_hearts = _actorHit.currentHearts;}
	
	
		var _deathResponseList = _actorHit.deathResponseSoundList
		if (_hearts <= 0 
		and ds_list_size(_deathResponseList) > 0)
		{
			with _actorHit
			{
				scr_playSoundVocalize(_actorHit,_actorHit.deathResponsePitchVariance,  ds_list_find_value(_deathResponseList, irandom(ds_list_size(_deathResponseList)-1))); 
			}
		}
		else
		{
			// VOCAL RESPONSE OF HIT ACTOR
			var _vocalResponseList = _actorHit.hitResponseSoundList; 
			if (ds_list_size(_vocalResponseList) > 0)
			{
				scr_playSoundVocalize(_actorHit,_actorHit.hitResponsePitchVariance,  ds_list_find_value(_vocalResponseList, irandom(ds_list_size(_vocalResponseList)-1))); 
			}
		}

		// MATERIAL RESPONSE OF HIT ACTOR
		var _materialResponseList = _actorHit.hitMaterialSoundList; 
		if (ds_list_size(_materialResponseList) > 0)
		{
			scr_playSoundVariant(_actorHit.hitMaterialPitchVariance,  ds_list_find_value(_materialResponseList, irandom(ds_list_size(_materialResponseList)-1))); 
		}
	}


}
