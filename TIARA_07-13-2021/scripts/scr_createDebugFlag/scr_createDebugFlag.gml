/// @description creates a debug flag
/// @param x,y,message
function scr_createDebugFlag() {

	var _flag = instance_create_depth(argument[0], argument[1], -999, obj_debugFlag); 

	_flag.message = argument[2]; 


}
