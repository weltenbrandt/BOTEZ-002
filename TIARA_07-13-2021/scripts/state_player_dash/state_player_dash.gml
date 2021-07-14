function state_player_dash() {
	if state_new
	{
	
		scr_playSoundVariant(.1, snd_playerDashA); 
		blocking = false;
		if (global.inputHorizontalTotal != 0)
		{facing = global.inputHorizontalTotal;}
	
		if onGround
		{
			switch facing
			{
				case -1:sprite_index = spr_playerDashLeft; break;
				case 1: sprite_index = spr_playerDashRight; break;
			}
		}
		else
		{
			switch facing
			{
				case -1:sprite_index = spr_playerDashAirLeft; break;
				case 1: sprite_index = spr_playerDashAirRight; break;
			}
		}
		
		image_index = 0; 
	
		state_var[0] = dashFrictionStart;
		state_var[1] = 0; // FREEZE TIMER
		state_var[2] = false; // ANIMATION END HAS BEEN TRIGGERED
		velocity[XAXIS] = dashStartXVelocity*facing; 
		if !(airDashPreservesVerticalMomentum)
		{velocity[YAXIS] = 0;}
		dashDuringJumpCounter += 1; 
	}

	image_speed = dashAnimationSpeed; 

	state_var[0] += dashFrictionAccel; 
	if (state_var[0] >= dashFrictionMax)
	{state_var[0] = dashFrictionMax;}

	scr_applyXFriction(state_var[0]); 

	if (image_index + image_speed >= image_number -1 )
	{
		image_index = image_number - 1; 
	}

	if (velocity[XAXIS] == 0)
	{
		dashCooldownTimer = dashCooldown; 
	
		if onGround
		{
			scr_playerSwitchToNeutralState();
		}
		else
		{
			state_var[1] += 1; 
			if (state_var[1] >= dashAirFreezeTime)
			{
				scr_playerSwitchToNeutralState();
			}
		}
	}

	if global.inputAttackPressed
	{
		dashCooldownTimer = dashCooldown;
		scr_stateSwitch("Shoryuken"); 
	}


	if (image_index + image_speed >= image_number)
	{
		image_index = 3; 
	}

	if (global.inputGuardPressed)
	{
		scr_stateSwitch("Guard"); 
	}
	if onGround
	{

		if (global.inputJumpPressed or global.inputUpPressed)
		{
			dashCooldownTimer = dashCooldown;
			scr_stateSwitch("Jump"); 
		}
	}


}
