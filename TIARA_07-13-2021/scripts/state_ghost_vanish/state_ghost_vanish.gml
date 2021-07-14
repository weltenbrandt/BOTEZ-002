function state_ghost_vanish() {
	if state_new
	{
		sprite_index = spr_ghostVanish; 
		image_index = 0; 
		state_is_invincible = false;
		image_speed = appearImageSpeed; 
	}

	scr_applyXYFriction(chaseFriction); 

	// VANISH ANIMATION FINISHED (TELEPORTATION LOGIC)  
	if (image_index + image_speed >= image_number - 1)
	{
		var _p = obj_player; 
		if scr_isValidInstance(_p)
		{
			velocity[XAXIS] = 0; 
			velocity[YAXIS] = 0; 
			var _pY = scr_returnMaskYMiddle(_p)
			var _rad = irandom_range(teleportMinRadius,teleportMaxRadius);
			var _dir = irandom_range(0,180); 
			x = obj_player.x + lengthdir_x(_rad, _dir); 
			y = _pY + lengthdir_y(_rad,_dir); 
			sprite_index = spr_ghostInvisible; 
			scr_stateSwitch("Idle"); 
		}
	}


}
