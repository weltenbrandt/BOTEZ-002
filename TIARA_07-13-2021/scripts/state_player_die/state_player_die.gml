function state_player_die() {
	if state_new
	{
	
		scr_playSoundVariant(.18, snd_die5); 
	
		state_var[1] = 0; 
		state_var[2] = false;
		flashTimer = hitStunFlashTime;  // THIS TRIGGERST THE PLAYER TO FLASH WHITE (VISUAL EFFECT ONLY) 
		invincibilityTimer = hitStunInvincibilityTime
	
		dead = true; 
	
		state_can_switch_from = false; 
		state_ignores_walls = true; 
		state_is_invincible = true; 
		image_index = 0; 
	
		image_speed = 0; 
		// DETERMINE SPRITE
		switch facing
		{
			case -1:
				sprite_index = spr_playerHitStunLeft;
				break;
			case 1:
				sprite_index = spr_playerHitStunRight;
				break;
		}
	
		// DETERMINE PUSH DIRECTION
		if (hitStunPushDir == NULLVALUE
		or hitStunPushDir == 0)
		{
			velocity[XAXIS] = hitStunXForce*facing*deathForceMultiplier; 
		}
		else
		{
			velocity[XAXIS] = hitStunPushDir*hitStunXForce*deathForceMultiplier;
		}
	
		velocity[YAXIS] = -hitStunYForce*deathForceMultiplier;
	}

	++state_var[1]; 
	if (state_var[1] >= deathFreezeFrames)
	{
		image_speed = deathAnimationSpeed; 
		switch facing
		{
			case -1:
				sprite_index = spr_playerDeathLeft;
				break;
			case 1:
				sprite_index = spr_playerDeathRight;
				break;
		}
	
	
	
	}




	if (image_index + image_speed >= image_number - 1)
	{
		image_speed = 0;
		state_var[2] = true;
	}




}
