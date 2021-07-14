/// @description returns the direction to the player.
function scr_returnDistanceToPlayer() {


	var _myY = scr_returnMaskYMiddle(id);

	var _p = obj_player;
	if scr_isValidInstance(_p)
	{
		var _pY = scr_returnMaskYMiddle(_p);
	
		var _dist = point_distance(x,_myY, _p.x, _pY);
		return _dist; 
	}

	return NULLVALUE; 


}
