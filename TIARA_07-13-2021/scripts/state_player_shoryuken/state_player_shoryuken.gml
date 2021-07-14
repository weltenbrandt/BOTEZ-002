function state_player_shoryuken() {
	if state_new
	{

		switch state_previous
		{
			//case "Wall Slide":
			//	if (facing == 1)
			//	{sprite_index = spr_shoryukenWallJumpRightStartup;}
			//	else
			//	{sprite_index = spr_shoryukenWallJumpLeftStartup;}
			//	velocity[XAXIS] = facing*shoryukenJumpXforce;
			//	velocity[YAXIS] = shoryukenJumpYForce; 
			//	break; 
			default:
				if (facing == 1)
				{sprite_index = spr_shoryukenDashRightStartup;}
				else
				{sprite_index = spr_shoryukenDashLeftStartup;}
				
		}
		state_var[0] = 0; // 0 - startup frames, 1 - shoryuken animation
		state_var[3] = false; // HAS HITBOX BEEN SPAWNED
	
		scr_playSoundVariant(.1,snd_playerSwordSwingA);
				
	
	}


	switch state_var[0]
	{
		case 0:
			image_speed = shoryukenStartupImageSpeed; 
			scr_applyXFriction(shoryukenXFriction); 
			scr_applyGravity(shoryukenGravity);
		
			if (image_index + image_speed >= image_number - 1)
			{
				switch facing
				{
					case 1:
						sprite_index = spr_shoryukenRight; 
						break; 
					case -1:
						sprite_index = spr_shoryukenLeft; 
						break; 
				}
				if (state_previous != "Wall Slide")
				{
					scr_nudgeVertical(-25); // THIS SCRIPT MOVES US VERTICALLY BUT AVOIIDS GOING INSIDE WALLS
				} 
				image_index = 0; 
				state_var[0] = 1; 
			}
			break;
		case 1:
			if (state_var[3] == false)
			{
				//if (state_previous != "Wall Slide")
				//{
					velocity[XAXIS] = facing*shoryukenJumpXforce;
					velocity[YAXIS] = shoryukenJumpYForce; 
				//}
				state_var[3] = true; 
				scr_spawnHitbox(id,shoryukenDamage, false, 25,-35,55, 110, NULLVALUE, shoryukenAttackXForce, shoryukenAttackYForce, 0, 15,shoryukenTimeStopFrames,shoryukenXHitShake,shoryukenYHitShake,shoryukenXHitShakeDecay,shoryukenYHitShakeDecay,.1, snd_playerSwordHitA); 
			}
			scr_applyXFriction(shoryukenXFriction); 
			scr_applyGravity(shoryukenGravity);

			image_speed = shoryukenImageSpeed; 
			if (image_index + image_speed >= image_number - 1)
			{
				scr_stateSwitch("Fall"); 
			}
			break;
	}

	if (image_index + image_speed >= image_number - 1)
	{
		scr_stateSwitch("Fall"); 
		dashCooldownTimer = dashCooldown; 
	}


}
