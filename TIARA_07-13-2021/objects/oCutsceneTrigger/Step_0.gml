/// @description Insert description here
// You can write your code in this editor
if (!instance_exists(oCutscene))
{
	if (place_meeting(x, y, obj_player))
	{
		create_cutscene(t_scene_info);
		instance_destroy();
	}
}