function state_fire_skull_patrol() {
	if state_new
	{
		image_speed = patrolImageSpeed
		sprite_index = patrolSprite; 
	}

	scr_enemyFaceMovementDirection(); 

	scr_applyXYMovement(patrolDir,patrolAccel, patrolMaxSpeed, patrolFriction);

	// PATROL BEHAVIOR
	var _enemyBounder = instance_place(x,y, obj_enemyBounder)
	if (scr_isValidInstance(_enemyBounder) and lastBounderTouched != _enemyBounder)
	{ 
		lastBounderTouched = _enemyBounder; 
		patrolDir = (patrolDir + 180) mod 360; 
	}

	if (scr_checkForPlayerInAlarmRadius())
	{
		scr_stateSwitch("Shoot"); 
	}


}
