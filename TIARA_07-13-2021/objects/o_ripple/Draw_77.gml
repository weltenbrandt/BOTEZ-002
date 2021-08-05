surface_distort = surface_create(room_width,room_height);
surface_set_target(surface_distort);

draw_clear_alpha(COLOUR_FOR_NO_MOVE,0);

// Anything we draw here will distort the screen
draw_sprite_ext(sRippleNormal,0, x,y, xscale, yscale, 0, c_white, alpha);

surface_reset_target();

var surface_texture_page = surface_get_texture(surface_distort);

shader_set(shader_ripple);

texture_set_stage(distortion_stage, surface_texture_page);
draw_surface(application_surface,0,0)

shader_reset()

surface_free(surface_distort) // always remember to remove the surface from memory


if (alpha >= 0)
{
	xscale += 0.05;
	yscale += 0.05;

	alpha -= 0.05;
}