function state_minotaur_idle() {
	if state_new
	{
		// IMAGE PROPERTIES
		if (sprite_index != idleSprite)
		{
			sprite_index = idleSprite; 
			image_index = 0; 
		}
		image_speed = idleImageSpeed;
	
		velocity[XAXIS] = 0; 
		velocity[YAXIS] = 0; 
	
		state_var[1] = irandom(60); // IDLE TIMER 
	}

	scr_applyXFriction(walkFriction); 
	if !(onGround){scr_stateSwitch("Fall"); }

	state_var[1] += 1; 

	if (state_var[1] >= 120)
	{
		scr_stateSwitch("Mill Around"); 
	}

	// CHECK FOR AND SWITCH TO CHASE PLAYER
	scr_minotaurCheckForChasePlayer(); 




}
