function scr_playerCheckForValidWallSlideLocation() {
	var _xx = argument[0]; 
	var _yy = argument[1]; 
	var _checkFacing = argument[2]; 

	var _oldX = x; 
	var _oldY = y; 

	x = _xx; 
	y = _yy; 
	if (_checkFacing == -1)
	{var _bbox = bbox_left;}
	else {var _bbox = bbox_right;}

	var _topCollision = tilemap_get_at_pixel(tilemap, _bbox + sign(_checkFacing), bbox_top + 1); 
	var _halfWayY = bbox_top + ((bbox_bottom - bbox_top)*.5);

	if	(_topCollision == 0)
	and (tilemap_get_at_pixel(tilemap,_bbox + _checkFacing, bbox_bottom - 1) == 0)
	and (tilemap_get_at_pixel(tilemap, _bbox + _checkFacing, _halfWayY) == 0)
	{
		x = _oldX; 
		y = _oldY; 
		return false; 
	}
	else 
	{
	
	
		x = _oldX; 
		y = _oldY; 
		return true; 
	}


}
