var _p = obj_player; 

if (veilAlpha > 0)
{
	draw_set_alpha(veilAlpha); 
	draw_set_color(c_black); 
	draw_rectangle(0,0,obj_displayController.ideal_width,obj_displayController.ideal_height, false); 
	draw_set_color(c_white); 
	draw_set_alpha(1); 
}

if (scr_isValidInstance(_p) and _p.state == "Dead")
{
	veilAlpha += veilFadeSpeed;
	veilAlpha = clamp(veilAlpha, 0,1); 
	var _camera = obj_cameraController.camera; 
	var _zoom = obj_cameraController.zoom; 
	var _pX = (_p.x - camera_get_view_x(_camera))/_zoom; 
	var _pY = (_p.y - camera_get_view_y(_camera))/_zoom; 
	draw_sprite_ext(_p.sprite_index, _p.image_index, _pX , _pY, 1/_zoom , 1/_zoom , 0,c_white, _p.image_alpha); 
	
	if (_p.state_var[2] == true)
	{
		transitionTimer += 1;
		playerDeathRectangleVeil += .1; 
		playerDeathRectangleVeil = clamp(playerDeathRectangleVeil,0,1); 
		draw_set_color(c_black); draw_set_alpha(playerDeathRectangleVeil); 
		draw_rectangle(_pX - 100, _pY - 100, _pX + 100, _pY + 100, false); 
		draw_set_color(c_white); draw_set_alpha(1); 
		
		if (transitionTimer >= _p.deathRestartTime and playerDeathRectangleVeil >= 1)
		{
			playerDeathRectangleVeil = 0; 
			transitionTimer = 0; 
			scr_resetGameInfo(); 
			room_restart();
		}
	}
}
else
{
	veilAlpha = max(0, veilAlpha - veilFadeSpeed); 
	
}
