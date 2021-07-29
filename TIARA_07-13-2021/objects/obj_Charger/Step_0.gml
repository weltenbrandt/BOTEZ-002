// State machine
switch(state)
{
	case(Charger.idle):
		#region Checks if the target is near
		sprite_index = idleSprite;
		
		attack_tick++;
		
		if (object_exists(target))
		{
			// Faces to player
			var face = lengthdir_x(1, point_direction(x, y, target.x, target.y));
			if (face != 0) image_xscale = sign(face);
			
			// If the player is near, prepare to charge
			if (distance_to_object(target) < detection_radius and attack_tick >= charge_cooldown)
			{
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
		
		
		//if (attack_cooldown <= 0)
		//{
		//	hp--;
		//	attack_cooldown = 60;
		//}
		
		//hspd = 0;
		//vspd = 0;
	
		//knock_x = lerp(knock_x, 0, 0.05);
		//knock_y = lerp(knock_y, 0, 0.05);
		
		#endregion
		break;
	case(Charger.charge):
		#region Charges towards the player and attacks
		
		if (face_to_target_while_charging)
		{
			// Faces to player
			var face = lengthdir_x(1, point_direction(x, y, target.x, target.y));
			if (face != 0) image_xscale = sign(face);
		}

		sprite_index = chargeSprite;
		image_speed = 1;
		
		
		hspd = image_xscale * charge_speed;
		
		// Manages the charge timer
		charge_tick++;
		
		if (charge_tick >= charge_duration and charge_duration != -1)
		{
			charge_tick = 0;
			state = Charger.attacked;
		}
		
		if (tile_meeting(x + hspd, y, "Collisions"))
		{
			state = Charger.attacked;
		}
		
		// Attacks the player
		if (place_meeting(x + (20 * image_xscale), y, target))
		{
	
			if (!attacked)
			{
				// Shakes the screen and damages the player
				scr_screenShake(2, 0.1, 2, 0.1);
				
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
		hspd = 0;
		sprite_index = attackSprite;
		attack_tick = 0;
		
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
		show_debug_message(y);
		y += sign(vspd)
	}
	vspd = 0;
}
#endregion

x += hspd;
y += vspd;

attack_cooldown--;

//// Gets hit by the player
		//if (place_meeting(x, y, obj_hitbox))
		//{
		//	if (obj_hitbox.myTeam == teams.player)
		//	{
		//		state = beestates.hit;
				
		//		var _dir = point_direction(x, y, obj_player.x, obj_player.y);
		//		knock_x = lengthdir_x(x_knockout, _dir);
		//		knock_y = lengthdir_y(y_knockout, _dir);
				
		//		show_debug_message(knock_x);
		//		show_debug_message(knock_y);
				
		//	}
		//}