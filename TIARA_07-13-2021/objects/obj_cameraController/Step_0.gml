if (global.timeStop > 0){exit;}

/// @description Follow followObject if it exists.
var _followObject = followObject;
if (scr_isValidInstance(_followObject))
{
	
	var _displayControl = obj_displayController;
	width = _displayControl.ideal_width*zoom;
	height = _displayControl.ideal_height*zoom;

	halfWidth = width / 2;
	halfHeight = height /2; 

	var _cameraXGoal = _followObject.x - (halfWidth);
	var _cameraYGoal = _followObject.y - (halfHeight);
	
	cameraX = _cameraXGoal;//lerp(cameraX, _cameraXGoal, .2);
	cameraY = _cameraYGoal; //lerp(cameraY, _cameraYGoal, .2);

	finalCameraX = round(clamp(cameraX, 0, room_width - width));
	finalCameraY = round(clamp(cameraY, 0, room_height - height));
	
	// CALCULATE CAMERA SHAKE
	var _xShakeResult = irandom_range(-xShakeForce, xShakeForce); 
	var _yShakeResult = irandom_range(-yShakeForce, yShakeForce);
	finalCameraX  += _xShakeResult;
	finalCameraY  += _yShakeResult;
	xShakeForce = max(0, xShakeForce - xShakeDecay); 
	yShakeForce = max(0, yShakeForce - yShakeDecay);
	
	camera_set_view_size(camera, width,height);
	camera_set_view_pos(camera, round(finalCameraX + _xShakeResult), round(finalCameraY +  _yShakeResult));
}

// RESPOND TO ZOOM ZONES

#region DYNAAMIC ZOOM ZONES
	targetZoom = .5; 
	zoomLerp = .1; 
	var _cameraZoneType = cameraZoneTypes.none; 
	with obj_player
	{
		var _zoneList = ds_list_create(); 
		var _num = instance_place_list(x,y, par_cameraZone, _zoneList, false); 
	
		
		for (var i = 0; i < _num; ++i)
		{
			var _cZone = ds_list_find_value(_zoneList, i); 
			if (_cZone != noone)
			{
				_cameraZoneType = _cZone.type; 
			}
			
			switch _cameraZoneType
			{
				case cameraZoneTypes.zoom_in_zone:
					obj_cameraController.targetZoom = .25; 
					break; 
				case cameraZoneTypes.zoom_out_zone:
					obj_cameraController.targetZoom = 1; 
					break; 
			}
		
		}
	}
#endregion
zoom = lerp(zoom, targetZoom,zoomLerp); 

if layer_exists(bg1){layer_x(bg1, finalCameraX/4);}
if layer_exists(bg2){layer_x(bg2, finalCameraX/5);}
if layer_exists(bg3){layer_x(bg3, finalCameraX/6);}
