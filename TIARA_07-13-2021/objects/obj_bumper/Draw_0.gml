
draw_set_color(c_white)

draw_self();

// Draws the tiny circle for the direction if active
if (active)
{
	draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(50, bumper_angle + 90), y + lengthdir_y(50, bumper_angle + 90), 0.5, 0.5, 0, c_white, 1);
}

// Flashes in red
if (flashAlpha > 0)
{
	shader_set(shFlash);
	
	//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);
	
	draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(50, bumper_angle + 90), y + lengthdir_y(50, bumper_angle + 90), 0.5, 0.5, 0, flashColor, flashAlpha);
	
	flashAlpha -= 0.1;
	shader_reset();
}