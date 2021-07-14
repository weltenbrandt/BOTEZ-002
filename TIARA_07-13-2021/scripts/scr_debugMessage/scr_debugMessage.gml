/// @description show debug message with time stamps and elaboration
/// @param debugMessage
function scr_debugMessage(argument0) {

	var _message = argument0;

	var _object = object_get_name(object_index);
	var _instanceID = string(id);
	var _time = string(current_time);

	show_debug_message(
	"From Object: " + _object + ", ID: " + _instanceID + ", Time: " + _time + "\n" +
	_message);



}
