/// @description Insert description here
// You can write your code in this editor

var _debug = false;

if _debug
{
	draw_set_halign(fa_left); 
	var _str = ""; 
	_str += "TStop: " + string(global.timeStop ) + "\n"; 
	//_str += "CameraX: " + string(cameraX) + "\n"; 
	//_str += "CameraY: " + string(cameraY) + "\n"; 
	//_str += "FCameraY: " + string(finalCameraX) + "\n"; 
	//_str += "FCameraY: " + string(finalCameraY)+ "\n"; 
	draw_text(25,200, _str); 
}

