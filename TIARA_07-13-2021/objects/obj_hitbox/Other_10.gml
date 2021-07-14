/// @description HITBOX CONNECTION LOGIC 

if active 
{
	
	var _belongToProjectile = scr_isValidInstance(owner) and object_is_ancestor(owner.object_index, par_projectile);
	var _hitBoxConnected = NULLVALUE; 
	var _hitBoxBlocked = false; 
	var _hitBoxKilledPlayer = false;
	
	
	switch myTeam
	{
		case teams.player:	// PLAYER HITBOX (HITS ENEMIES)
			#region PLAYER HITBOX TO HIT ENEMIES 
				var _enemiesTouchingList = ds_list_create(); 
				var _num = instance_place_list(x,y, par_enemy, _enemiesTouchingList, false); 
				for (var i = 0; i < _num; ++i)
				{
					var _enemy = ds_list_find_value(_enemiesTouchingList,i); 
					if (ds_list_find_index(collisionList, _enemy) == -1
					and _enemy.invincibilityTimer <= 0
					and _enemy.invincible == false
					and _enemy.currentHearts > 0
					and !_enemy.dead
					)
					{
						_hitBoxConnected = _enemy;
						ds_list_add(collisionList, _enemy); 
						
						if (radialForce == NULLVALUE)
						{
							_enemy.xHitForce = xForce; 
							if !(_enemy.heavy){_enemy.yHitForce = yForce;}
						}
						else
						{
							var _dirToEnemy = point_direction(x + sprite_width*.5, y + sprite_height*.5, _enemy.x, scr_returnMaskYMiddle(_enemy)); 
							_enemy.xHitForce = lengthdir_x(radialForce,_dirToEnemy); 
							_enemy.yHitForce = lengthdir_y(radialForce,_dirToEnemy); 
						}
						_enemy.invincibilityTimer = _enemy.hitStunInvincibilityTime
						_enemy.currentHearts -= damage; 
						_enemy.flashTimer = _enemy.hitStunFlashTime;
						_enemy.sprite_index = _enemy.hitStunSprite;
						with _enemy 
						{
							if (currentHearts <= 0)
							{
								scr_stateSwitch("Dead"); 
								var _coinDir = 90; 
								if (x < _enemy.x) {_coinDir = point_direction(0,0,xHitForce,yHitForce) + 90;}
								else if (x > _enemy.x){_coinDir = point_direction(0,0,xHitForce,yHitForce) - 90;}
								
								scr_spawnCoins(_enemy.x, scr_returnMaskYMiddle(_enemy) + _enemy.coinSpawnOffset, 5, _enemy.coinValue,_coinDir); 
							}
							else
							{scr_stateSwitch("Hit Stun"); }
							scr_stateUpdate();
						}
					}
				}
				ds_list_destroy(_enemiesTouchingList )
			#endregion
			break; 
		case teams.enemy:	// ENEMY HITBOX (HITS PLAYER)
			#region ENEMY HITBOX TO HIT PLAYER 
			
			
				var _p = obj_player; 
				var _pControl = obj_gameDataController; 
				if place_meeting(x,y, _p)
				{
					
					if (_belongToProjectile
					and _p.blocking and owner.blockable == true)
					{
						if (_p.facing == -1 and x < _p.x)
						{_hitBoxBlocked = true; }
						else if (_p.facing == 1 and x > _p.x)
						{_hitBoxBlocked = true; }
						_p.velocity[XAXIS] = sign(owner.velocity[XAXIS])*radialForce; 
						_hitBoxConnected = _p; 
					}
					
					if !_hitBoxBlocked
					{
						#region SUCCESSFUL HIT LOGIC 
							if (ds_list_find_index(collisionList, _p) == -1
							and _p.invincibilityTimer <= 0
							and _p.invincible == false
							and _pControl.currentHearts > 0
							and !_p.dead
							)
							{
								_hitBoxConnected = _p; 
								if (radialForce == NULLVALUE)
								{
									_p.xHitForce = xForce; 
									if !(_p.heavy){_p.yHitForce = yForce;}
								}
								else
								{
									var _dirToPlayer = point_direction(x + sprite_width*.5, y + sprite_height*.5, _p.x, scr_returnMaskYMiddle(_p)); 
									_p.xHitForce = lengthdir_x(radialForce,_dirToPlayer); 
									_p.yHitForce = lengthdir_y(radialForce,_dirToPlayer); 
								}
								_p.invincibilityTimer = _p.hitStunInvincibilityTime
								_p.flashTimer = _p.hitStunFlashTime;
								_pControl.currentHearts -= damage; 
								with _p 
								{
									image_index = 0; 
									switch facing
									{
										case -1:
											sprite_index = spr_playerHitStunLeft;
											break;
										case 1:
											sprite_index = spr_playerHitStunRight;
											break;
									}
									if (_pControl.currentHearts <= 0)
									{scr_stateSwitch("Dead"); _hitBoxKilledPlayer = true;}
									else
									{scr_stateSwitch("Hit Stun"); }
									scr_stateUpdate();
								}
							}
						#endregion
					}
				}
			#endregion
			break; 
		case teams.agnostic:	// AGNOSTIC HITBOX (HITS ENEMIES AND PLAYER) 
			break; 
	}
	#region SPAWN PARTICLE
		if _hitBoxBlocked or 
		(_hitBoxConnected and !_belongToProjectile)
		{
				var _xSpawn = (x + image_xscale*.5);
				var _ySpawn = (y  + image_yscale*.5);
				var _enemyOriginX = _hitBoxConnected.x; 
				var _enemyOriginY = scr_returnMaskYMiddle(_hitBoxConnected); 
				scr_spawnHitParticle((_xSpawn + _enemyOriginX)*.5,(_ySpawn +_enemyOriginY)*.5);
	
		}
	#endregion
	if (_hitBoxBlocked) // BLOCKED
	{
		with owner {scr_stateSwitch("Blocked"); }
		instance_destroy();
	}
	else if (_hitBoxConnected != NULLVALUE) // CONNECTED
	{
		connected = true; 
		#region AUDIO STUFF
			if (ds_list_size(onHitSoundList) > 0)
			{
				var _hitSoundChoice = ds_list_find_value(onHitSoundList, irandom(ds_list_size(onHitSoundList)-1)); 
				scr_playSoundVariant(onHitSoundPitchVariance,  _hitSoundChoice); 
			}
			
			scr_playActorHitSounds(_hitBoxConnected); 
		
		#endregion
		// SPAWN PARTICLE
		
		global.timeStop = timeStopFrames; 
		if _hitBoxKilledPlayer {global.timeStop = 30;}
		scr_screenShake(xShakeForce,xShakeDecay,yShakeForce,yShakeDecay); 
		
		// UNIQUE PROJECTILE RULES
		if (_belongToProjectile)
		{
			if (owner.breaksOnContact)
			{
				with owner{instance_destroy();}
			}
			instance_destroy(); 
		}
	}
}
