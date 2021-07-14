/// UpDATES LOCATIon
/// @param haltAtWalls
function scr_updateActorLocation() {
	// RETURNS IF A WALL WAS STRUCK
	
	var _wallStruck = false;
	var _debug = false; 
	
	// Adds up to the wind forces
	horWindSmooth += (horizontalWindForce - horWindSmooth) / 3;
	verWindSmooth += (verticalWindForce - verWindSmooth) / 3;
	

	// This if statement is exclusive for the player object
	if (object_index == obj_player)
	{
		// Decreases the vertical wind force
		if (verticalWindForce + jumpGravity > 0)
		{
			verticalWindForce = 0;
		}
		else
		{
			verticalWindForce += jumpGravity;
		}
		
		horizontalWindForce = lerp(horizontalWindForce, 0, 0.05);
		
		if (onGround)
		{
			launched = false;
			horizontalWindForce = 0;
		}
		
	}
	
	// Applies the wind force
	var xspd = velocity[XAXIS] + horWindSmooth;
	var yspd = velocity[YAXIS] + verWindSmooth;



#region SEPARATE LOGIC
		if (object_is_ancestor(object_index, uncle_groundEnemy))
		{
			x += separateXDir; 
		}
		else if (object_is_ancestor(object_index, uncle_airEnemy))
		{
			if (separateDirection != NULLVALUE)
			{
				x += lengthdir_x(separateSpeed,separateDirection); 
				y += lengthdir_y(separateSpeed,separateDirection); 
			}
		}

#endregion

	if (state_ignores_walls == false)
	{
		var _solidWorldList = ds_list_create(); 
		var _num = instance_place_list(x, y + yspd, par_solidWorld, _solidWorldList,false); 
		for (var i = 0; i < _num; ++i)
		{
			var _solidTouching = ds_list_find_value(_solidWorldList, i); 
			if (yspd > 0  and bbox_bottom < _solidTouching.bbox_top
			and _solidTouching.ethereal == false)
			{
				while !place_meeting(x,y + 1, _solidTouching)
				{y += 1;}
				myPlatform = _solidTouching; 
				y = floor(y); 
				yspd = 0;
			}
		}
		ds_list_destroy(_solidWorldList); 
	
	#region HORIZONTAL COLLISION LOGIC
			var _bboxSide; 
	
			if (xspd  > 0) 
			{_bboxSide = bbox_right;}
			else
			{_bboxSide = bbox_left;}
	
			var _halfWayY = bbox_top + ((bbox_bottom - bbox_top)*.5);
		
			if (xspd  < 0){var _xCheck = floor(xspd ) + separateXDir;}
			else {var _xCheck =ceil(xspd ) + separateXDir; }
		
			if (
			(   
			tilemap_get_at_pixel(tilemap, _bboxSide + _xCheck, bbox_top) != 0)
			or (tilemap_get_at_pixel(tilemap, _bboxSide + _xCheck, bbox_bottom) != 0)
			or (tilemap_get_at_pixel(tilemap, _bboxSide + _xCheck, _halfWayY) != 0)
			)
			{
				if (xspd  > 0)
				{
					x = x - (x mod TILESIZE) + TILESIZE_MINUS_ONE - (bbox_right - x);
					x = floor(x); 
				}
				else
				{
					x = x - (x mod TILESIZE) - (bbox_left - x);
					x = ceil(x); 
				}
				velocity[XAXIS] = 0; 
				xspd = 0;
				launched = false;
				horizontalWindForce = 0;
				horWindSmooth = 0;
				separateXDir = 0; 
				_wallStruck = true; 
			}
	#endregion

	#region VERTICAL COLLISION
			var _bboxSide; 
	
			if (yspd > 0) 
			{_bboxSide = bbox_bottom;}
			else
			{_bboxSide = bbox_top;}
	
			var _halfWayX = bbox_left+ ((bbox_right - bbox_left)*.5);
	
			if (yspd < 0){var _yCheck =floor(yspd);}
			else {var _yCheck =ceil(yspd); }
	
			if (
			(tilemap_get_at_pixel(tilemap, bbox_left,  _bboxSide + _yCheck) != 0)
			or (tilemap_get_at_pixel(tilemap, bbox_right, _bboxSide + _yCheck) != 0)
			or (tilemap_get_at_pixel(tilemap, _halfWayX, _bboxSide + _yCheck) != 0)
			)
			{
				if (yspd > 0) 
				{
					//THIS CODE DOES NOT PROPERLY ACCOUNT FOR DIFF BETWEEN Y AND BBOX BOTTOM
					var _wallTouchedTop = (((bbox_bottom + (TILESIZE*.5) + yspd) div TILESIZE)*TILESIZE); 
					var _yMod = round(y) - (y);
					var _diffBetweenY = bbox_bottom - y + _yMod;
					y = _wallTouchedTop + _diffBetweenY; 
					y = ceil(y); 
					yspd = 0; 
				}
				else
				{
					if _debug
					{
						with obj_debugFlag {instance_destroy();}
						scr_createDebugFlag(x,y, "YStart: " + string(y)); 
					}
					var _wallTouchedBottom = ((bbox_top + yspd) div TILESIZE)*TILESIZE;
					var _yMod = round(y) - (y);
					var _diffBetweenY = y - bbox_top - _yMod; 
					y = _wallTouchedBottom + _diffBetweenY + TILESIZE; 
					if _debug
					{
						scr_createDebugFlag(x,y + 50, "YEnd: " + string(y)); 
					}
				}
				velocity[YAXIS] = 0;
				yspd = 0;	
				launched = false;
				verticalWindForce = 0;
				verWindSmooth = 0
				_wallStruck = true; 
			}
	#endregion
	
	}
	
	
	
	x += xspd;
	
	// If the player isn't gonna get into the ground on the next frame, increase the y axis with the speed
	if (!tile_meeting(x, y + yspd, "Collisions") or y + sprite_yoffset >= room_height - 20)
	{
		y += yspd;
	}
	else
	{
		while !(tile_meeting(x, y + yspd, "Collisions"))
		{
			y += sign(yspd);
		}
	}
	
	with obj_hitbox
	{
		if scr_isValidInstance(owner)
		{
			if (owner == other.id and !stationary)
			{
				x = owner.x + xOffset*owner.facing;
				y = owner.y + yOffset; 
				x -= image_xscale*.5;
				y -= image_yscale*.5;
				event_perform(ev_other,ev_user0); // CHECK FOR HITS/COLLISIONS
			}
		}
	}

	//if onGround {y = ceil(y); }

	return _wallStruck;


}
