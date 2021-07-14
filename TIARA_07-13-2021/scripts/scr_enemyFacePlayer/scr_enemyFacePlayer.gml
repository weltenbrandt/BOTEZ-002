function scr_enemyFacePlayer() {
	var _p = obj_player; 

	if scr_isValidInstance(_p) 
	{
		if (_p.x < x ){scr_enemySetFacing(-1); }
		else if (_p.x > x ){scr_enemySetFacing(1); }
	}


}
