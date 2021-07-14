function state_player_jump() {
	if state_new
	{
		blocking = false;
		state_var[1] = 0; // INTERNAL TIMER
		state_var[2] = 0; // HAS RELEASED JUMP
		state_var[3] = jumpMaxSpeed; // MAX SPEED FOR THIS JU
		state_var[4] = -1; // APEX HANG TIME 
		image_index = 0; 
	
		if (facing == 1)
		{sprite_index = spr_playerJumpRight;}
		else {sprite_index = spr_playerJumpLeft;}
		if (state == "Fall")
		{
			if (facing == 1)
			{sprite_index = spr_playerFallRight;}
			else {sprite_index = spr_playerFallLeft;}
		}
	
		if (state == "Jump" and state_previous == "Wall Slide")
		{
			velocity[XAXIS] = facing*wallJumpXForce;
		}
	
		if (state == "Jump")
		{
			velocity[YAXIS] = -jumpYForce;
			if (facing == 1)
			{sprite_index = spr_playerJumpRight;}
			else {sprite_index = spr_playerJumpLeft;}
		}
	
		if (state == "Jump")
		{
			scr_playSoundVocalize(id,.1, snd_playerJumpA); 
		}
	
	}

	var _inForgivenessFrames = false; 
	if (state == "Fall" and state_var[1] <= ledgeJumpForgivenessFrames
	and (state_previous == "Idle" or state_previous == "Run"))
	{
		state_var[1] += 1; 
		_inForgivenessFrames = true; 
		if (global.inputJumpPressed or global.inputUpPressed)
		{scr_stateSwitch("Jump");}
	}

	if (velocity[XAXIS] != 0)
	{
		facing = sign(velocity[XAXIS]); 
	}

	if (state == "Jump")
	{
		if (velocity[YAXIS] < 0 and state_var[2] == 0)
		{
			if (!global.inputJumpHeld and !global.inputUpHeld)
			{
				state_var[2] = 1; 
				velocity[YAXIS]*=.7; // THIS NUMBER AFFECTS MINIMUM JUMP HEIGHT 
			}
		}
	}

	if !(onGround)
	{
		if state_previous == "Wall Slide"
		{
			scr_applyXMovement(global.inputHorizontalTotal,wallJumpXAccel, jumpMaxSpeed, wallJumpXFriction,jumpOverMaxFriction);
		}
		else
		{
			scr_applyXMovement(global.inputHorizontalTotal,jumpAccel, jumpMaxSpeed, jumpFriction,jumpOverMaxFriction);
		}
	
		// APPLY GRAVITY AND CHECK FOR APEX HANG TIME 
		if !(_inForgivenessFrames)
		{
			var _oldYVelocity = velocity[YAXIS]; 
			scr_applyGravity(jumpGravity); 
			var _newYVelocity = velocity[YAXIS]; 

			// CANCEL GRAVITY DURING APEX HANG TIME 
			if (state == "Jump")
			{
				if (_oldYVelocity < 0 and _newYVelocity >= 0 )
				{state_var[4] = 0; }
				if (
				state_var[2] == false
				and (state_var[4] >= 0 and state_var[4] <= jumpApexHangTimeFrames)
				)
				{velocity[YAXIS] = 0;state_var[4] += 1;}
			}
		}
	
		if (global.inputAttackPressed)
		{
			scr_stateSwitch("Sword Swing Air"); 
		}
		scr_playerStickToWallsAndMantle(); 
	
	}
	else
	{
		if (global.inputAttackPressed)
		{
			scr_actorSquashY(id, squashYStart, squashTime); 
			scr_playSoundVariant(.1, snd_playerLandA);
			scr_stateSwitch("Sword Swing Ground"); 
		
		}
	}

	switch facing
	{
		case 1:
			switch sign(velocity[YAXIS])
			{
				case -1:
					if (abs(velocity[YAXIS]) > jumpYForce*.25)
					{sprite_index = spr_playerJumpRight; image_index = 0;}
					else
					{sprite_index = spr_playerJumpRight; image_index = 1;}
					break;
				case 0:
					sprite_index = spr_playerJumpRight; 
					image_index = 1; 
					break; 
				case 1:
					if (abs(velocity[YAXIS]) < jumpYForce*.25)
					{sprite_index = spr_playerJumpRight; image_index = 1;}
					else
					{sprite_index = spr_playerFallRight; image_speed = .1; }
			}
			break; 
		case -1:
			switch sign(velocity[YAXIS])
			{
				case -1:
					if (abs(velocity[YAXIS]) > jumpYForce*.25)
					{sprite_index = spr_playerJumpLeft; image_index = 0;}
					else
					{sprite_index = spr_playerJumpLeft; image_index = 1;}
					break;
				case 0:
					sprite_index = spr_playerJumpLeft; 
					image_index = 1; 
					break; 
				case 1:
					if (abs(velocity[YAXIS]) < jumpYForce*.25)
					{sprite_index = spr_playerJumpLeft; image_index = 1;}
					else
					{sprite_index = spr_playerFallLeft; image_speed = .1; }
			}
			break; 
	}

	if (onGround and velocity[YAXIS] >= 0 and state_next != "Sword Swing Ground")
	{
		scr_playerSwitchToNeutralState(); scr_playSoundVariant(.1, snd_playerLandA);
		scr_actorSquashY(id, squashYStart, squashTime); 
	
	}

	if (global.inputGuardPressed)
	{
		scr_stateSwitch("Guard"); 
	}

	if (global.inputDashPressed and dashDuringJumpCounter < maxDashesPerJump
	and dashCooldownTimer <= 0)
	{
		scr_stateSwitch("Dash"); 
	}
	/*
	switch sprite_index
	{
		case spr_playerJumpRight:
		case spr_playerJumpLeft:
			if (facing == 1) {sprite_index = spr_playerJumpRight;}
			else if (facing == -1){sprite_index = spr_playerJumpLeft;}
			image_speed = .2; 
			if (image_index + image_speed >= image_number)
			{
				if (facing == 1)
				{sprite_index = spr_playerJumpRight;}
				else {sprite_index = spr_playerJumpLeft;}
				if (state_previous == "Slide")
				{velocity[YAXIS] = - slideJumpForce;}
				else
				{velocity[YAXIS] = -jumpForce;} 
			}
			break;
		case spr_playerJumpMidRight:
		case spr_playerJumpMidLeft:
		case spr_playerJumpFallRight:
		case spr_playerJumpFallLeft:
		case spr_playerDashAirLeft: 
		case spr_playerDashAirRight:
			var _loopAnimationSpeed = .21; 
		
			if (sprite_index != spr_playerDashAirLeft
			and sprite_index != spr_playerDashAirRight)
			{
		
				if (sprite_index == spr_playerJumpMidRight or sprite_index == spr_playerJumpMidLeft)
				{
					if (facing == 1) {sprite_index = spr_playerJumpMidRight;}
					else if (facing == -1){sprite_index = spr_playerJumpMidLeft;}
					image_speed = 0;
					var _imageThreshold = 2; // SPEED AT WHICH TRANSITIONS BETWEEN ANIMATION FRAMES WILL OCCUR
					if (velocity[YAXIS] < -_imageThreshold)
					{image_index = 0; }
					else if (velocity[YAXIS] > _imageThreshold)
					{image_index = 2; state_var[1] += _loopAnimationSpeed;
						if (state_var[1] >= 1 )
						{
							state_var[1] = 0;
							if (facing == 1)
							{sprite_index = spr_playerJumpFallRight;}
							else if (facing == -1)
							{sprite_index = spr_playerJumpFallLeft;}
						}
					}
					else
					{image_index = 1; }	
				}
				else 
				{
					if (facing == 1) {sprite_index = spr_playerJumpFallRight;}
					else if (facing == -1){sprite_index = spr_playerJumpFallLeft;}
					image_speed = _loopAnimationSpeed; 
				}
			}
		
			if onGround
			{
				scr_playSoundVocalize(id,.1, snd_playerLandA); 
				if blocking == false
				{
					if (facing == 1)
					{sprite_index = spr_playerJumpLandRight;}
					else 
					{sprite_index = spr_playerJumpLandLeft;}
					image_index = 0; 
				}
				else
				{
					scr_stateSwitch("Ground Block"); 
				}
			}
			else
			{
				if (global.inputGuardHeld)
				{
					if (sprite_index != spr_playerDashAirLeft
					and sprite_index != spr_playerDashAirRight)
					{image_index = 0;}
				
					if (image_index <= 2){image_speed = .3;}
					else{image_speed = .21;}
				
					blocking = true; 
					switch facing
					{
						case -1: sprite_index =   spr_playerDashAirLeft ; break; 
						case 1:  sprite_index  =  spr_playerDashAirRight; break; 
					}
					if (image_index + image_speed >= image_number)
					{image_index = 3;}
				}
				else if (blocking == true)
				{
					blocking = false; 
					switch facing
					{
						case -1: sprite_index =   spr_playerJumpMidRight; break; 
						case 1:  sprite_index  =  spr_playerJumpMidLeft; break; 
					}
				}
			}
			break; 
	
		case spr_playerJumpLandRight:
		case spr_playerJumpLandLeft:
			//velocity[YAXIS] = 0; 
			scr_playerPreventSlideOffLedge(); 
			if (global.inputHorizontalTotal != 0)
			{image_speed = .75;} // LANDING AND MOVING IMAGE SPEED
			else{image_speed = .75;} // LANDING AND STILL IMAGE SPEED
		
			if (global.inputUpPressed or global.inputJumpPressed)
			{
				scr_stateSwitch("Jump"); 
			}
		
			if (image_index + image_speed >= image_number)
			{
				scr_playerSwitchToNeutralState();
			}
			break; 
	}

	if (global.inputDashPressed and dashDuringJumpCounter < maxDashesPerJump
	and dashCooldownTimer <= 0)
	{
		scr_stateSwitch("Dash"); 
	}
	/*

/* end state_player_jump */
}
