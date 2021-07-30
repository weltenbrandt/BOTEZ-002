// Flashes in white

draw_self();

if (flash_alpha > 0)
{
	shader_set(shFlash);
	
	// Draws the sprite
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, flash_alpha);
	
	// Decreases the opacity
	flash_alpha -= flash_speed;
	shader_reset();
}