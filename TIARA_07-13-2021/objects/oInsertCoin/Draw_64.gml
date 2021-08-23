if (selected or room == rm_Menu)
{
	if (room == rm_Menu)
	{
		transparency -= 0.05;
	}
	else
	{
		transparency += 0.05;
	}
	draw_set_alpha(transparency);
	
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	
	draw_set_alpha(1);
	
	if (transparency >= 1)
	{
		room_goto(rm_Menu);
	}
	
	if (transparency <= 0)
	{
		instance_destroy();
	}
}