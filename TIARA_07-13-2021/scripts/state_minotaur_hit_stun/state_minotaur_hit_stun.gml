function state_minotaur_hit_stun() {
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

	scr_applyGravity(fallGravity); 
	scr_applyXFriction(fallFriction); 

	if (!state_new and onGround and velocity[XAXIS] == 0)
	{
		scr_stateSwitch("Idle"); 
	}


}
