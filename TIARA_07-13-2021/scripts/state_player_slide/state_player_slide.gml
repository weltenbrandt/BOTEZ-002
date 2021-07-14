function state_player_slide() {
	if state_new
	{
		if (facing == 1)
		{sprite_index = spr_playerSlideStartRight; }
		else
		{sprite_index = spr_playerSlideStartLeft;}
		image_speed = .2; 
		image_index = 0; 
	}

	switch sprite_index
	{
		case spr_playerSlideStartRight:
		case spr_playerSlideStartLeft:
			image_speed = .4; 
			scr_applyXMovement(facing, 0, runMaxSpeed, 0); 
			if (image_index + image_speed >= image_number)
			{
				if (facing == 1)
				{sprite_index = spr_playerSlideLoopRight; }
				else
				{sprite_index = spr_playerSlideLoopLeft;}
				image_index = 0; 
				velocity[XAXIS] += slideBoost*facing; 
			}
		
			if (!global.inputDownHeld)
			{
				if (facing == 1) {sprite_index = spr_playerSlideGetUpRight;image_index = 0;}
				else {sprite_index = spr_playerSlideGetUpRight;image_index = 0;}
			}
			break; 
		case spr_playerSlideLoopRight:
		case spr_playerSlideLoopLeft:
			image_speed = .2; 
			scr_applyXFriction(slideFriction);
			if (velocity[XAXIS] == 0 or !global.inputDownHeld)
			{
				if (facing == 1) {sprite_index = spr_playerSlideGetUpRight;image_index = 0;}
				else {sprite_index = spr_playerSlideGetUpRight;image_index = 0;}
			}
			break; 
		case spr_playerSlideGetUpRight:
		case spr_playerSlideGetUpLeft:
			image_speed = .2; 
			if (image_index + image_speed >= image_number)
			{
				scr_stateSwitch("Idle"); 
			}
			break; 
	}

	if !(onGround)
	{
		scr_stateSwitch("Fall"); 
	}

	if (global.inputJumpPressed or global.inputUpPressed)
	{
		if (global.inputHorizontalTotal != 0)
		{facing = global.inputHorizontalTotal;}
		scr_stateSwitch("Jump"); 
	}


}
