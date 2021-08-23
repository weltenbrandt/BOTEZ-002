
if (place_meeting(x, y, oSelection))
{

	for (var i = 0; i < 11; ++i)
	{
		if gamepad_is_connected(i)
		{
			if (gamepad_button_check_pressed(i, gp_face1))
			{
				event_perform(ev_mouse, ev_left_release);
				var inst = instance_create_depth(x, y, depth, oGamepadConnecMenu);
				
				with(inst)
				{
					gamepad_id = i;
				}
			}
		}
	}

}