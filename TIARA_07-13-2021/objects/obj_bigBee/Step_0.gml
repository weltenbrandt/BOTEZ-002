// Faces the player
var face = round(lengthdir_x(1, point_direction(x, y, obj_player.x, obj_player.y)) * -1);
if (face != 0) image_xscale = face;

// State machine
switch(state)
{
	case(beestates.follow):
		#region Follows a target
		
		sprite_index = spr_Bee;
		
		// Gets hit by the player
		if (place_meeting(x, y, obj_hitbox) and attack_cooldown <= 0)
		{
			if (obj_hitbox.myTeam == teams.player)
			{
				if (!audio_is_playing(hurt_sound))
				{
					scr_playSoundVariant(0.1, hurt_sound); 
				}
				
				state = beestates.hit;
				
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				knock_x = lengthdir_x(x_knockout, _dir);
				knock_y = lengthdir_y(y_knockout, _dir);
				
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
	
			
		}
		
		// If the player is close, explode
		if (distance_to_object(target) < 5 or hp <= 0)
		{
			hspd = 0;
			vspd = 0;
			state = beestates.explode;
		}
		
		
		#endregion
		break;
	case(beestates.hit):
		#region Gets hit by the player
		sprite_index = spr_BeeHurt;
		if (attack_cooldown <= 0)
		{
			hp--;
			attack_cooldown = 60;
		}
		
		hspd = 0;
		vspd = 0;
	
		knock_x = lerp(knock_x, 0, 0.05);
		knock_y = lerp(knock_y, 0, 0.05);
		

		if (abs(knock_y + knock_x) <= 0.20)
		{
			if (hp <= 0)
			{
				state = beestates.explode;
			}
			else
			{
				state = beestates.follow;
			}
		}
		
		x -= knock_x;
		y -= knock_y;
		#endregion
		break;
	case(beestates.explode):
		#region Explodes and damages player

		// Gets hit by the player
		if (place_meeting(x, y, obj_hitbox))
		{
			if (obj_hitbox.myTeam == teams.player)
			{
				state = beestates.hit;
				
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				knock_x = lengthdir_x(x_knockout, _dir);
				knock_y = lengthdir_y(y_knockout, _dir);
				
				show_debug_message(knock_x);
				show_debug_message(knock_y);
				
			}
		}

		// Explodes
		if (tick >= explosion_charge_time or hp <= 0)
		{

			if (sprite_index != deathSprite)
			{
				image_index = 0;
				sprite_index = deathSprite;
			}
	
			// Shakes the screen and damages the player
			scr_screenShake(2, 0.1, 2, 0.1);
	
			if ( !exploded)
			{
				exploded = true;
				
				instance_create_depth(x, y, depth + 1, background_explosion);
				
				var snd_explo = explosion_sound;
			
				if (!audio_is_playing(snd_explo))
				{
					scr_playSoundVariant(0.1, snd_explo); 
				}
				
				if (distance_to_object(target) < explosion_radius)
				{
					var _p = obj_player;
			
					// Pushes the player back
					var _dirToPlayer = point_direction(x, y, _p.x, scr_returnMaskYMiddle(_p)); 
					_p.xHitForce = lengthdir_x(4,_dirToPlayer); 
					_p.yHitForce = lengthdir_y(4,_dirToPlayer); 
			
					scr_dealDamageToPlayer(explosion_damage);
			
					// Plays the player hit sound
					var snd_hit = snd_playerGetHitA;
				
					if (!audio_is_playing(snd_hit))
					{
						scr_playSoundVariant(0.1, snd_hit); 
					}
				}
			}
		}
		else
		{
			tick++;
		}
		#endregion
		break;
}

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

attack_cooldown--;