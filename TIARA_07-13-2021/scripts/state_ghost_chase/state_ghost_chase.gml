function state_ghost_chase() {
	if state_new
	{
		sprite_index = idleSprite; 
		state_is_invincible = false;
		state_var[1] = 0; // TIMER
		state_var[2] = irandom_range(chaseDelayMinFrames,chaseDelayMaxFrames); // ESTABLISH RANDOMIZED MIN CHASE TIME 
	}

	scr_enemyFacePlayer(); 
	state_var[1]+= 1; 
	if ((!scr_checkForPlayerInAlarmRadius())
	and state_var[1] >= state_var[2])
	{scr_stateSwitch("Vanish");}
	else
	{
	#region POINT TO PLAYER AND ENTER CHASE STATE
		var _p = obj_player; 
	
		var _pY = scr_returnMaskYMiddle(_p); 
		if (scr_isValidInstance(_p))
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
	
			if (place_meeting(x,y, _p) 
			and _p.invincibilityTimer <= 0
			and _p.state != "Hit Stun" and _p.state != "Dead")
			{
				var _hitbox = scr_spawnHitbox(id,damage, false, 0,0, 100,100,hitForce,NULLVALUE,NULLVALUE,0,5,hitTimeStopFrames,hitXShake,hitYShake, hitXShakeDecay,hitYShakeDecay,.1,NULLVALUE); 
				scr_stateSwitch("Destroy"); 
			}
		}
#endregion
	}


}
