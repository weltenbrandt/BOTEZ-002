function state_minotaur_fall() {
	if state_new
	{
		// SPRITE HANDLING
		sprite_index = idleSprite; 
	}

	scr_applyGravity(fallGravity); 
	scr_applyXFriction(fallFriction); 

	if (!state_new and onGround and velocity[XAXIS] == 0)
	{
		scr_stateSwitch("Idle"); 
	}


}
