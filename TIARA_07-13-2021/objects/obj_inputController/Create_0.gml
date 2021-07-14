event_inherited();

inputDevice = -1; // KEYBOARD AND MOUSE

inputLeftButton = ord("A"); 
inputDownButton = ord("S"); 
inputRightButton = ord("D"); 
inputUpButton = ord("W"); 

inputAttackButton = ord("E"); 
inputJumpButton = vk_space; 
inputDashButton = ord("Q"); 
inputBlockButton = vk_shift; 

// DIRECTION UPDATE
scr_updateKeyboardInputs(); 

gamepadAxisReady = true; 

debugTextTimer = 0; 
debugShowText = ""; 