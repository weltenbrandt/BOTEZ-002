function state_player_idle() {
	if state_new
	{
		blocking = false; 
		state_var[1] = 0;// WOBBLE TIMER
	#region SET IMAGE PROPERTIES
			switch state
			{
				case "Idle":
					if (facing == 1)
					{sprite_index = spr_playerIdleRight; }
					else if (facing = -1){sprite_index = spr_playerIdleLeft;}
					image_speed = .1; 
					break; 
				case "Ledge Wobble":
					if (facing == 1)
					{sprite_index = spr_playerLedgeWobbleRight; }
					else if (facing = -1){sprite_index = spr_playerLedgeWobbleLeft;}
					image_speed = .09; 
					break; 
			}
	#endregion
	}


	if (instance_exists(oTextbox))
	{
		exit;
	}
	
	switch state
	{
		case "Idle":
			if (state_previous != "Ledge Wobble")
			{
				if scr_checkForLedgeWobble()
				{
					scr_stateSwitch("Ledge Wobble");
				}
			}
			break;
		case "Ledge Wobble":
			state_var[1] += 1; 
			if (state_var[1] >= ledgeWobbleTime
			or !scr_checkForLedgeWobble())
			{
					scr_stateSwitch("Idle");
			}
			break;
	}

	if (global.inputHorizontalTotal != 0)
	{
		if (global.inputHorizontalTotal != facing)
		{turnRunTrigger = true;}
		else 
		{turnRunTrigger = false;}
		facing = sign(global.inputHorizontalTotal); 
		scr_stateSwitch("Run"); 
	}
	else
	{
		scr_applyXFriction(idleFriction,0); 
	}

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
