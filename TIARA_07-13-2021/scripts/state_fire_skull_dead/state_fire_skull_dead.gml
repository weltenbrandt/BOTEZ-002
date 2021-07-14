function state_fire_skull_dead() {
	if state_new
	{
		// SPRITE HANDLING
		sprite_index = hitStunSprite; 
	
		// INITIALIE HIT FORCES
		velocity[XAXIS] = 0; //xHitForce*mass; 
		velocity[YAXIS] = 0; //yHitForce*mass; 
	
		// SET TIMERS
		invincibilityTimer = hitStunInvincibilityTime;
	}

	scr_applyXYFriction(hitStunFriction); 

	if (image_index + image_speed >= image_number)
	{
		instance_destroy();
	}


}
