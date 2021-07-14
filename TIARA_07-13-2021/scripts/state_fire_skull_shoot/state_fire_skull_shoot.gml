function state_fire_skull_shoot() {
	if state_new
	{
		sprite_index = alarmSprite; 
		image_index = 0;
	
		state_var[0] = 0; // STATE STAGE
		state_var[1] = 0; // TIMER
		scr_playSoundVariant(.1, snd_placeholderPop); // SEES PLAYER SOUND
	}

	scr_enemyFacePlayer(); 
	scr_applyXYFriction(shootFriction);

	switch state_var[0]
	{
		case 0:
			image_speed = shootChargeUpImageSpeed; 
			state_var[1] += 1;
			if ((state_var[1]) >= shootChargeUpTime)
			{
				++state_var[0]; 
				state_var[1] = 0; 
			
			}
			break; 
		case 1:
			sprite_index = attackSprite; 
			image_speed = shootingImageSpeed; 
			if (scr_checkForPlayerInCautionRadius())
			{
				image_speed = shootingImageSpeed; 
				if (state_var[1] mod shootDelayTime == 0)
				{
					var _dir = scr_returnDirectionToPlayer()
					if _dir != NULLVALUE
					{
						scr_playSoundVariant(.1, snd_placeholderPop); // SHOT FIRED SOUND
						scr_spawnProjectile(x,y, _dir,random_range(projectileSpeedMin,projectileSpeedMax), obj_fireSkullProjectile)
					}
				}
				++state_var[1]; 
			}
			else
			{
				scr_stateSwitch("Idle"); 
			}
			break; 
	}


}
