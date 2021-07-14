function state_skull_idle() {
	if state_new
	{
		image_speed = idleImageSpeed; 
		state_var[1] = 0; // TIMER
		state_var[2] = irandom_range(cautionDelayMin,cautionDelayMax); 
	}

	scr_applyXYFriction(idleFriction); 

#region POINT TO PLAYER AND ENTER CHASE STATE
		var _p = obj_player; 
	
		var _pY = scr_returnMaskYMiddle(_p); 
		if (scr_isValidInstance(_p))
		{
			var _dist = point_distance(x,y, _p.x,_pY); 
			if (_dist <= cautionRadius)
			{
				++state_var[1]; 
				if (state_var[1] >= state_var[2])
				{scr_stateSwitch("Chase");}
			}
			else if (state_var[1] > 0)
			{
				state_var[1] = 0;
				state_var[2] = irandom_range(cautionDelayMin,cautionDelayMax); 
			}
		}
#endregion


}
