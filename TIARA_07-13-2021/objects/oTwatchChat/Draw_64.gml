// Draws the health bar
var _x = display_get_gui_width() / 2 + bar_x_offest;
var _y = display_get_gui_height() - 100 + bar_y_offest;

var _hhealth = hp_max / 2 * health_chunk_size;

draw_set_color(c_black);
draw_rectangle(_x - _hhealth, _y - health_chunk_size / 2, _x + _hhealth, _y + health_chunk_size / 2, false);

draw_set_color(c_red);
draw_rectangle(_x - _hhealth, _y - health_chunk_size / 2, _x - _hhealth + hp * health_chunk_size, _y + health_chunk_size / 2, false);

draw_set_color(c_white);
draw_rectangle(_x - _hhealth, _y - health_chunk_size / 2, _x + _hhealth, _y + health_chunk_size / 2, true);