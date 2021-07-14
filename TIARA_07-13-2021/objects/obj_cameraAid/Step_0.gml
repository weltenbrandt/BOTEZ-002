if (global.timeStop > 0) {exit;}

var _player = obj_player; 
if scr_isValidInstance(_player)
{
	
	// CAMERA ZONE LOGIC
	var _cameraZoneType = NULLVALUE; 
	
	with obj_player
	{
		var _cZone = instance_place(x,y, par_cameraZone); 
		if (_cZone != noone)
		{
			_cameraZoneType = _cZone.type; 
		}
	}
	
	switch _cameraZoneType
	{
		default:
		case NULLVALUE: 
			#region NORMAL CAMERA BEHAVIOR
				// SET X LOCATION
				offsetX = lerp(offsetX, _player.facing*30 + _player.velocity[XAXIS]*25, .05); 
				var _xTarget = lerp(x,_player.x + offsetX,.1);
				x = _xTarget;
				
			#endregion
			break;
		case cameraZoneTypes.wall_jump_zone:
			#region WALL JUMP ZONE LOGIC 
				// SET X LOCATION
				var _xTarget = lerp(x,_cZone.x,.1);
				x = _xTarget;
			#endregion
			break; 
	}
	// SET Y LOCATION
	var _targetY = y; 
	var _yCorrection = -45; 
	
	switch _player.state
	{
		default:
			yDiff = lerp(yDiff, 0, .1); 
			if (_player.onGround)
			{
				yAnchor = lerp(yAnchor,_player.y, .05);
			}
			_targetY = yAnchor + _yCorrection + yDiff;
			break; 
		case "Wall Slide":
		case "Jump": //- COMMENT THESE OUT AND THE JUMP/FALL CASES IN TO SWITCH BETWEEN "SMART Y" CAMERA S
		case "Fall":
		case "Dash":
		case "Sword Swing Air": 
		case "Sword Swing Jump":
		case "Hit Stun":
		
		
			yDiff = lerp(yDiff, 0, .1); 
			yAnchor = lerp(yAnchor,_player.y, .05);
			yAnchor += _player.velocity[YAXIS]; 
			_targetY = yAnchor + _yCorrection + yDiff;
			break;
		case "Guard":
			if (_player.onGround)
			{
				yDiff = lerp(yDiff, 0, .1); 
				if (_player.onGround)
				{
					yAnchor = lerp(yAnchor,_player.y, .05);
				}
				_targetY = yAnchor + _yCorrection + yDiff;
			}
			else
			{
				yDiff = lerp(yDiff, 0, .1); 
				yAnchor = lerp(yAnchor,_player.y, .05);
				yAnchor += _player.velocity[YAXIS]; 
				_targetY = yAnchor + _yCorrection + yDiff;
			}
			break;
			
	}
	y = lerp(y,_targetY,.3); 


}