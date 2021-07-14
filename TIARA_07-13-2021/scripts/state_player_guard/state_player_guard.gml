function state_player_guard() {
	if state_new
	{
		state_var[1] = 0; // TIMER
		state_var[2] = 1; // BOUNCES

	
		switch facing
		{
			case -1: sprite_index = spr_playerBlockLeftStart ; break; 
			case 1: sprite_index =  spr_playerBlockRightStart; break; 
		}
		image_index = 0; 
		blocking = true; 
		/*
			guardMinimumTime = 100; 
			guardBounceMultiplier = .5; 
			guardMaxBounces = 2; 
		*/
	}
	++state_var[1]; // BASIC TIMER

	image_speed = guardAnimationSpeed; 
	if !(onGround)
	{
		scr_applyGravity(jumpGravity);
	
		if (state_var[2] < guardMaxBounces)
		{
			var _bboxSide = bbox_bottom
			var _halfWayX = bbox_left+ ((bbox_right - bbox_left)*.5);
			var _yCheck = velocity[YAXIS] + 2;
			if (
			(tilemap_get_at_pixel(tilemap, bbox_left,  _bboxSide + _yCheck) != 0)
			or (tilemap_get_at_pixel(tilemap, bbox_right, _bboxSide + _yCheck) != 0)
			or (tilemap_get_at_pixel(tilemap, _halfWayX, _bboxSide + _yCheck) != 0)
			)
			{
				velocity[YAXIS] *= -guardBounceMultiplier;
				state_var[2] += 1; 
				scr_playSound(snd_placeholderPop, false); // SOUND OF BOUCNING ALONG GROUND WHILE BLOCKING
			}
		}
	}
	else
	{
		scr_applyXFriction(guardFriction); 
	}

	switch sprite_index
	{
		case spr_playerBlockLeftStart:
			if (image_index + image_speed >= image_number - 1)
			{sprite_index = spr_playerBlockLeftHold; image_index = 0;}
			break; 
		case spr_playerBlockRightStart:
			if (image_index + image_speed >= image_number - 1)
			{sprite_index = spr_playerBlockRightHold; image_index = 0; }
			break; 
	}

	if (global.inputHorizontalTotal != 0
	and global.inputHorizontalTotal != facing)
	{
		facing = global.inputHorizontalTotal; 
		switch facing
		{
			case -1: sprite_index = spr_playerBlockLeftHold; break; 
			case 1: sprite_index = spr_playerBlockRightHold; break; 
		}
	}

	if (state_var[1] >= guardMinimumTime)
	{
		if (global.inputGuardHeld == false)
		{	
			switch facing
			{
				case -1: sprite_index = spr_playerBlockLeftStart ; break; 
				case 1: sprite_index =  spr_playerBlockRightStart; break; 
			}
			image_speed = -guardAnimationSpeed; 
		
			if (image_index + image_speed <= 0)
			{
				blocking = false; 
				scr_playerSwitchToNeutralState();
			}
		}
	
		if onGround
		{
			if (global.inputUpPressed or global.inputJumpPressed)
			{
				scr_stateSwitch("Jump"); 
			}
		}
	
		if (global.inputDashPressed and dashCooldownTimer <= 0)
		{
			blocking = false; 
			scr_stateSwitch("Dash"); 
		}
	}


}
