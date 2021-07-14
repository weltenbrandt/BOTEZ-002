function scr_playerStickToWallsAndMantle() {
	// WALL STICK LOGIC 

	var _halfWayY = bbox_top + ((bbox_bottom - bbox_top)*.5);

	if (velocity[YAXIS] >= 0)
	{
		if (global.inputHorizontalTotal != 0)
		{
			var _xInputSign = sign(global.inputHorizontalTotal); 
			if (_xInputSign == -1)
			{var _bbox = bbox_left;}
			else {var _bbox = bbox_right;}
	
		
			var _topCollision = tilemap_get_at_pixel(tilemap, _bbox + _xInputSign , bbox_top + 1); 
		
		#region CHECK FOR LEDGE BLOCKERS (MANTLING DISABLED) 
				var _canLedgeClimb = true;
				if (position_meeting(_bbox + _xInputSign , bbox_bottom - 1, obj_ledgeBlocker)
				or position_meeting(_bbox + _xInputSign , _halfWayY, obj_ledgeBlocker))
				{_canLedgeClimb = false;}
		#endregion
		
			if 
			(
			(_topCollision != 0)
			or (tilemap_get_at_pixel(tilemap,_bbox + _xInputSign, bbox_bottom - 1) != 0)
			or (tilemap_get_at_pixel(tilemap, _bbox + _xInputSign, _halfWayY) != 0)
			)
			{
				velocity[YAXIS] = 0; 
				velocity[XAXIS] = 0; 
				facing = global.inputHorizontalTotal; 
				scr_wallSlideHugToWall(facing*-1); 
				if (_topCollision == 0 and _canLedgeClimb)
				{
					if abs(velocity[YAXIS]) >= mantleThreshold
					{scr_stateSwitch("Ledge Grab");}
					else{scr_stateSwitch("Mantle");}
				}
				else
				{
					scr_stateSwitch("Wall Slide"); 
				}
			}
		}
	}


}
