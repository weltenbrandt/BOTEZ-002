timer += 1; 

if (monstersSpawned < spawnLimit)
{
	if (timer >= spawnInterval)
	{
		timer = 0; 
		var _enemyLayer = layer_get_id("enemies"); 
		var _depth = layer_get_depth(_enemyLayer); 
		instance_create_depth(x,y,_depth,monsterToSpawn); 
		scr_playSound(spawnSound, false); 
		monstersSpawned += 1; 
	}
}