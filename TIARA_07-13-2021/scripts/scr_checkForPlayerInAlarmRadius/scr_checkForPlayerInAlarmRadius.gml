function scr_checkForPlayerInAlarmRadius() {

	var _p = obj_player; 
	if (scr_isValidInstance(_p))
	{
		var _pY = scr_returnMaskYMiddle(_p); 
		var _dist = point_distance(x,y, _p.x,_pY); 
		if (_dist <= alarmRadius)
		{
			return true; 
		}
	}

	return false; 


}
