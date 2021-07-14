function scr_updateKeyboardInputs() {
	global.inputLeftPressed = keyboard_check_pressed(inputLeftButton); 
	global.inputLeftHeld = keyboard_check(inputLeftButton); 
	global.inputLeftReleased = keyboard_check_released(inputLeftButton); 

	global.inputRightPressed = keyboard_check_pressed(inputRightButton); 
	global.inputRightHeld = keyboard_check(inputRightButton); 
	global.inputRightReleased = keyboard_check_released(inputRightButton); 

	global.inputHorizontalTotal = global.inputRightHeld - global.inputLeftHeld; 

	global.inputDownPressed = keyboard_check_pressed(inputDownButton); 
	global.inputDownHeld = keyboard_check(inputDownButton); 
	global.inputDownReleased = keyboard_check_released(inputDownButton); 

	global.inputUpPressed = keyboard_check_pressed(inputUpButton); 
	global.inputUpHeld = keyboard_check(inputUpButton); 
	global.inputUpReleased = keyboard_check_released(inputUpButton); 

	// ATTACK
	global.inputAttackPressed = keyboard_check_pressed(inputAttackButton) or mouse_check_button_pressed(mb_left); 
	global.inputAttackHeld = keyboard_check(inputAttackButton) or mouse_check_button(mb_left); 
	global.inputAttackReleased = keyboard_check_released(inputAttackButton) or mouse_check_button_released(mb_left); ; 

	// JUMP
	global.inputJumpPressed = keyboard_check_pressed(inputJumpButton) or mouse_check_button_pressed(mb_right);  
	global.inputJumpHeld = keyboard_check(inputJumpButton) or mouse_check_button(mb_right);  
	global.inputJumpReleased = keyboard_check_released(inputJumpButton) or mouse_check_button_released(mb_right);  
	// BLOCK
	global.inputGuardPressed = keyboard_check_pressed(inputBlockButton); 
	global.inputGuardHeld = keyboard_check(inputBlockButton); 
	global.inputGuardReleased = keyboard_check_released(inputBlockButton); 

	global.inputDashPressed = keyboard_check_pressed(inputDashButton); 
	global.inputDashHeld = keyboard_check(inputDashButton); 
	global.inputDashReleased = keyboard_check_released(inputDashButton); 


}
