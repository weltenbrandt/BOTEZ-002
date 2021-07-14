if (debugTextTimer >= 0)
{
	draw_set_halign(fa_right); 
	draw_set_valign(fa_top); 
	draw_set_color(c_black); 
	draw_text(obj_displayController.ideal_width - 5, 5, debugShowText); 
	draw_set_color(c_white); 
	debugTextTimer -= 1; 
}
else
{debugShowText = "";}

draw_text(50,50, "dev: " + string(inputDevice)); 
