/// @description Insert description here
// You can write your code in this editor


var _newInputDevice = scr_checkForNewInputDevice(); 

if (_newInputDevice != NULLVALUE and _newInputDevice != inputDevice)
{
	inputDevice = _newInputDevice; 
	scr_setInputDeviceDefaults(); 
}


switch inputDevice
{
	// GAMEPADS
	default:
		scr_updateGamepadInputs(); 
		break; 
	// KEYBOARD
	case -1: // KEYBOARD
		scr_updateKeyboardInputs(); 
		break; 
}