function state_projectile_move() {
	if state_new
	{
		state_var[1] = 0; // TIMER
	}

	scr_applyGravity(myGravity); 
	scr_applyXFriction(myFriction); 


}
