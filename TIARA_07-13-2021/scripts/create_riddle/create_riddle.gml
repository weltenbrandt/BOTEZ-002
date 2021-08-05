// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_riddle(_x, _y){

	if (instance_exists(o_ripple))
	{
		with (o_ripple)
		{
			show_debug_message("AAAA")
			o_ripple.x = _x;
			o_ripple.y = _y;
			
			alpha = 1;
			xscale = 0;
			yscale = 0;
			
		}
	}

}