function state_player_wall_slide() {
	if state_new
	{
		scr_playSoundVocalize(id,.1, snd_playerTouchWallA); 
		turnRunTrigger = false;
		velocity[XAXIS] = 0; 
		velocity[YAXIS] = 0; 
	
		image_index = 0; 
		switch facing
		{
			case 1:
				sprite_index = spr_playerWallStickLeft; 
				facing = -1; 
				break; 
			case -1:
				sprite_index = spr_playerWallStickRight; 
				facing = 1; 
				break; 
		}
		state_var[0] = 0; // STAGE, 0 - sticking, 1 - sliding
		state_var[1] = 0; // STICK TIME
		state_var[2] = 0; // GRACE FRAME TRACKER FOR JUMP TIMING
		state_var[3] = NULLVALUE; // HOLDER FOR WALL SLIDE SOUND ID
		if (wallSlideResetsDashCounter)
		{dashDuringJumpCounter = 0;}
	}

	switch state_var[0]
	{
		case 0: // STICKING LOGIC
			image_speed = wallStickAnimationSpeed; 
			if (image_index + image_speed >= image_number)
			{image_index = image_number -1; image_speed = 0;}
			
			state_var[1] += 1; 
			if (state_var[1] >= wallSlideStickTime) // THIS NUMBER DETERMINES HOW LONG BEFORE SLIDE BEGINS
			{
				state_var[3] = scr_playSoundVariant(.1, snd_playerWallSlideA); 
				state_var[0] = 1; // BEGIN SLIDING
				switch facing
				{
					case -1:
						sprite_index = spr_playerWallSlideLeft; 
						break; 
					case 1:
						sprite_index = spr_playerWallSlideRight; 
						break; 
				}
			}
			break; 
		case 1: // SLIDING LOGIC
			image_speed = .1; 
			scr_applyGravity(wallSlideGravity); 
			if (onGround)
			{
				velocity[YAXIS] = 0; 
				scr_playerSwitchToNeutralState(); 
			}
			break; 
	}

	if (global.inputJumpPressed or global.inputUpPressed)
	{
		scr_stopSound(state_var[3]); 
		scr_stateSwitch("Jump"); 
	}
	var _checkFacing = facing*-1;
	if !(scr_playerCheckForValidWallSlideLocation(x,y,_checkFacing))
	{
		scr_stopSound(state_var[3]); 
		scr_stateSwitch("Fall"); 
	}

	if global.inputAttackPressed
	{
		scr_stopSound(state_var[3]); 
		scr_stateSwitch("Shoryuken"); 
	}

	// GRACE TIMER FOR FALLING (IF DON'T HOLD TOWARDS WALL WE SHOULD FALL)
	switch facing
	{
		case -1:
			if (sign(global.inputHorizontalTotal) != 1)
			{++state_var[2];}else{state_var[2] = 0;}
			break
		case 1:
			if (sign(global.inputHorizontalTotal) != -1)
			{++state_var[2];}else{state_var[2] = 0;}
			break;
	}

	if (state_var[2] >= wallSlideGraceFrames) 
	{
		scr_stopSound(state_var[3]); 
		scr_stateSwitch("Fall");
	}
}
