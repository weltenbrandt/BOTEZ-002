// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_dialogue(message_array){

	/// @description 
	if (!instance_exists(oTextbox)) {
		// Create
		var _tb = instance_create_depth(0, 0, -100, oTextbox);
	
		// Add messages to textbox's list
		var _list = _tb.messages;
	
		for (var i=0; i<array_length(message_array); i++) {
			var _arr = message_array[i];
		
			ds_list_add(_list, _arr);
		}
	}


}