function scr_dealDamageToPlayer() {
	if !(obj_player.state_is_invincible)
	{
		var _damageDealt = argument[0]; 

		obj_gameDataController.currentHearts -= _damageDealt; 

		if (obj_gameDataController.currentHearts < 0)
		{obj_gameDataController.currentHearts = 0;}

		if obj_gameDataController.currentHearts <= 0
		{with obj_player{scr_stateSwitch("Dead");}stateSwitchLocked = true; }
		else
		{with obj_player{scr_stateSwitch("Hit Stun");}}
	
	}


}
