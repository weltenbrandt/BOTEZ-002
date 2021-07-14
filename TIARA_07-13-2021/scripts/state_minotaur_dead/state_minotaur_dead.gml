function state_minotaur_dead() {
	if state_new
	{
		// SPRITE HANDLING
		sprite_index = deathSprite; 
		image_index = 0; 
		image_speed = .1; 
		dead = true; 
	
		// INITIALIE HIT FORCES
		velocity[XAXIS] = xHitForce*mass; 
		velocity[YAXIS] = yHitForce*mass; 
	
		// SET TIMERS
		flashTimer         = hitStunFlashTime;  // THIS TRIGGERST THE PLAYER TO FLASH WHITE (VISUAL EFFECT ONLY) 
		invincibilityTimer = hitStunInvincibilityTime;
	
		scr_addPoints(pointValue); 
	}

	scr_applyGravity(fallGravity); 
	scr_applyXFriction(fallFriction);

	if (image_index + image_speed >= image_number - 1)
	{
		image_index = image_number - 1;
		image_speed = 0; 
	}


}
