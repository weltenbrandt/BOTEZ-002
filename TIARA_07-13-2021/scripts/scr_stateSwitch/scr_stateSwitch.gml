/// @description scr_stateSwitch switch to the chosen state
/// @param state
function scr_stateSwitch(argument0) {
 
	if (state_can_switch_from == true
	and stateSwitchLocked == false)
	{
		state_next = argument0;
	}


}
