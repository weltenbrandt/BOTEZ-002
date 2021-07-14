/// @description returns the direction to the player.
function scr_returnDirectionToPlayer() {


	var _myY = scr_returnMaskYMiddle(id);

	var _p = obj_player;
	if scr_isValidInstance(_p)
	{
		var _pY = scr_returnMaskYMiddle(_p);
	
		var _dir = point_direction(x,_myY, _p.x, _pY);
		return _dir; 
	}

	return NULLVALUE; 


}
