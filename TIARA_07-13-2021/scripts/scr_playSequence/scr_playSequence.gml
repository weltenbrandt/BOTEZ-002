function scr_playSequence() {
	var _sequenceKey = argument[0]; 

	obj_sequenceControl.currentSequence = ds_map_find_value(obj_sequenceControl.allSequencesMap,_sequenceKey); 
	obj_sequenceControl.sequenceStep = 0; 
	obj_sequenceControl.beginStep = true; 


}
