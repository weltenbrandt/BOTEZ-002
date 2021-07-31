// State machine

switch(state)
{
	case(Charger.idle):
		#region Checks if the target is near
		sprite_index = idleSprite;
		image_speed = 1;
		
		hspd = 0;
		charge_tick = 0;
		
		attacked = false;
		attack_tick++;
		
		if (object_exists(target))
		{
			// Faces to player
			var face = lengthdir_x(1, point_direction(x, y, target.x, target.y));
			if (face != 0) image_xscale = sign(face);
			
			// If the player is near, prepare to charge
			if (distance_to_object(target) < detection_radius and attack_tick >= charge_cooldown)
			{
				audio_sound_pitch(charge_sound, random_range(0.9, 1.1));
				audio_play_sound(charge_sound, 1, false);
				
				image_index = 0;
				state = Charger.prepare;
			}
			
			attack_tick++;
		}
		
		#endregion
		break;
	case(Charger.prepare):
		#region Prepares to charge towards player
		sprite_index = prepareSprite;
		
		// Faces to player
		var face = lengthdir_x(1, point_direction(x, y, target.x, target.y));
		if (face != 0) image_xscale = sign(face);
		
		if (prepare_tick >= prepare_time)
		{
			prepare_tick = 0;
			image_index = 0;
			state = Charger.charge;
		}
		else
		{
			prepare_tick++;
		}
		
		
		#endregion
		break;
	case(Charger.charge):
		#region Charges towards the player and attacks
		
		
		if (step_tick >= step_cooldown)
		{
			step_tick = 0;
			
			audio_sound_pitch(step_sound, random_range(0.9, 1.1));
			audio_play_sound(step_sound, 1, false);
		}
		else
		{
			step_tick++;
		}
		
		if (trail_tick >= spawn_trail_cooldown)
		{
			trail_tick = 0;
			var _trail = instance_create_depth(x, y, depth, obj_charger_trail);
			
			with (_trail)
			{
				start_opacity = other.starting_opacity;
				color = other.trail_color;
				fade_speed = other.trail_fade_speed;
				
				sprite_index = other.sprite_index;
				image_index = other.image_index;
				image_xscale = other.image_xscale;
			}
		}
		else
		{
			trail_tick++;
		}
		
		if (face_to_target_while_charging)
		{
			// Faces to player
			var face = lengthdir_x(1, point_direction(x, y, target.x, target.y));
			if (face != 0) image_xscale = sign(face);
		}

		sprite_index = chargeSprite;
		image_speed = 1;
		
		
		hspd = image_xscale * actual_speed;
		
		
		// Manages the charge timer
		charge_tick++;
		
		if (charge_tick >= charge_duration and charge_duration != -1)
		{
			actual_speed = lerp(actual_speed, 0, charge_friction);
			
			if (abs(actual_speed) <= 0.5)
			{
				charge_tick = 0;
				image_index = 0;
				state = Charger.attacked;
			}
		}
		else
		{
			if (build_up_speed)
			{
				actual_speed = lerp(actual_speed, charge_speed, build_up_rate);
			}
			else
			{
				actual_speed = charge_speed;
			}
		}
		
		if (tile_meeting(x + hspd, y, "Collisions"))
		{
			scr_screenShake(hitwall_shake, 0.1, hitwall_shake, 0.1);
			
			audio_sound_pitch(hit_wall_sound, random_range(0.9, 1.1));
			audio_play_sound(hit_wall_sound, 1, false);
			
			attack_tick = 0;
			image_index = 0;
			state = Charger.attacked;
		}
		
		// Attacks the player
		if (place_meeting(x + (20 * image_xscale), y, target))
		{
			
			if (target.facing == -image_xscale and target.state == "Guard")
			{
				image_index = 0;
				
				audio_sound_pitch(parried_sound, random_range(0.9, 1.1));
				audio_play_sound(parried_sound, 1, false);
				
				scr_screenShake(4, 0.1, 4, 0.1);
				state = Charger.parried;
			}
			else if (!attacked)
			{
				// Shakes the screen and damages the player
				scr_screenShake(4, 0.1, 4, 0.1);
				
				attacked = true;
				
				var snd_explo = hit_sound;
			
				if (!audio_is_playing(snd_explo))
				{
					scr_playSoundVariant(0.1, snd_explo); 
				}
				

				var _p = obj_player;
			
				// Pushes the player back
				var _dirToPlayer = point_direction(x, y, _p.x, scr_returnMaskYMiddle(_p)); 
				_p.xHitForce = lengthdir_x(4,_dirToPlayer); 
				_p.yHitForce = lengthdir_y(4,_dirToPlayer); 
					
				scr_dealDamageToPlayer(charge_damage);
			
				// Plays the player hit sound
				var snd_hit = snd_playerGetHitA;
				
				if (!audio_is_playing(snd_hit))
				{
					scr_playSoundVariant(0.1, snd_hit); 
				}
					
					
				image_index = 0;
				state = Charger.attacked;
			}
		}
		
		#endregion
		break;
	case(Charger.attacked):
		#region Attacked player
	
		hspd = 0;
		sprite_index = attackSprite;
		attack_tick = 0;
		
		#endregion
		break;
	case(Charger.parried):
		#region Handles getting parried
		
		hspd = 0;
		
		if (sprite_index != parriedSprite)
		{
			image_index = 0;
			sprite_index = parriedSprite;
		}
		
		#endregion
		break;
	case(Charger.stunned):
		#region Got stunned and is vulnerable
		sprite_index = stunnedSprite;
	
		// Gets hit by the player
		if (place_meeting(x, y, obj_hitbox))
		{
			if (obj_hitbox.myTeam == teams.player)
			{
				parry_tick = 0;
				flash_alpha = 1;
				
				scr_screenShake(4, 0.1, 4, 0.1);
				
				image_index = 0;
				
				if (hp > 1)
				{
					audio_sound_pitch(sword_hit_sound, random_range(0.9, 1.1));
					audio_play_sound(sword_hit_sound, 1, false);
					
					state = Charger.hit;
				}
				else
				{
					x_knockback += 2;
					
					var _coinDir = 90; 
	
					scr_spawnCoins(x,  y - 30, 5, amount_of_coins_to_spawn,_coinDir); 

					state = Charger.die;
				}
				
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				knock_x = lengthdir_x(x_knockback, _dir);
			}
		}
	
		// Recovers after a stun
		parry_tick++;
		
		if (parry_tick >= parry_cooldown)
		{
			parry_tick = 0;
			image_index = 0;
			state = Charger.recovered;
		}
		
		#endregion
		break;
	case(Charger.recovered):
		#region Responsible for recovering from an attack
		
		sprite_index = recoveredSprite;
		
		#endregion
		break;
	case(Charger.hit):
		#region Got hit by the player
		
		if (sprite_index != damagedSprite)
		{
			sprite_index = damagedSprite;
		}
		
		knock_x = lerp(knock_x, 0, 0.1);
		
		vspd = 0;
		hspd = -knock_x;
		
		if (attack_cooldown <= 0)
		{
			audio_sound_pitch(hurt_sound, random_range(0.9, 1.1));
			audio_play_sound(hurt_sound, 1, false);
			
			hp--;
			attack_cooldown = 300;
		}
		
		if (abs(knock_x) <= 0.1)
		{
			attack_tick = 0;
			state = Charger.idle;
		}
		
		#endregion 
		break;
	case(Charger.die):
		#region Got hit by the player

		if (sprite_index != deathSprite)
		{
			sprite_index = deathSprite;
		}
		
		knock_x = lerp(knock_x, 0, 0.1);
		
		hspd = -knock_x;
		
		if (attack_cooldown <= 0)
		{
			attack_cooldown = 300;
			
			audio_sound_pitch(hurt_sound, random_range(0.9, 1.1));
			audio_play_sound(hurt_sound, 1, false);
		}
		
		if (abs(knock_x) <= 0)
		{
			hspd = 0;			
			state = Charger.dead;
		}
		
		#endregion 
		
		break;
		
	case(Charger.dead):
		sprite_index = deathSprite;
		break;
}

#region collisions

grounded = tile_meeting(x, y + 1, "Collisions");

if (!grounded)
{
	vspd += grv;
}

if (tile_meeting(x + hspd, y, "Collisions"))
{
	while !(tile_meeting(x + sign(hspd), y, "Collisions"))
	{
		x += sign(hspd);
	}
	hspd = 0;
}

if (tile_meeting(x, y + vspd, "Collisions"))
{
	y = floor(y);
	while !(tile_meeting(x, y + sign(vspd), "Collisions"))
	{
		y += sign(vspd)
	}
	vspd = 0;
}
#endregion

x += hspd;
y += vspd;

attack_cooldown--;

