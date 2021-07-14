x += hspd;
y += vspd;

// Speed for each axis
hspd = lengthdir_x(spd, dir);

// Destroy the projectile when hitting a wall
if (tile_meeting(x + hspd, y + vspd, "Collisions"))
{
	audio_stop_sound(snd_placeholderPop);
	instance_destroy();
	audio_stop_sound(snd_placeholderPop);
}

// Checks if the projectile is going to collide against the player
if (place_meeting(x + hspd, y, obj_player) or place_meeting(x, y + vspd, obj_player))
{
	// Checks if  the player is blocking the attack
	if (obj_player.state == "Guard" and reflec_cooldown <= 0 and sign(hspd) != obj_player.facing)
	{
		// Sets a cooldown
		reflec_cooldown = 30;
		
		with (obj_player)
		{
			// Sets some variables to calculate targetory
			var _x = sign( (x + sprite_width * facing) - other.x);
			var _y = ((y - sprite_height / 4.7) - other.y) * -1;
		}
		
		// If the vertical speed is relative to the player,  calculate it, otherwhise just revert the previous vertical speed
		if (!lineal_y)
		{
			vspd = clamp(_y / 10, -4, 4);
		}
		else
		{
			vspd  *= -1;
		}
		
		// Points to the opposite direction
		dir =  point_direction(x, y, x + _x, y);
		
	}
	else
	{
		
		// Damges the player if the projectile wasn't reflected
		if (reflec_cooldown <= 0 and obj_player.state != "Dead")
		{
			// Shakes the screen and damages the player
			scr_screenShake(2, 0.1, 2, 0.1);
			scr_dealDamageToPlayer(damage);
			
			// Plays the player hit sound
			var snd = snd_playerGetHitA;
			audio_sound_pitch(snd, random_range(0.9, 1));
			
			if (!audio_is_playing(snd))
			{
				scr_playSoundVariant(0.1, snd); 
			}
			
			// Destroys this instance
			instance_destroy();
		}
	}
}


reflec_cooldown--;

facing = sign(hspd);