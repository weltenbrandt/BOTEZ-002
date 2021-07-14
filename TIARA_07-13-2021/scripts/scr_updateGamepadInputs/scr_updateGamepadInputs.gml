function scr_updateGamepadInputs() {
#region CLEAR INPUTS
		global.inputLeftPressed = false;
		global.inputLeftHeld = false;
		global.inputLeftReleased = false;

		global.inputRightPressed = false;
		global.inputRightHeld = false;
		global.inputRightReleased = false;

		global.inputHorizontalTotal = global.inputRightHeld - global.inputLeftHeld; 

		global.inputDownPressed = false;
		global.inputDownHeld = false;
		global.inputDownReleased = false;

		global.inputUpPressed = false;
		global.inputUpHeld = false;
		global.inputUpReleased = false;

		// ATTACK
		global.inputAttackPressed = false;
		global.inputAttackHeld = false;
		global.inputAttackReleased = false;

		// JUMP
		global.inputJumpPressed = false;
		global.inputJumpHeld = false;
		global.inputJumpReleased = false;
		// BLOCK
		global.inputGuardPressed = false;
		global.inputGuardHeld = false;
		global.inputGuardReleased = false;

		global.inputDashPressed = false;
		global.inputDashHeld = false;
		global.inputDashReleased = false;
#endregion

	// POLL AXIS POSITIONS AND SET INPUT HELD/PRESSED VALUES (DOES NOT SET INPUTRELEASED VALUES)
#region
		var _device = inputDevice; 

		var _xAxis = round(gamepad_axis_value(_device, gp_axislh)); 
		var _yAxis = round(gamepad_axis_value(_device, gp_axislv));

		var _axisTouched = false; 
		if (_xAxis == 0 and _yAxis == 0)
		{gamepadAxisReady = true;}
		else
		{_axisTouched = true;}


		switch _xAxis
		{
			case -1: global.inputLeftHeld = true; if (gamepadAxisReady == true) {global.inputLeftPressed = true} break;
			case 1: global.inputRightHeld = true; if (gamepadAxisReady == true) {global.inputRightPressed = true} break;
		}

		switch _yAxis
		{
			case -1: global.inputUpHeld = true; if (gamepadAxisReady == true)  {global.inputLeftPressed = true} break;
			case 1: global.inputDownHeld = true; if (gamepadAxisReady == true) {global.inputRightPressed = true} break;
		}

		if (_axisTouched){gamepadAxisReady = false;}
		global.inputHorizontalTotal = global.inputRightHeld - global.inputLeftHeld; 
#endregion

	// ATTACK
	global.inputAttackPressed  = gamepad_button_check_pressed(_device,inputAttackButton); 
	global.inputAttackHeld     = gamepad_button_check(_device,inputAttackButton); 
	global.inputAttackReleased = gamepad_button_check_released(_device,inputAttackButton); 

	// JUMP
	global.inputJumpPressed  = gamepad_button_check_pressed(_device,inputJumpButton); 
	global.inputJumpHeld     = gamepad_button_check(_device,inputJumpButton); 
	global.inputJumpReleased = gamepad_button_check_released(_device,inputJumpButton); 

	// Dash
	global.inputDashPressed  = gamepad_button_check_pressed(_device,inputDashButton); 
	global.inputDashHeld     = gamepad_button_check(_device,inputDashButton); 
	global.inputDashReleased = gamepad_button_check_released(_device,inputDashButton); 

	// GUARD
	global.inputGuardPressed  = gamepad_button_check_pressed(_device,inputBlockButton); 
	global.inputGuardHeld     = gamepad_button_check(_device,inputBlockButton); 
	global.inputGuardReleased = gamepad_button_check_released(_device,inputBlockButton); 


}
