/// @description applies gravity to this object
/// @param gravity 
function scr_applyGravity() {

	if !(onGround)
	{velocity[YAXIS] += argument[0];}
	if (velocity[YAXIS] >= MAX_FALL_SPEED)
	{
		velocity[YAXIS] = MAX_FALL_SPEED; 
	}

}
