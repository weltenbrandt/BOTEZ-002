timer += 1; 

if (timer >= 120)
{
	timer = 0; 
	var _p = obj_player; 
	if (scr_isValidInstance(_p))
	{
		var _pY = scr_returnMaskYMiddle(_p); 
		var _spawnX = x; var _spawnY = y - 30; 
		scr_spawnProjectile(_spawnX, _spawnY, point_direction(_spawnX,_spawnY, _p.x,_pY), 4, obj_testProjectile); 
	}
}