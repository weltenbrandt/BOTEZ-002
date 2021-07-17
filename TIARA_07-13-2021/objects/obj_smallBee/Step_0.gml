
// State machine
switch(state)
{
	case(beestates.follow):
		#region Follows a target
		
		// Gets hit by the player
		if (place_meeting(x, y, obj_hitbox))
		{
			if (obj_hitbox.myTeam == teams.player)
			{
				state = beestates.hit;
				
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				knock_x = lengthdir_x(knockout, _dir);
				knock_y = lengthdir_y(knockout, _dir);
				
				show_debug_message(knock_x);
				show_debug_message(knock_y);
				
			}
		}
		
		if (distance_to_object(target) < detection_radius)
		{
			var _tarDir = point_direction(x, y, target.x, target.y);
			
			// Moves towards the player
			hspd = lengthdir_x(spd, _tarDir);
			vspd = lengthdir_y(spd, _tarDir);

			hspd = floor(hspd);
			vspd = floor(vspd);
	
			// If the player is close, explode
			if (distance_to_object(target) < explosion_radius / 4)
			{
				hspd = 0;
				vspd = 0;
				state = beestates.explode;
			}
		}
		
		#endregion
		break;
	case(beestates.hit):
	
		hspd = 0;
		vspd = 0;
	
		knock_x = lerp(knock_x, 0, 0.05);
		knock_y = lerp(knock_y, 0, 0.05);
		
		show_debug_message(knock_y);
		show_debug_message(knock_x);
		
		if (knock_x == 0 and knock_y == 0)
		{
			state = beestates.follow;
		}
		
		x -= knock_x;
		y -= knock_y;
		
		break;
	
}

#region Follows a target
if (distance_to_object(target) < detection_radius and state == beestates.follow)
{
	var _tarDir = point_direction(x, y, target.x, target.y);
	
	// Moves towards the player
	hspd = lengthdir_x(spd, _tarDir);
	vspd = lengthdir_y(spd, _tarDir);

	hspd = floor(hspd);
	vspd = floor(vspd);
	
	// If the player is close, explode
	if (distance_to_object(target) < explosion_radius / 4)
	{
		hspd = 0;
		vspd = 0;
		state = beestates.explode;
	}
}
#endregion

#region Explodes and damages player

// Damges the player if the projectile wasn't reflected
if (state == beestates.explode)
{
	if (tick >= explosion_charge_time)
	{
		if (sprite_index != spr_smallBeeExplode)
		{
			image_index = 0;
			sprite_index = spr_smallBeeExplode;
		}
	
		// Shakes the screen and damages the player
		scr_screenShake(2, 0.1, 2, 0.1);
	
		if (distance_to_object(target) < explosion_radius and !exploded)
		{
			exploded = true;
			
			var _p = obj_player;
			
			// Pushes the player back
			var _dirToPlayer = point_direction(x, y, _p.x, scr_returnMaskYMiddle(_p)); 
			_p.xHitForce = lengthdir_x(4,_dirToPlayer); 
			_p.yHitForce = lengthdir_y(4,_dirToPlayer); 
			
			scr_dealDamageToPlayer(explosion_damage);
			
			// Plays the player hit sound
			var snd = snd_playerGetHitA;
			audio_sound_pitch(snd, random_range(0.9, 1));
			
			
			if (!audio_is_playing(snd))
			{
				scr_playSoundVariant(0.1, snd); 
			}
		}
	}
	else
	{
		tick++;
	}
}

#endregion

#region collisions
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
	while !(tile_meeting(x, y + sign(vspd), "Collisions"))
	{
		y += sign(vspd);
	}
	vspd = 0;
}
#endregion

x += hspd;
y += vspd;