function state_skull_hit_stun() {
	if state_new
	{
		// SPRITE HANDLING
		sprite_index = hitStunSprite; 
	
		// INITIALIE HIT FORCES
		velocity[XAXIS] = xHitForce*mass; 
		velocity[YAXIS] = yHitForce*mass; 
	
		// SET TIMERS
		invincibilityTimer = hitStunInvincibilityTime;
	}

	scr_applyXYFriction(hitStunFriction); 

	if (!state_new and point_distance(0,0,velocity[XAXIS],velocity[YAXIS])  == 0)
	{
		if (currentHearts <= 0 or state == "Dead")
		{scr_stateSwitch("Explode");}
		else {scr_stateSwitch("Idle");}
	}


}
