if (flashTimer > 0)
{
	shader_set(shd_drawWhite); 
	draw_sprite_ext(sprite_index,image_index,round(x),round(y),image_xscale,image_yscale,0,c_white,image_alpha); 
}
else
{
	if (invincibilityTimer <= 0
	or current_time mod flickerMod >= flickerModDiv
	or global.timeStop > 0
	)
	{image_alpha = 1;}
	else {image_alpha = .5;}
	
	draw_sprite_ext(sprite_index,image_index,round(x),round(y),image_xscale,image_yscale,0,c_white,image_alpha); 
	image_alpha = 1; 
}
shader_reset(); 

if (global.debugMode and !dead)
{
	draw_set_halign(fa_center); 
	draw_set_valign(fa_top); 
	var _debugText = state + "\n"; 
	_debugText += "Sprite: " + string(sprite_get_name(sprite_index)) + "\n"; 
	_debugText += "Facing: " + string(facing) + "\n"; 
	_debugText += "Xvel: " + string(velocity[XAXIS]) + "\n"; 
	_debugText += "Yvel: " + string(velocity[YAXIS]); 
	
	draw_text(x,y, _debugText); 
	draw_sprite_ext(mask_index,0,round(x),round(y),image_xscale,image_yscale,0,c_white,.3); 
	
	var _yStart = scr_returnMaskYMiddle(id);
	draw_set_color(c_yellow); 
	draw_circle(x, _yStart, cautionRadius, true); 
	draw_set_color(c_red); 
	draw_circle(x, _yStart, alarmRadius, true); 
	draw_set_color(c_white); 
	
	draw_set_color(c_purple);
	draw_line_width(x - cautionRadius*.5, y + sightOffsetYTop, x + cautionRadius*.5, y + sightOffsetYTop,2); 
	draw_line_width(x - cautionRadius*.5, y + sightOffsetYBottom, x + cautionRadius*.5, y +sightOffsetYBottom,2);
	draw_set_color(c_white); 
								
}
