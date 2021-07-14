function state_player_sword_swing_jump() {
	if state_new
	{
		blocking = false; 
		state_var[1] = 0; // INTERNAL TIMER
		state_var[2] = 0; // HAS RELEASED JUMP
		state_var[3] = jumpMaxSpeed; // MAX SPEED FOR THIS JU
	
		if (global.inputHorizontalTotal != 0)
		{facing = global.inputHorizontalTotal;}

		velocity[YAXIS] = jumpYForce;
	
		switch nextSwordSwingType
		{
			case 0:
				if (facing == 1)
				{sprite_index = spr_playerSwordAirSlashDownRight;}
				else {sprite_index = spr_playerSwordAirSlashDownLeft;}
				//nextSwordSwingType = 1; 
				break;
			case 1:
				if (facing == 1)
				{sprite_index = spr_playerSwordAirSlashUpRight;}
				else 
				{sprite_index = spr_playerSwordAirSlashUpLeft;}
				//nextSwordSwingType = 0; 
				break 
		}
		scr_clearHitboxesForOwner(id, false);
		scr_spawnHitbox(id, 1, false,22,-25,45,50,NULLVALUE,3,-1,2,15,swordTimeStopFrames,meleeAttackXShakeForce,meleeAttackYShakeForce,meleeAttackXShakeDecay,meleeAttackXShakeDecay,.1,snd_playerSwordHitA); 
	}

	if (velocity[XAXIS] != 0)
	{
		facing = sign(velocity[XAXIS]); 
	}

	if (velocity[YAXIS] < 0 and state_var[2] == 0)
	{
		if (!global.inputJumpHeld and !global.inputUpHeld)
		{
			state_var[2] = 1; 
			velocity[YAXIS]*=.7; // THIS NUMBER AFFECTS MINIMUM JUMP HEIGHT 
		}
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
	
		if (image_index >= 2)
		{
			scr_playerStickToWallsAndMantle();
			if global.inputAttackPressed
			{scr_stateSwitch("Sword Swing Air");}
		
		}
	}
	else
	{
		if (image_index >= 2 and global.inputAttackPressed)
		{
			scr_stateSwitch("Sword Swing Ground"); 
		}
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
