switch simpleState
{
	case savePointStates.inactive:
		var _p = obj_player;
		if scr_isValidInstance(_p)
		{
			var _dist = point_distance(x,y, _p.x, _p.y); 
			if (_dist <= 150 and _p.onGround == true)
			{
				with obj_savePoint {simpleState = savePointStates.inactive;}
				simpleState = savePointStates.activating;
				sprite_index = spr_savePointActivate; 
				image_index = 0; 
			}
		}
		break; 
	case savePointStates.activating: 
		image_speed = .2; 
		if (image_index + image_speed >= image_number )
		{
			sprite_index = spr_savePointActive;
			simpleState = savePointStates.active; 
			image_index = 0; 
		}
		break;
	case savePointStates.active:
		image_speed = .2;	
		break; 
}