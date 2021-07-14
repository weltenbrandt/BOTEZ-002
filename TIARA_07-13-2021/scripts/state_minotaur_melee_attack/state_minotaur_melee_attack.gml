function state_minotaur_melee_attack() {
	if state_new
	{
		scr_playSoundVocalize(id,.1, snd_minotaurAttack); 
		sprite_index = chargeMeleeAttackSprite; 
		image_index = 0; 
	
		state_var[1] = 0; // TIMER
		state_var[2] = irandom_range(meleeAttackDelayMin,meleeAttackDelayMax); 
		state_var[3] = false; // MISSED SCREENSHAKE TRIGGERED
	}

	scr_applyXFriction(walkFriction); 
	if !onGround {scr_applyGravity(fallGravity);}

	switch sprite_index 
	{
		case chargeMeleeAttackSprite:
			image_speed = meleeAttackChargeSpeed;
			if (image_index + image_speed >= image_number)
			{
				sprite_index = meleeAttackSprite; 
				scr_spawnHitbox(id,meleeAttackDamage, false,95, -55, 92,115,NULLVALUE,meleeAttackXForce,meleeAttackYForce,0,15,meleeAttackTimeStopFrames,meleeAttackXShakeForce,meleeAttackYShakeForce,meleeAttackXShakeDecay,meleeAttackYShakeDecay, .1, NULLVALUE); 
				scr_screenShake(meleeAttackMissXShakeForce,meleeAttackMissXShakeDecay,meleeAttackMissYShakeForce,meleeAttackMissYShakeDecay); 
			}
			break; 
		case meleeAttackSprite:
			if (state_var[3] == false)
			{
				state_var[3] = true; 
			
			}
			image_speed = meleeAttackSwingSpeed;
			if (image_index + image_speed >= image_number)
			{
				sprite_index = idleSprite; 
				image_index = 0; 
				scr_clearHitboxesForOwner(id, false);
				if !(onGround){scr_stateSwitch("Fall");}
			}
			break; 
		case idleSprite:
			image_speed = idleImageSpeed; 
			++state_var[1];
			if (state_var[1] >= state_var[2])
			{
				scr_clearHitboxesForOwner(id, false);
				if !(onGround){scr_stateSwitch("Fall");}
				else{scr_stateSwitch("Idle"); }
			}
			break; 
	}


}
