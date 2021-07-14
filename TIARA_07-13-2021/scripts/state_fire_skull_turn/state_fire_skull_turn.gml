function state_fire_skull_turn() {
	if state_new
	{
		image_speed = patrolImageSpeed
		sprite_index = patrolSprite; 
	}

	scr_enemyFaceMovementDirection(); 

	scr_applyXYMovement(patrolDir,patrolAccel, patrolMaxSpeed, patrolFriction);


}
