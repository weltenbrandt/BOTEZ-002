function scr_checkForNewInputDevice() {
	for (var i = 0; i < 11; ++i)
	{
		if gamepad_is_connected(i)
		{
			if (gamepad_button_check_pressed(i, gp_start))
			{
				if (inputDevice != i)
				{
					debugTextTimer = 120; 
					debugShowText = "Input Set: "  + "Gamepad: " + string(i); 
					return i; 
				}
			}
		}
	}

	if (instance_exists(oGamepadConnecMenu))
	{
		var _id = oGamepadConnecMenu.gamepad_id;
		
		if (inputDevice != _id)
		{
			debugTextTimer = 120; 
			debugShowText = "Input Set: "  + "Gamepad: " + string(_id); 
			instance_destroy(oGamepadConnecMenu);
			return _id; 
		}	
		
	}

	if (keyboard_check_pressed(vk_anykey))
	{
		if (inputDevice != -1)
		{
			debugTextTimer = 120; 
			debugShowText = "Input Set: Keyboard"; 
			return -1; 
		}
	}

	return NULLVALUE;


}
