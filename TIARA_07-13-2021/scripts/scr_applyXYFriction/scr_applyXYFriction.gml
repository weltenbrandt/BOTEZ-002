/// @description applies X Friction
/// @param friction
function scr_applyXYFriction() {

	var _fric = argument[0];  

	if (point_distance(0,0, velocity[XAXIS], velocity[YAXIS]) > 0)
	{
		var _dir = point_direction(0,0, velocity[XAXIS], velocity[YAXIS]); 
		var _dist = point_distance(0,0, velocity[XAXIS], velocity[YAXIS]); 
		_dist -= _fric;
		if (_dist <= 0)
		{
			velocity[XAXIS] = 0; 
			velocity[YAXIS] = 0; 
		}
		else
		{
			velocity[XAXIS] = lengthdir_x(_dist, _dir); 
			velocity[YAXIS] = lengthdir_y(_dist, _dir); 
		}
	}


}
