// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function deactivate_shader(){
	if (instance_exists(obj_controller))
	{
		with(obj_controller)
		{
			shaderIndex = 5;
		}
	}
}