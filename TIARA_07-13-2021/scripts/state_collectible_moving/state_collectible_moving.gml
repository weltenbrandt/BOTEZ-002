function state_collectible_moving() {
	if state_new
	{
		state_var[1] = 0; // TIMER
	}

	++ state_var[1]; 

	if (state_var[1] >= collectTime)
	{collectible = true; }

	scr_applyGravity(myGravity); 
	var _yCheck = bbox_bottom + velocity[YAXIS] + 2; 

	// TILE COLLISION BOUNCES
	var _halfWayX = bbox_left+ ((bbox_right - bbox_left)*.5);
	if (
	(tilemap_get_at_pixel(tilemap, bbox_left,_yCheck) != 0)
	or (tilemap_get_at_pixel(tilemap, bbox_right,_yCheck) != 0)
	or (tilemap_get_at_pixel(tilemap, _halfWayX, _yCheck) != 0)
	)
	{
		if (abs(velocity[YAXIS]) > 1)
		{
			scr_playSoundVariant(.33, snd_plingg2);
			velocity[YAXIS] *= -yBounceMultiplier;
		}
	}

	// PLATFORM COLLISION BOUNCES
	var _solidWorldList = ds_list_create(); 
	var _num = instance_place_list(x, y + velocity[YAXIS], par_solidWorld, _solidWorldList,false); 
	for (var i = 0; i < _num; ++i)
	{
		var _solidTouching = ds_list_find_value(_solidWorldList, i); 
		if (abs(velocity[YAXIS]) > 1 and velocity[YAXIS] > 0  and bbox_bottom < _solidTouching.bbox_top
		and _solidTouching.ethereal == false)
		{
			scr_playSoundVariant(.33, snd_plingg2);
			velocity[YAXIS] *= -yBounceMultiplier;
		}
	}
	ds_list_destroy(_solidWorldList); 
	

	if onGround
	{
		scr_applyXFriction(myFriction); 
	}


}
