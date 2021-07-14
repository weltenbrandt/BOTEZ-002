function scr_checkForPlayerInCautionRadius() {

	var _p = obj_player; 
	if (scr_isValidInstance(_p))
	{
		var _pY = scr_returnMaskYMiddle(_p); 
		var _dist = point_distance(x,y, _p.x,_pY); 
		if (_dist <= cautionRadius)
		{
			return true; 
		}
	}

	return false; 


}
