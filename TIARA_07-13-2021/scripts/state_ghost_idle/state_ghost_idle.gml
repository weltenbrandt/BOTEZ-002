function state_ghost_idle() {
	if state_new
	{
		sprite_index = invisibleSprite; 
		state_is_invincible = true; 
		state_var[1] = 0;  // TIMER
		state_var[2] = irandom_range(delayTimeMin,delayTimeMax); // DELAY TIME
	}

	state_var[1] += 1; 
	
#region POINT TO PLAYER AND ENTER CHASE STATE
		if (scr_checkForPlayerInAlarmRadius()) // APPEAR WITHIN ALARM RADIUS
		{
			if (state_var[1] >= state_var[2])
			{
				scr_stateSwitch("Appear");
			}
		}
		else if (scr_checkForPlayerInCautionRadius()) // CHASE WITHIN CAUTION RADIUS 
		{
			var _p = obj_player; 
			if scr_isValidInstance(_p)
			{
				var _pY = scr_returnMaskYMiddle(_p); 
				var _dir = point_direction(x,y,_p.x,_pY); 
				velocity[XAXIS] = lengthdir_x(idleMoveSpeed,_dir); 
				velocity[YAXIS] = lengthdir_y(idleMoveSpeed,_dir); 
			}
		}
#endregion



}
