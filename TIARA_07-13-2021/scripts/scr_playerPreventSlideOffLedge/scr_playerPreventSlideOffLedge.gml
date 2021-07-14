function scr_playerPreventSlideOffLedge() {

	var _currXVelocity = velocity[XAXIS]; 
	var _currXVelSign = sign(_currXVelocity); 

	var _halfWayX = bbox_left+ ((bbox_right - bbox_left)*.5) + _currXVelocity;

	var _extraBuffer = LEDGE_WOBBLE_THRESHOLD;

	if (
	(tilemap_get_at_pixel(tilemap, bbox_left + _extraBuffer + _currXVelocity,  bbox_bottom + 1) == 0)
	and (tilemap_get_at_pixel(tilemap, bbox_right - _extraBuffer - 1 + _currXVelocity, bbox_bottom + 1) == 0)
	and (tilemap_get_at_pixel(tilemap, _halfWayX + _currXVelocity, bbox_bottom + 1) == 0)
	)
	{
		velocity[XAXIS] = 0; 
		switch _currXVelSign
		{
			case 1:
				x = floor(x); 
				while (tilemap_get_at_pixel(tilemap, bbox_left + _extraBuffer + _currXVelSign,  bbox_bottom + 1) != 0)
				{
					x += _currXVelSign;
				}
				x -= _currXVelSign; 
				break; 
			case -1:
				x = ceil(x); 
				while (tilemap_get_at_pixel(tilemap, bbox_right  - _extraBuffer + _currXVelSign,  bbox_bottom + 1) != 0)
				{
					x += _currXVelSign;
				}
					x -= _currXVelSign; 
				break; 
		}
	}


}
