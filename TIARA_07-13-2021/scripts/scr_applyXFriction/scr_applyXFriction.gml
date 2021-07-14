/// @description applies X Friction
/// @param friction
function scr_applyXFriction() {

	var _fric = argument[0];  

	if (velocity[XAXIS] != 0)
	{
		var _oldVelocitySign = sign(velocity[XAXIS]); 

		velocity[XAXIS] -= _oldVelocitySign*_fric; 
		if (sign(velocity[XAXIS]) != _oldVelocitySign)
		{
			velocity[XAXIS] = 0; 
		}
	}


}
