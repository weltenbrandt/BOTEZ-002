/// @description applies X Friction
/// @param friction
function scr_applyXYOverMaxFriction() {

	var _fric = argument[0];  
	var _targetSpeed = argument[1]; 

	if (point_distance(0,0, velocity[XAXIS], velocity[YAXIS] > 0))
	{
		var _dir = point_direction(0,0, velocity[XAXIS], velocity[YAXIS]); 
		var _dist = point_distance(0,0, velocity[XAXIS], velocity[YAXIS]); 
		_dist -= _fric; 
		if (_dist <= _targetSpeed)
		{
			velocity[XAXIS] = lengthdir_x(_targetSpeed, _dir); 
			velocity[YAXIS] = lengthdir_y(_targetSpeed, _dir); 
		}
		else
		{
			velocity[XAXIS] = lengthdir_x(_dist, _dir); 
			velocity[YAXIS] = lengthdir_y(_dist, _dir); 
		}
	}



}
