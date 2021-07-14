/// @Description  NUDGES OBJECT VERTICALLY AVOIDING WALLS 
/// @param NUDGE AMOUNT
function scr_nudgeVertical() {

	var _oldXVel = velocity[XAXIS]; 
	var _oldYVel = velocity[YAXIS]; 

	velocity[YAXIS] = argument[0]; 

	scr_updateActorLocation(); 

	velocity[XAXIS] = _oldXVel; 
	velocity[YAXIS] = _oldYVel; 


}
