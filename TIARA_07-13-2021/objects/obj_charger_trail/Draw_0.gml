// Flashes in red
if (start_opacity > 0)
{
	shader_set(shFlash);
	
	// Draws the sprite
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, color, start_opacity);
	
	// Decreases the opacity
	start_opacity -= fade_speed;
	shader_reset();
}
else
{
	// If the trail isn't visible anymore, destroy it
	instance_destroy();
}