function state_ghost_destroy() {
	if state_new
	{
		sprite_index = deathSprite; 
		image_speed = deathImageSpeed; 
		image_index = 0; 
		state_is_invincible = true; 
	}

	scr_applyXYFriction(hitStunFriction); 

	if (image_index + image_speed >= image_number)
	{
		instance_destroy(); 
	}






}
