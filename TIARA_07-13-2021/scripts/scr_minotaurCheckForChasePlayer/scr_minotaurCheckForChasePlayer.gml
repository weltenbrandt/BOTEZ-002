function scr_minotaurCheckForChasePlayer() {


	var _yStart = scr_returnMaskYMiddle(id); 

	var _p = obj_player; 
	if scr_isValidInstance(_p)
	{
		var _playerYStart = scr_returnMaskYMiddle(_p); 
		if (point_distance(x, _yStart, _p.x, _playerYStart) <= cautionRadius
		and _playerYStart >= y + sightOffsetYTop
		and _playerYStart <= y + sightOffsetYBottom
	
		)
		{
			scr_stateSwitch("Chase Player"); 
		}
	}


}
