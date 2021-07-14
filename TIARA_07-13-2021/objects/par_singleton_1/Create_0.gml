/// @description SINGLETON ENFORCEMENT

if instance_number(object_index) > 1
{
	instance_destroy();
	scr_debugMessage("SINGLETON ENFORCEMENT, EXTRA: " + string(object_get_name(object_index)) + " OBJECT DESTROYED");
}