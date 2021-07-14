function scr_groundEnemyPreventWalkingOffLedges() {

	var _currXVelocity = velocity[XAXIS]; 
	var _XVelSign = sign(velocity[XAXIS]); 
	var _currXVelSign = sign(_currXVelocity); 

	//var _halfWayX = bbox_left+ ((bbox_right - bbox_left)*.5) + _currXVelocity;

	if (
	(_XVelSign == -1 and tilemap_get_at_pixel(tilemap, bbox_left + _currXVelocity,  bbox_bottom + 1) == 0)
	or (_XVelSign == 1 and  (tilemap_get_at_pixel(tilemap, bbox_right - 1 + _currXVelocity, bbox_bottom + 1) == 0))
	or (_XVelSign == -1 and place_meeting(bbox_left + _currXVelocity,  bbox_bottom, obj_enemyBounder))
	or (_XVelSign == 1 and place_meeting(bbox_right + _currXVelocity,  bbox_bottom, obj_enemyBounder))
	)
	{
		velocity[XAXIS] = 0; 
		switch _currXVelSign
		{
			case 1:
				return true;
				break; 
			case -1:
				return true;
				break; 
		}
	}

	return false;


}
