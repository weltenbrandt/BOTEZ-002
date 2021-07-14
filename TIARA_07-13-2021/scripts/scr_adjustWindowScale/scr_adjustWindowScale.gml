function scr_adjustWindowScale(argument0) {
	var _change = argument0;

	var _newZoom = zoom + _change;

	if 
	(
	ideal_width* _newZoom <= display_get_width()
	and ideal_height* _newZoom <= display_get_height()
	)
	{
		zoom = _newZoom;
	
		window_set_size(ideal_width*zoom, ideal_height*zoom);
		alarm[0] = 1;
	}
	else
	{
		zoom = 1;
	
		window_set_size(ideal_width*zoom, ideal_height*zoom);
		alarm[0] = 1;
	}



}
