/// @description 
// Messages
messages = ds_list_create();
messageID = 0;

// Current message
messageText = "";
messageChar = 0;
messageSpeed = 0.4;

with (obj_player)
{
	velocity[XAXIS] = 0;
}

// GUI dimensions
var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

// Textbox dimensions
height = floor(_guiH * 0.35);
width = _guiW;

// Position on screen
x = 0;
y = _guiH - height;

// Other properties
padding = 16;

// Skipable message
skipable = false;
skip_frame = 0;
skip_cooldown = 3 * room_speed;