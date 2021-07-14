/// DESCRIPTION DEBUG
if (global.debugMode == true)
{
	var _debugString = ""; 

	_debugString += "X: " + string(x) + "\n"; 
	_debugString += "Y: " + string(y) + "\n"; 
	_debugString += "Invincibility: " + string(invincibilityTimer) + "\n"; 
	_debugString += "XVel: " + string(velocity[XAXIS]) + "\n"; 
	_debugString += "YVel: " + string(velocity[YAXIS]) + "\n";
	_debugString += "Facing: " + string(facing) + "\n";
	_debugString += "Sprite index: " + sprite_get_name(sprite_index) + "\n";
	_debugString += "Image index: " + string(image_index) + "\n";
	_debugString += "DshCDTimer: " + string(dashCooldownTimer) + "\n";
	_debugString += "IgnWalls: " + string(state_ignores_walls)+ "\n";
	_debugString += "SV0:" + string(state_var[0])+ "\n";
	_debugString += "SV1:" + string(state_var[1])+ "\n";
	_debugString += "SV2:" + string(state_var[2]);

	draw_set_halign(fa_left); 
	draw_set_valign(fa_top); 
	draw_set_color(c_black); 
	draw_text(obj_displayController.ideal_width -160,5, _debugString); 
	draw_set_color(c_black); 
}