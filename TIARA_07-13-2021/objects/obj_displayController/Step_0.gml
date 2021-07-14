/// @description Alter Window Size and Full Screen
if (keyboard_check_pressed(ord("Z")))
{
	scr_adjustWindowScale(1);
}

if (keyboard_check_pressed(ord("F")))
{
	scr_adjustFullScreen();
}