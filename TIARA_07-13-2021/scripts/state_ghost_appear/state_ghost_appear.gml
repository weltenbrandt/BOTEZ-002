function state_ghost_appear() {
	if state_new
	{
		sprite_index = spr_ghostAppear; 
		image_index = 0; 
		image_speed = appearImageSpeed; 
		state_is_invincible = false;
	}

	scr_enemyFacePlayer();

	if (image_index + image_speed >= image_number - 1)
	{
		sprite_index = idleSprite; 
		scr_stateSwitch("Chase"); 
	}


}
