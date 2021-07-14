/// @description scr_stateBeginIn set state and stateScript
/// @param state
function scr_stateBeginIn(argument0) {
 
	var _state = argument0;
 
	state = _state;
 
	stateScript = ds_map_find_value(stateMap, _state);


}
