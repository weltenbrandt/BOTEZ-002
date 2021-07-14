/// @description initializes display properties.
function scr_initDisplay() {

	// set base ideal width/height
	ideal_width = 0;
	ideal_height = 640;

	zoom = 1;

	// calculate display aspect ratio
	aspect_ratio = display_get_width()/display_get_height();
	aspect_ratio = clamp(aspect_ratio, 16/10, 21/9); // clamps aspect ratio of the game overall.



	ideal_width = round(ideal_height*aspect_ratio);

	// PIXEL PERFECT SCALING

	if (display_get_width() mod ideal_width != 0)
	{
		var _d = round(display_get_width()/ideal_width);
		ideal_width= display_get_width()/_d;
	}

	if (display_get_height() mod ideal_height != 0)
	{
		var _d = round(display_get_height()/ideal_height);
		ideal_height = display_get_height()/_d;
	}


	// ELIMINATE ODD NUMBERED WIDTH AND HEIGHT VALUES
	if (ideal_width & 1)
	{
		ideal_width++;
	}

	if (ideal_height & 1)
	{
		ideal_height++;
	}

	// store maximum zoom value for windowed mode.
	max_zoom = floor(display_get_width()/ideal_width);

	// resize application surface

	surface_resize(application_surface, ideal_width, ideal_height);
	window_set_size(ideal_width, ideal_height);

	scr_debugMessage(
	"IWidth: " + string(ideal_width) + "\n" +
	"IHeight: " + string(ideal_height)
	);

	full_screen = 0;

	alarm[0] = 1; // centers view.


}
