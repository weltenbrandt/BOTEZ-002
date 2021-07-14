function scr_playerActivateTraps() {
	if (state != "Dead"
	and state_next != "Dead")
	{
		if (place_meeting(x,y, par_spikes))
		{
			var _spikesConnected = false; 
			// DETERMINE SPIKES PROPERTIES
			var _spikesTouchingList = ds_list_create(); 
			var _num = instance_place_list(x,y, par_spikes,_spikesTouchingList,false); 
	
			for (var i = 0; i < _num; ++i)
			{
				var _spikesTouching = ds_list_find_value(_spikesTouchingList, i); 
				var _spikesObjectIndex  = _spikesTouching.object_index; 
		
				switch _spikesObjectIndex
				{
					case obj_floorSpikes:
						//if (velocity[YAXIS] > 0 or invincibilityTimer <= 0) COMMENT THIS BACK IN IF SPIKES DON'T AUTO KILL
						{
							_spikesConnected = true; 
							if onGround
							{
								hitStunPushDir = sign(velocity[XAXIS])*-1; 
							}
							else
							{
								hitStunPushDir = sign(velocity[XAXIS]); 
							}
							scr_playerMoveOffSpikes(_spikesTouching); 
							// RESET VELOCITY VARIABLES
							velocity[XAXIS] = 0; 
							velocity[YAXIS] = 0; 
							//if (invincibilityTimer <= 0) COMMENT THIS BACK IN IF SPIKES DON'T AUTO KILL
							{
								// APPLY DAMAGE
								scr_dealDamageToPlayer(_spikesTouching.damage);
							}
							if (state_next != "Hit Stun" and state_next != "Dead")
							{scr_stateSwitch("Hit Stun");}
						}
						break; 
					case obj_wallSpikesLeft:
						//if (invincibilityTimer <= 0 or velocity[YAXIS] > 0 ) COMMENT THIS BACK IN IF SPIKES DON'T AUTO KILL
						{
							_spikesConnected = true; 
							hitStunPushDir = 1;
					
							// RESET VELOCITY VARIABLES
							velocity[XAXIS] = 0; 
							velocity[YAXIS] = 0; 
							//if (invincibilityTimer <= 0) COMMENT THIS BACK IN IF SPIKES DON'T AUTO KILL
							{
								// APPLY DAMAGE
								scr_dealDamageToPlayer(_spikesTouching.damage);
							}
							if (state_next != "Hit Stun" and state_next != "Dead")
							{scr_stateSwitch("Hit Stun");}
						}
						break; 
					case obj_wallSpikesRight:
						//if (invincibilityTimer <= 0 or velocity[YAXIS] > 0 ) COMMENT THIS BACK IN IF SPIKES DON'T AUTO KILL
						{
							_spikesConnected = true; 
							hitStunPushDir = -1;
					
							// RESET VELOCITY VARIABLES
							velocity[XAXIS] = 0; 
							velocity[YAXIS] = 0; 
							//if (invincibilityTimer <= 0) COMMENT THIS BACK IN IF SPIKES DON'T AUTO KILL
							{
								// APPLY DAMAGE
								scr_dealDamageToPlayer(_spikesTouching.damage);
							}
							if (state_next != "Hit Stun" and state_next != "Dead")
							{scr_stateSwitch("Hit Stun");}
						}
						break; 
				}
		
			}
	
			if _spikesConnected
			{
				velocity[XAXIS] = 0; 
				velocity[YAXIS] = 0; 
				scr_playActorHitSounds(id); 
		
				// SPAWN PARTICLE
				var _xSpawn = x;
				var _ySpawn = y;
				var _enemyOriginX = obj_player.x
				var _enemyOriginY = scr_returnMaskYMiddle(obj_player); 
		
				scr_spawnHitParticle((_xSpawn + _enemyOriginX)*.5,(_ySpawn +_enemyOriginY)*.5);
				global.timeStop = 2; 
				if (obj_gameDataController.currentHearts <= 0) {global.timeStop = 30;}
				flashTimer = 2; 
				if (facing == 1)
				{sprite_index = spr_playerHitStunRight;}
				else {sprite_index = spr_playerHitStunLeft;}
										// APPLY SCREENSHAKE
				scr_screenShake(
				_spikesTouching.onHitScreenShakeXForce, 
				_spikesTouching.onHitScreenShakeXDecay, 
				_spikesTouching.onHitScreenShakeYForce, 
				_spikesTouching.onHitScreenShakeYDecay); 
			}
		}
	}


}
