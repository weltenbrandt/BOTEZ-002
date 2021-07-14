function state_player_run() {
	if state_new
	{
		blocking = false; 
		runTimer = 0; 
		state_var[1] = 0; // INTERNAL TIMER 
		state_var[3] = scr_playSoundVocalize(id,.1, snd_playerStartRunA);
	#region SET IMAGE PROPERTIES
			if (facing == -1)
			{sprite_index = spr_playerRunLeft;}
		
			else if (facing == 1)
			{sprite_index = spr_playerRunRight;}
	#endregion
	
		if (
		((abs(velocity[XAXIS]) > runMaxSpeed)
		or ((state_previous == "Jump" or state_previous == "Fall") and abs(velocity[XAXIS]) >= runMaxSpeed))
		and global.inputHorizontalTotal != sign(velocity[XAXIS]))
		{
			switch global.inputHorizontalTotal
			{
				case -1: 
					facing = -1;
					sprite_index = spr_playerRunStopRight; velocity[XAXIS] = 0; break; 
				case 0:
					if (facing == 1){sprite_index = spr_playerRunStopRight;}
					else {sprite_index = spr_playerRunStopLeft;}
					break; 
				case 1:
					facing = 1; 
					sprite_index = spr_playerRunStopLeft; velocity[XAXIS] = 0; break; 
					break; 
			}
			image_index = 0;
		}
	}
	++runTimer; 

	var _accel = runAccel; 
	if (sprite_index == spr_playerRunTurnRightToLeft or sprite_index == spr_playerRunTurnLeftToRight)
	{_accel = runTurnAccel; }


	scr_applyXMovement(global.inputHorizontalTotal,_accel,runMaxSpeed,runSlideFriction,runOverMaxFriction);

	switch sprite_index
	{
		case spr_playerRunLeft:
		case spr_playerRunRight:
			 if ((floor(image_index) == 4 or floor(image_index) == 9
			 or floor(image_index) == 14
			  or floor(image_index) == 19)
	        and (floor(image_index) != floor(image_index - image_speed)))
	        {
	            scr_playSoundVariant(.1, snd_playerFootstepA); 
	        }
			image_speed = runImageSpeed; 
			switch sign(velocity[XAXIS])
			{
				case -1:
					sprite_index = spr_playerRunLeft; 
					if (global.inputHorizontalTotal == 0)
					{sprite_index = spr_playerRunStopLeft;image_index = 0;  scr_playSoundVariant(.1, snd_playerRunStopA); }
					else if (global.inputHorizontalTotal == 1)
					{
						sprite_index = spr_playerRunTurnLeftToRight;image_index = 0;  scr_playSoundVariant(.1, snd_playerRunStopA); 
					}
					break; 
				case 1:
					sprite_index = spr_playerRunRight; 
					if (global.inputHorizontalTotal == 0)
					{sprite_index = spr_playerRunStopRight;image_index = 0;  scr_playSoundVariant(.1, snd_playerRunStopA); }
					else if (global.inputHorizontalTotal == -1)
					{
						sprite_index = spr_playerRunTurnRightToLeft;image_index = 0;  scr_playSoundVariant(.1, snd_playerRunStopA); 
					}
					break; 
			}
			break; 
		case spr_playerRunStopLeft:
		case spr_playerRunStopRight:
			scr_playerPreventSlideOffLedge();
			if sprite_index == spr_playerRunStopLeft
			{
				if (global.inputHorizontalTotal == 1)
				{sprite_index = spr_playerRunTurnRightToLeft;image_index = 0; scr_playSoundVariant(.1, snd_playerRunStopA);}
			}
			else
			{
				if (global.inputHorizontalTotal == -1)
				{sprite_index = spr_playerRunTurnLeftToRight;image_index = 0; scr_playSoundVariant(.1, snd_playerRunStopA);}
			}
		
			if (sprite_index == spr_playerRunStopLeft or sprite_index == spr_playerRunStopRight)
			{
				image_speed = runStopImageSpeed; 
				if (image_index + image_speed >= image_number)
				{image_speed = 0;}
				if ((sign(velocity[XAXIS]) == global.inputHorizontalTotal) and image_speed == 0)
				{
					switch sign(velocity[XAXIS])
					{
						case -1: sprite_index = spr_playerRunLeft;break; 
						case 1: sprite_index = spr_playerRunRight;break; 
					}
				}
			}
			break; 
		case spr_playerRunTurnLeftToRight:
		case spr_playerRunTurnRightToLeft:
			scr_playerPreventSlideOffLedge();
			image_speed = runTurnImageSpeed; 
			if (image_index + image_speed >= image_number)
			{image_speed = 0;}
		
			if (sprite_index == spr_playerRunTurnLeftToRight and global.inputHorizontalTotal == -1)
			{sprite_index = spr_playerRunTurnRightToLeft;image_index = 0; scr_playSoundVariant(.1, snd_playerRunStopA);}
			if (sprite_index == spr_playerRunTurnRightToLeft and global.inputHorizontalTotal == 1)
			{sprite_index = spr_playerRunTurnLeftToRight;image_index = 0; scr_playSoundVariant(.1, snd_playerRunStopA);}
			if (
			(sign(velocity[XAXIS]) == global.inputHorizontalTotal or global.inputHorizontalTotal == 0)
			and (image_speed == 0)
			)
			{
				if (velocity[XAXIS] != 0)
				{
					switch sprite_index
					{
						case spr_playerRunTurnLeftToRight: sprite_index = spr_playerRunRight; break; 
						case spr_playerRunTurnRightToLeft: sprite_index = spr_playerRunLeft; break; 
					}
				}
				else
				{
					switch sprite_index
					{
						case spr_playerRunTurnLeftToRight: sprite_index = spr_playerIdleRight; facing = 1; break; 
						case spr_playerRunTurnRightToLeft: sprite_index = spr_playerIdleLeft; facing = -1;break; 
					}
				
				}
			}
			break; 
	}


	// STATE SWITCH LOCKED 
	if (velocity[XAXIS] == 0 
	and sprite_index !=spr_playerRunTurnLeftToRight
	and sprite_index != spr_playerRunTurnRightToLeft)
	{scr_stateSwitch("Idle");}


	if (global.inputAttackPressed)
	{
		scr_stateSwitch("Sword Swing Ground"); 
	}

	if (global.inputUpPressed or global.inputJumpPressed)
	{
		scr_stateSwitch("Jump"); 
	}

	if (global.inputGuardHeld)
	{
		scr_stateSwitch("Guard"); 
	}

	if !(onGround)
	{
		scr_stateSwitch("Fall"); 
	}

	if (global.inputDashPressed and dashCooldownTimer <= 0)
	{
		scr_stateSwitch("Dash"); 
	}


}
