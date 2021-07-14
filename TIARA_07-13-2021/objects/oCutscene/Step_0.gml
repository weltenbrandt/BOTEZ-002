
show_debug_message(image_index);
show_debug_message(current_scene[0]);

//show_debug_message(current_scene[0] < image_index)
if (scene != -1)
{
	if (image_index >= current_scene[0] - 1)
	{
		// Executes the script of that frame
		script_execute_alt(current_scene[1], current_scene_array);
	
		scene++;
	
		if (scene > array_length(scene_info) - 1)
		{
			scene = -1;
			exit;
		}

		event_perform(ev_other, ev_user0);
	}
}

if (pause_cooldown == "Input")
{
	image_speed = 0;
	
	if (global.inputAttackPressed)
	{
		pause_cooldown = 0;
	}
	exit;
}
if (pause_cooldown > 0)
	{
		image_speed = 0;
		pause_cooldown--;
	}
	else
	{
		image_speed = 1;
	}