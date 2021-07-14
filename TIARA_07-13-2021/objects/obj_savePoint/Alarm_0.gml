if (simpleState == savePointStates.active)
{
	var _p = obj_player; 
	if (scr_isValidInstance(_p))
	{
		_p.x  = x; 
		_p.y = y; 
		with obj_cameraAid {x = _p.x; y = _p.y; }
		obj_cameraController.alarm[0] = 1; 
	}
}