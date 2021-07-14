function state_minotaur_chase_player() {
	if state_new
	{
		velocity[XAXIS] = 0; 
		velocity[YAXIS] = 0; 
		sprite_index = idleSprite; 
		image_speed = chaseImageSpeed;
		scr_enemyFacePlayer(); 
	
		state_var[0] = 0; // 0 - DELAY TIME, 1 - CHASING PLAYER
		state_var[1] = 0; // TIMER 
		state_var[2] = irandom_range(cautionDelayMin,cautionDelayMax); // RANDOMLY SELECTED TIME TO DELAY
	}

	switch state_var[0]
	{
		case 0:
	
			sprite_index = idleSprite; 
			image_speed = idleImageSpeed; 
			++state_var[1];
			if (state_var[1] >= state_var[2])
			{state_var[0] = 1;scr_playSoundVocalize(id,.1, snd_minotaurAlarm); }
			break; 
		case 1:
			sprite_index = walkSprite; 
			image_speed = chaseImageSpeed; 
			scr_enemyFacePlayer(); 
	
			// SWITCH TO IDLE IF WE ARE ABOUT TO WALK OFF A LEDGE
			scr_applyXMovement(facing,chaseAccel,chaseMaxSpeed,chaseFriction);
	
		#region STOP CHASING PLAYER IF HE LEAVES CAUTION RADIUS
				var _yStart = scr_returnMaskYMiddle(id); 
				var _p = obj_player; 
				if scr_isValidInstance(_p)
				{
					var _playerYStart = scr_returnMaskYMiddle(_p); 
					if (point_distance(x, _yStart, _p.x, _playerYStart) > cautionRadius)
					{
						scr_stateSwitch("Mill Around"); 
					}
				}
		#endregion
	
		#region ATTACK PLAYER IF HE IS INSIDE OUR ALARM RADIUS
				var _yStart = scr_returnMaskYMiddle(id); 
				var _p = obj_player; 
				if scr_isValidInstance(_p)
				{
					var _playerYStart = scr_returnMaskYMiddle(_p); 
					if (point_distance(x, _yStart, _p.x, _playerYStart) <= alarmRadius)
					{
						scr_stateSwitch("Melee Attack"); 
					}
				}
		#endregion
	
	
			if !(onGround)
			{
				scr_stateSwitch("Fall"); 
			}
			break; 
	}


}
