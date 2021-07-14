function scr_enemySeparate() {

	separateXDir = 0; 
	separateYDir = 0; 

	var _oldX = x; x = NULLVALUE; 
	var _oldY = y; y = NULLVALUE; 
		
	if (object_is_ancestor(object_index, uncle_groundEnemy))
	{
		if (place_meeting(x,y, uncle_groundEnemy))
		{
			var _enemyTouching = instance_nearest(_oldX,_oldY,  uncle_groundEnemy); 
		
			var _dir = x - _enemyTouching.x;
			separateXDir = sign(_dir); 
			_enemyTouching.separateXDir = -sign(_dir); 
		}
	}
	else if (object_is_ancestor(object_index, uncle_airEnemy))
	{
			separateDirection = NULLVALUE; 
			var _enemyTouching = instance_nearest(_oldX,_oldY,  uncle_airEnemy); 
			if (scr_isValidInstance(_enemyTouching)
			and point_distance(_oldX,_oldY, _enemyTouching.x,_enemyTouching.y) <= separateRadius)
			{																
				_dir = point_direction(_enemyTouching.x,_enemyTouching.y,_oldX,_oldY); 
				separateDirection = _dir; 
			}
	}

	x = _oldX; y = _oldY; 


}
