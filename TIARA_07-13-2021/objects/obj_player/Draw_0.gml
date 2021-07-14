if (flashTimer > 0)
{
	shader_set(shd_drawWhite); 
	draw_sprite_ext(sprite_index, image_index,x,y,image_xscale*squashScaleX, image_yscale*squashScaleY, image_angle, image_blend, image_alpha);
}
else
{
	if (invincibilityTimer <= 0
	or current_time mod flickerMod >= flickerModDiv
	or global.timeStop > 0
	)
	{image_alpha = 1;}
	else {image_alpha = .5;}
	
	draw_sprite_ext(sprite_index, image_index,x,y,image_xscale*squashScaleX, image_yscale*squashScaleY, image_angle, image_blend, image_alpha);
	image_alpha = 1; 
}
shader_reset(); 
if (global.debugMode == true)
{
	draw_set_halign(fa_center); 
	draw_set_valign(fa_middle); 
	draw_set_color(c_black); 
	draw_text(x, bbox_bottom + 5, state + "\n" + sprite_get_name(sprite_index)); 
	draw_set_color(c_white); 

	draw_set_alpha(.4); 
	draw_sprite(mask_index, 0, x,y); 
	draw_set_alpha(1); 
}