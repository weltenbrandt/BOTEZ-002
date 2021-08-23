
for (var i = 0; i < 11; ++i)
{
	if gamepad_is_connected(i)
	{
		if (gamepad_button_check_pressed(i, gp_padu))
		{
			x = oContinueGame.x;
			y = oContinueGame.y;
			currDevice = "gamepad";
		}
		else if (gamepad_button_check_pressed(i, gp_padd))
		{
			x = oNewGame.x;
			y = oNewGame.y;
			currDevice = "gamepad";
		}
		
		
	}
}

if (currDevice == "gamepad")
{
	if (mouse_x != mouse_x_previous or mouse_y != mouse_y_previous)
	{
		currDevice = "mouse";
	}
}

if (currDevice == "mouse")
{
	x = mouse_x;
	y = mouse_y;
}

mouse_x_previous = mouse_x;
mouse_y_previous = mouse_y;