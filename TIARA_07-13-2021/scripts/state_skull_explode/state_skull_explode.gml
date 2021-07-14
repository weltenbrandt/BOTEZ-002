function state_skull_explode() {
	if state_new
	{
		sprite_index = spr_skullExplode; 
		image_speed = explosionImageSpeed; 
		image_index = 0; 

		state_var[3] = false; // EXPLODED ALREADY
	}

	if (image_index > 5 and image_index - image_speed < 5)
	{
		var _hitbox = scr_spawnHitbox(id,explosionAttackDamage, false, 0,0, 100,100,explosionRadialForce,NULLVALUE,NULLVALUE,0,5,explosionTimeStopFrames,5,5, .1,.1,.1,NULLVALUE); 
	}

	if (image_index + image_speed >= image_number)
	{
		instance_destroy(); 
	}






}
