function state_skull_chase() {
	if state_new
	{
		image_speed = idleImageSpeed; 
		sprite_index = spr_skullIdle; 
	
		state_var[1] = 0; 
		state_var[2] = random_range(chargeUpDelayMin,chargeUpDelayMax); 
	}

#region DETERMINE SPRITE INDEX BASED ON SPEED AND FACING
		if abs(velocity[XAXIS]) < skullTurnThreshold
		{
			sprite_index = spr_skullIdle; 
		}
		else
		{
			if (sign(velocity[XAXIS]) == -1)
			{sprite_index = spr_skullChaseLeft; }
			else{sprite_index = spr_skullChaseRight;}
		}
#endregion

#region POINT TO PLAYER AND ENTER CHASE STATE
		var _p = obj_player; 
	
		var _pY = scr_returnMaskYMiddle(_p); 
		if (scr_isValidInstance(_p))
		{
			var _dist = point_distance(x,y, _p.x,_pY); 
			if (_dist > cautionRadius)
			{
				scr_stateSwitch("Idle"); 
			}
			else // CHASE PLAYER 
			{
				var _movementAngle = point_direction(0,0,velocity[XAXIS],velocity[YAXIS]); 
				var _dirToPlayer = point_direction(x,y, _p.x,_pY);
				var _angleDiff = angle_difference(_dirToPlayer,_movementAngle); 
			
				if (abs(_angleDiff <= 120) or velocity[XAXIS] + velocity[YAXIS] == 0)
				{
					scr_applyXYMovement(_dirToPlayer + _angleDiff*.5, chaseAccel, chaseMaxSpeed, chaseFriction);
				}
				else
				{
					scr_applyXYMovement(NULLVALUE, chaseAccel, chaseMaxSpeed, chaseFriction);
				}
				if (point_distance(x,y, _p.x,_pY) <= alarmRadius and _p.state != "Hit Stun")
				{
					state_var[1] += 1; 
					if (state_var[1] >= state_var[2])
					{
						scr_stateSwitch("Charge Up"); 
					}
				}
				else
				{
					state_var[1] = 0; 
					state_var[2] = irandom_range(chargeUpDelayMin,chargeUpDelayMax); 
				}
			}
		}

#endregion


}
