function state_ghost_hit_stun() {
	if state_new
	{
		// SPRITE HANDLING
		sprite_index = hitStunSprite; 
	
		// INITIALIE HIT FORCES
		velocity[XAXIS] = xHitForce*mass; 
		velocity[YAXIS] = yHitForce*mass; 
	
		// SET TIMERS
		invincibilityTimer = hitStunInvincibilityTime;
		state_is_invincible = false;
	}

	scr_applyXYFriction(hitStunFriction); 

	var _moveSpd =  point_distance(0,0,velocity[XAXIS],velocity[YAXIS]); 
	if (!state_new and _moveSpd <= 2)
	{
		if (currentHearts <= 0 or state == "Dead")
		{scr_stateSwitch("Destroy");}
		else if (_moveSpd == 0){scr_stateSwitch("Idle");}
	}


}
