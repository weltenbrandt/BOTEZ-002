function state_skull_charge_up() {
	if state_new
	{
		sprite_index = spr_skullAlarm; 
		state_var[1] = 0; 
	}


	scr_applyXYFriction(chargeUpFriction); 
	image_speed = chargeUpImageSpeed; 

#region POINT TO PLAYER AND ENTER CHASE STATE
		var _p = obj_player; 
	
		var _pY = scr_returnMaskYMiddle(_p); 
		if (scr_isValidInstance(_p))
		{
			var _dist = point_distance(x,y, _p.x,_pY); 
			if (_dist > alarmRadius)
			{
				scr_stateSwitch("Chase"); 
			}
		}

#endregion

	++state_var[1];
	if (state_var[1] >= chargeUpTime)
	{
		scr_stateSwitch("Explode"); 
	}



}
