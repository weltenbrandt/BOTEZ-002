timer += 1; 

switch simpleState
{
	case simpleStates.idle:
		image_index = 0; image_speed = 0; 
		timer += 1; 
		if (timer >= bounceDelay){simpleState = simpleStates.bounce;timer = 0; }
		
		#region SWITCH TO OPEN
			var _p = obj_player; 
			if (scr_isValidInstance(_p))
			{
				var _dist = point_distance(x,y,_p.x,_p.y); 
				if (_dist <= activationDistance)
				{
					simpleState = simpleStates.open; 
					image_index = 0; 
				}
			}
		#endregion
		break;
	case simpleStates.bounce:
		image_speed = bounceAnimationSpeed; 
		if (image_index + image_speed >= image_number - 1)
		{
			simpleState = simpleStates.idle; 
			timer = 0; 
		}
		#region SWITCH TO OPEN
			var _p = obj_player; 
			if (scr_isValidInstance(_p))
			{
				var _dist = point_distance(x,y,_p.x,_p.y); 
				if (_dist <= activationDistance)
				{
					simpleState = simpleStates.open; 
					image_index = 0; 
				}
			}
		#endregion
		break; 
	case simpleStates.open:
		sprite_index  = spr_basicChestOpen; 
		image_speed = openAnimationSpeed; 
		if (image_index + image_speed >= image_number - 1)
		{
			image_index = image_number - 1; 
		}
	
		if (image_index >= 6)
		{
			timer += 1; 
			if (timer mod 10 == 0)
			{
				scr_spawnCoins(x,y - 16, 5, min(10,coinsInside),random_range(90 - coinAngleVariance ,90 + coinAngleVariance ), coinForce + random_range(-coinForceVariance,coinForceVariance)); 
				coinsInside -= min(10,coinsInside); 
			}
		}
		else {timer = 0;}
		break; 
}