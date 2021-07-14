function state_collectible_collected() {
	var _p = obj_player; 
	var _pY = scr_returnMaskYMiddle(_p); 

	if state_new

		scr_playSoundVariant(.33, snd_pick_1); 

	{
		if (scr_isValidInstance(_p))
		{
			state_var[0] = point_direction(_p.x, _pY,x,y); // DIR TO PLAYER
			state_var[1] = point_distance(_p.x, _pY,x,y); // DIR TO PLAYER
		}
	}

	if scr_isValidInstance(_p)
	{
		var _lerpFact = .05; 
		state_var[0] += 10; 
		state_var[1] = lerp(state_var[1],0,_lerpFact); 
		image_xscale = lerp(image_xscale,.2,_lerpFact*.5); 
		image_yscale = lerp(image_yscale,.2,_lerpFact*.5); 
	
		x = _p.x + lengthdir_x(state_var[1], state_var[0]) + _p.velocity[XAXIS]; 
		y = _pY + lengthdir_y(state_var[1], state_var[0]) + _p.velocity[YAXIS]; 
	
		if (state_var[1] <= 8) 
		{
			scr_playSoundVariant(.33,snd_pickup1); 
			obj_gameDataController.coins += coinValue; 
			instance_destroy();
		}
	
	}


}
