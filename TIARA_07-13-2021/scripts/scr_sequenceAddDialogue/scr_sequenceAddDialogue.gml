/// @param sequence_list,speaker_key,dialogue
function scr_sequenceAddDialogue() {
	var _sequenceList = argument[0]; 
	var _speaker = argument[1]; 
	var _dialogue = argument[2]; 

	var _eventMap = ds_map_create(); 
	ds_map_add(_eventMap,"speaker",_speaker); 
	ds_map_add(_eventMap,"dialogue",_dialogue); 
	ds_map_add(_eventMap,"type",eventTypes.dialogue); 
	ds_list_add(_sequenceList,_eventMap); 



}
