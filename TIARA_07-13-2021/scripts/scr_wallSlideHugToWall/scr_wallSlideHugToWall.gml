/// @description moves player to 'hug' wall before a mantle or a wallslide. 
function scr_wallSlideHugToWall() {
	var _dir = argument[0]; 

	switch _dir
	{
		case -1: x = ceil(x); break; 
		case 1: x = floor(x); break; 
	}


	var _checkFacing = _dir*-1;
	while (scr_playerCheckForValidWallSlideLocation(x + sign(_checkFacing),y,_checkFacing) == false)
	{
		x -= _dir; 
	}

#region SPECIAL FAILSAFE TO PREVENT X MOVEMENT INTO WALL SLIDES ON RIGHT SIDE
	if (_checkFacing == 1)
	{
		var _topCollision = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top + 1); 
		var _halfWayY = bbox_top + ((bbox_bottom - bbox_top)*.5);

		if	(_topCollision != 0)
		or (tilemap_get_at_pixel(tilemap,bbox_right, bbox_bottom - 1) != 0)
		or (tilemap_get_at_pixel(tilemap, bbox_right, _halfWayY) != 0)
		{
			x -= 1;
		}
	}
	#endregion


}
