function state_player_sword_swing_air() {
	if state_new
	{
		scr_playSoundVariant(.1, snd_playerSwordSwingA); 
		blocking = false; 
		image_index = 0; 
	
		if (global.inputHorizontalTotal != 0)
		{facing = global.inputHorizontalTotal;}
	
		switch nextSwordSwingType
		{
			case 1:
				if (facing == 1)
				{sprite_index = spr_playerSwordAirSlashDownRight;}
				else {sprite_index = spr_playerSwordAirSlashDownLeft;}
				nextSwordSwingType = 0; 
				break;
			case 0:
			if (facing == 1)
				{sprite_index = spr_playerSwordAirSlashUpRight;}
				else 
				{sprite_index = spr_playerSwordAirSlashUpLeft;}
				nextSwordSwingType = 1; 
				break 
		}
		scr_clearHitboxesForOwner(id, false);
		scr_spawnHitbox(id, 1, false,22,-25,45,50,NULLVALUE,3,-1,2,15,swordTimeStopFrames,meleeAttackXShakeForce,meleeAttackYShakeForce,meleeAttackXShakeDecay,meleeAttackXShakeDecay,.1,snd_playerSwordHitA); 
	}


	image_speed = .15; 

	// ALLOW CANCEL TO NEXT ATTACK ON FINAL FRAME OF THIS ATTACK
	if (image_index >= 2 and global.inputAttackPressed)
	{
		scr_stateSwitch(state); 
	}

	if !(onGround)
	{
		scr_applyXMovement(global.inputHorizontalTotal,jumpAccel, jumpMaxSpeed, jumpFriction,jumpOverMaxFriction)
		scr_applyGravity(jumpGravity);
		if (image_index >= 2) {scr_playerStickToWallsAndMantle();}
	}
	else
	{
		//nextSwordSwingType = 0;
		scr_stateSwitch("Sword Swing Ground"); 
		velocity[YAXIS] = 0; 
	}

	// RETURN TO NEUTRAL STATE IF WE FINISH ANIMATION
	if (image_index + image_speed >= image_number)
	{
		//nextSwordSwingType = 0;
		scr_clearHitboxesForOwner(id, false);
		scr_playerSwitchToNeutralState();
	}

	if (global.inputDashPressed and dashCooldownTimer <= 0)
	{
		scr_clearHitboxesForOwner(id, false);
		scr_stateSwitch("Dash"); 
	}



}
