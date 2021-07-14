function state_minotaur_mill_around() {
	if state_new
	{
		sprite_index = walkSprite; 
		state_var[1] = irandom(80);  // PAIRED VARIABLDE A: THE HIGHER THIS NUMBER, THE MORE LIKELY THIS ENEMY IS TO STOP TRAVELLING BEFORE HE HITS A WALL
		// CHOOSE RANDOM FACING
		scr_enemySetFacing(choose(-1,1));
		// IF OUR RANDOM FACING IS REALLY CLOSE TO THE EDGE, FLIP IT
		if (
		((facing == -1 and tilemap_get_at_pixel(tilemap, bbox_left - 10,  bbox_bottom + 1) == 0)or (facing == 1 and tilemap_get_at_pixel(tilemap, bbox_right - 1 + 10, bbox_bottom + 1) == 0))
		or
		((facing == -1 and tilemap_get_at_pixel(tilemap, bbox_left - 5,  bbox_bottom) != 0)or (facing == 1 and tilemap_get_at_pixel(tilemap, bbox_right - 1 + 5, bbox_bottom) != 0))
		or (facing == -1 and place_meeting(bbox_left + facing*6,  bbox_bottom, obj_enemyBounder))
		or (facing == 1 and place_meeting(bbox_right + facing*5,  bbox_bottom, obj_enemyBounder))
		)
		{	scr_enemySetFacing(facing*-1);}
	
		image_speed = walkImageSpeed; 
	}

	state_var[1] += 1; 

	// NORMAL MILL AROUND BEHAVIOR CONTROLS (SWITCHES TO IDLE IF WE HAVE MILLED 'LONG ENOUGH'
	if (state_var[1] >= 120) // PAIRED VARIABLE B: THE LOWER THIS NUMBER, THE MORE QUICKLY THIS ENEMY WILL STOP TRAVELLING WITHOUT HITTING A WALL
	{
		scr_applyXFriction(walkFriction); 
		if (velocity[XAXIS] == 0)
		{
			scr_stateSwitch("Idle"); 
		}
	}

	// SWITCH TO IDLE IF WE ARE ABOUT TO WALK OFF A LEDGE
	if (scr_groundEnemyPreventWalkingOffLedges()) 
	{
		scr_stateSwitch("Idle"); 
	}
	// IF WE'RE NOT WALKING OFF OF A LEDGE, APPLY X MOVEMENT
	else
	{
		scr_applyXMovement(facing,walkAccel,walkMaxSpeed,walkFriction);
	}

	// CHECK FOR AND SWITCH TO CHASE PLAYER
	scr_minotaurCheckForChasePlayer(); 


}
