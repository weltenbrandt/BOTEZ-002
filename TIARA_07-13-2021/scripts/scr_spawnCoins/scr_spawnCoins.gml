/// @description SPAWNS COINS AT A DESIRED LOCATION
/// @param x,y,range,value,dir,...forceOverride
function scr_spawnCoins() {

	var _xx = argument[0]; 
	var _yy = argument[1]; 
	var _range = argument[2]; 
	var _val = argument[3]; 
	var _dir = argument[4];  

	if (argument_count > 5)
	{
		var _forceOverride = argument[5]; 
	}
	else {_forceOverride = NULLVALUE;}

	while (_val > 0) 
	{
		//if (_val >= 10){var _coinType = choose(obj_collectibleCoin, obj_collectibleRing,obj_collectibleStar);}
		//else if (_val >=5) {var _coinType = choose(obj_collectibleCoin, obj_collectibleRing);}
		var _coinType = obj_collectibleCoin;
	
		var _force = random_range(2,4); 
		if (_forceOverride != NULLVALUE)
		{_force = _forceOverride + random_range(-1,1);}
	
		var _myDir = _dir + irandom_range(-15,15); 
		var _layer = layer_get_id("collectibles"); 
		var _depth = layer_get_depth(_layer); 
		var _coin = instance_create_depth(_xx + irandom_range(-_range,_range), _yy + irandom_range(-_range,_range), _depth, _coinType); 
		_coin.velocity[XAXIS] = lengthdir_x(_force,_myDir); 
		_coin.velocity[YAXIS] = lengthdir_y(_force,_myDir); 
	
		if (_coin.velocity[XAXIS] == 0 and _coin.velocity[YAXIS] == 0) 
		{with _coin {scr_stateBeginIn("Idle");}}
		else {with _coin {scr_stateBeginIn("Moving");}}
		_val -= _coin.coinValue;
	}




}
