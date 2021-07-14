function state_player_sword_swing_ground() {
	if state_new
	{
		blocking = false; 
		// ADDING SPEED
		if (state_previous != "Sword Swing Air" and state_previous != "Sword Swing Jump")
		{
			if (abs(velocity[XAXIS]) < groundSlashXVelocity)
			{
				velocity[XAXIS] = facing*groundSlashXVelocity
			}
		}
		if (state_previous != "Sword Swing Air" and state_previous != "Sword Swing Jump")
		{
			scr_playSoundVariant(.1, snd_playerSwordSwingA); 
			image_index = 0;
			if (global.inputHorizontalTotal != 0)
			{facing = global.inputHorizontalTotal;}
	
			switch nextSwordSwingType
			{
				case 1:
					if (facing == 1)
					{sprite_index = spr_playerSwordSlashDownRight;}
					else {sprite_index = spr_playerSwordSlashDownLeft;}
					nextSwordSwingType = 0; 
					break;
				case 0:
					if (facing == 1)
					{sprite_index = spr_playerSwordSlashUpRight;}
					else 
					{sprite_index = spr_playerSwordSlashUpLeft;}
					nextSwordSwingType = 1; 
					break 
			}
		}
		else
		{
			switch sprite_index
			{
				case spr_playerSwordAirSlashUpRight:
					sprite_index = spr_playerSwordSlashUpRight;
					break; 
				case spr_playerSwordAirSlashUpLeft:
					sprite_index = spr_playerSwordSlashUpLeft;
					break; 
				case spr_playerSwordAirSlashDownRight:
					sprite_index = spr_playerSwordSlashDownRight;
					break; 
				case spr_playerSwordAirSlashDownLeft:
					sprite_index = spr_playerSwordSlashDownLeft;
					break; 
			}
		}
		scr_clearHitboxesForOwner(id, false);
		state_var[3] = scr_spawnHitbox(id, 1, false,22,-25,45,50,NULLVALUE,3,-1,2,15,swordTimeStopFrames,meleeAttackXShakeForce,meleeAttackYShakeForce,meleeAttackXShakeDecay,meleeAttackXShakeDecay,.1,snd_playerSwordHitA); 
	} 
	scr_applyXFriction(groundSwordSwingFriction); 

	image_speed = .22; 

	// ALLOW CANCEL TO NEXT ATTACK ON FINAL FRAME OF THIS ATTACK
	if (image_index >= 2)
	{
	
		if (global.inputAttackPressed)
		{
			scr_stateSwitch(state); 
		}
	}

	if (global.inputJumpPressed or global.inputUpPressed)
	{
		scr_stateSwitch("Sword Swing Jump"); 
	}

	if scr_isValidInstance(state_var[3]) and state_var[3].connected == true
	{
		if (global.inputDashPressed and dashCooldownTimer <= 0)
		{scr_stateSwitch("Dash");}
	}

	// RETURN TO NEUTRAL STATE IF WE FINISH ANIMATION
	if (image_index + image_speed >= image_number)
	{
		//nextSwordSwingType = 0;
		scr_clearHitboxesForOwner(id, false);
		scr_playerSwitchToNeutralState();
	}

	// FALL IF WE HAVE NO GROUND BELOW US 
	if !(onGround)
	{
		//nextSwordSwingType = 0;
		scr_clearHitboxesForOwner(id, false);
		scr_stateSwitch("Fall"); 
	}


}
