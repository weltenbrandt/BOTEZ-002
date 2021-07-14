function scr_checkForLedgeWobble() {
	var _wobbleThreshold = LEDGE_WOBBLE_THRESHOLD + 2; 
	var _tileWobble = false; 
	var _solidWobble = false; 

	switch facing
	{
		case -1:
			if (tilemap_get_at_pixel(tilemap, bbox_right -_wobbleThreshold, y + 1) == 0
			and tilemap_get_at_pixel(tilemap, bbox_left, y + 1) == 0
			)
			{
				_tileWobble = true;
			}
			break;
		case 1:
			if (tilemap_get_at_pixel(tilemap, bbox_left +_wobbleThreshold, y + 1) == 0
			and tilemap_get_at_pixel(tilemap, bbox_right, y + 1) == 0
			)
			{
				_tileWobble = true; 
			}
			break;
	}

	switch facing
	{
		case -1:
			if (!position_meeting(bbox_right -_wobbleThreshold, y + 1, par_solidWorld)
			and !position_meeting(bbox_left, y + 1,par_solidWorld))
			{
				_solidWobble = true;
			}
			break;
		case 1:
			if (!position_meeting(bbox_left +_wobbleThreshold, y + 1, par_solidWorld)
			and !position_meeting(bbox_right, y + 1,par_solidWorld))
			{
				_solidWobble = true; 
			}
			break;
	}


	return (_solidWobble and _tileWobble)


}
