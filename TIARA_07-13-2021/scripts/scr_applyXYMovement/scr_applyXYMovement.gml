/// @description apply xy movement (mostfly for flying enemies 
/// @param dir,accel,maxSpeed,fric,...overMaxFriction
function scr_applyXYMovement() {

	var _dir = argument[0]; 
	var _accel = argument[1]; 
	var _maxSpeed = argument[2]; 
	var _fric = argument[3];
	var _overMaxFriction =  NULLVALUE; 

	if (argument_count > 4)
	{_overMaxFriction = argument[4];}

	if _dir != NULLVALUE
	{
	
		if (point_distance(0,0, velocity[XAXIS] + lengthdir_x(_accel,_dir), velocity[YAXIS] + lengthdir_y(_accel,_dir)) <= _maxSpeed)
		{
			velocity[XAXIS] += lengthdir_x(_accel,_dir);
			velocity[YAXIS] += lengthdir_y(_accel,_dir);
		
		}
	
	
		if (point_distance(0,0, velocity[XAXIS], velocity[YAXIS]) > _maxSpeed)
		{
			if (_overMaxFriction == NULLVALUE)
			{
				velocity[XAXIS] = lengthdir_x(_maxSpeed,_dir);
				velocity[YAXIS] = lengthdir_y(_maxSpeed,_dir);
			}
			else
			{
				scr_applyXYOverMaxFriction(_overMaxFriction, _maxSpeed); 
			}
		}
	
	}
	else
	{
		scr_applyXYFriction(_fric); 
	}


}
