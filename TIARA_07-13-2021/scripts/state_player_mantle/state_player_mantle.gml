function state_player_mantle() {
	if state_new
	{
		scr_playSoundVocalize(id,.1, snd_playerMantleA); 
		velocity[XAXIS] = 0; 
		velocity[YAXIS] = 0;
		show_debug_message("WALL MANTLE START, FACING: " + string(facing)); 
	
		if (state == "Mantle")
		{
			state_var[0] = 1;
			switch facing
			{
				case 1:sprite_index = spr_playerMantleRight;break; 
				case -1:sprite_index = spr_playerMantleLeft;break; 
		
			}
		}
		else if (state == "Ledge Grab")
		{
			state_var[0] = 0; 
			switch facing
			{
				case 1:sprite_index = spr_playerLedgeGrabRight; break; 
				case -1:sprite_index = spr_playerLedgeGrabLeft;break; 
			}
		}
	
		if facing == 1 {var _bbox = bbox_right;}else {var _bbox = bbox_left;}
	
		while (tilemap_get_at_pixel(tilemap, _bbox + facing*2, bbox_top + 1) == 0)
		{
			y += 1; 
		}
		image_index = 0; 
	}


	switch state_var[0]
	{
		case 0: // LEDGE GRAB BEFORE MANTLE ANIMATION
			image_speed = .05; 
			if (image_index + image_speed >= image_number)
			{
				image_index = 0; 
				state_var[0] = 1; 
				switch facing
				{
					case 1:sprite_index = spr_playerMantleRight;break; 
					case -1:sprite_index = spr_playerMantleLeft;break; 
				}
			}
			break; 
		case 1: // MANTLING NOT YET REPOSITIONED
			image_speed = .1;
			if (floor(image_index) == image_number - 1)
			{
				state_var[0] = 2; 
				x += facing*sprite_get_width(mask_index); 
				y -= sprite_get_height(mask_index);
				y = ceil(y); 
				while (tilemap_get_at_pixel(tilemap, x, bbox_bottom + 1) == 0)
				{
					y += 1; 
				}
				onGround = true; 
			}
			break; 
		case 2: // MANTLING REPOSITONED
			image_speed = .1;
			if (image_index + image_speed >= image_number)
			{
				scr_playerSwitchToNeutralState(); 
			}
			break; 
	}



}
