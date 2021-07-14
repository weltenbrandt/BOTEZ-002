function scr_isOnGround() {
	var _halfWayX = bbox_left+ ((bbox_right - bbox_left)*.5);
	if (object_index == obj_player and state_ignores_walls){return false;}

	if (
	(tilemap_get_at_pixel(tilemap, bbox_left,  bbox_bottom + 1) != 0)
	or (tilemap_get_at_pixel(tilemap, bbox_right - 1, bbox_bottom + 1) != 0)
	or (tilemap_get_at_pixel(tilemap, _halfWayX, bbox_bottom + 1) != 0)
	)
	{
		velocity[YAXIS] = 0; 
		return true; 
	}
	else 
	{
		if (place_meeting(x,y +1, myPlatform) and myPlatform.ethereal == false){return true;}
		else {myPlatform = NULLVALUE;}
		return false; 
	}


}
