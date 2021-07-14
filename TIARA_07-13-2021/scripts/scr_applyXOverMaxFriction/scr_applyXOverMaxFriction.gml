/// @description applies X Friction
/// @param friction,targetSpeed
function scr_applyXOverMaxFriction() {

	var _fric = argument[0];  
	var _targetSpeed = argument[1]; 

	var _velSign = sign(velocity[XAXIS]); 

	if (abs(velocity[XAXIS]) > _targetSpeed)
	{
		velocity[XAXIS] -= _fric*_velSign; 
	}
	else {velocity[XAXIS] = _velSign*_targetSpeed;}



}
