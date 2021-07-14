/// @description checks whether an instance is valid and referencable.
/// @param instanceID
function scr_isValidInstance(argument0) {

	var _id = argument0;

	if (!is_undefined(_id) and _id != noone and instance_exists(_id))
	{
		return true;
	}
	else
	{
		return false;
	}


}
