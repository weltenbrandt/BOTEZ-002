function state_player_hit_stun() {
	if state_new
	{
		image_index = 0; 
		invincibilityTimer = hitStunInvincibilityTime;
		state_var[1] = hitStunFrames; 
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
	
		if (xHitForce != NULLVALUE
		or yHitForce != NULLVALUE)
		{
			velocity[XAXIS] = xHitForce;
			velocity[YAXIS] = yHitForce;
		}
		else
		{
			if (hitStunPushDir == NULLVALUE
			or hitStunPushDir == 0)
			{
				velocity[XAXIS] = hitStunXForce*facing; 
			}
			else
			{
				velocity[XAXIS] = hitStunPushDir*hitStunXForce;
			}
	
			velocity[YAXIS] = -hitStunYForce;
		}
	
		if (onGround){velocity[YAXIS] = 0;}
	
		hitStunXForce = NULLVALUE;
		hitStunYForce = NULLVALUE; 
	}
	image_speed = hitStunImageSpeed; 
	// HIT STUN FRAMES TIMER

	--state_var[1]; 
	// APPLY GRAVITY AND FRICTION
	scr_applyGravity(jumpGravity); 
	if onGround
	{scr_applyXFriction(hitStunGroundXFriction);}
	else
	{scr_applyXFriction(hitStunAirXFriction); }

	//if (!state_new and onGround and abs(velocity[XAXIS]) == 0)
	if (state_var[1] <= 0)
	{
		scr_playerSwitchToNeutralState(); 
	}


}
