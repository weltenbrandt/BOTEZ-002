/// @description scr_stateUpdate update state if state switch has been requested.
function scr_stateUpdate() {
 
	var _stateNext = state_next;
 
	if (_stateNext != "")
	{
	    // store old state as state_previous
	    state_previous = state;
	    // set state to be new state
	    state = _stateNext;
	    // set ne
	    state_next = "";
	    stateScript = ds_map_find_value(stateMap, state);
	    state_new = true;
		stateSwitchLocked = false;
	}
	else
	{
	    state_new = false;
	}


}
