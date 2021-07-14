function scr_setInputDeviceDefaults() {
	switch inputDevice
	{
		default:
			inputAttackButton = gp_face1; 
			inputJumpButton = gp_face3; 
			inputDashButton = gp_shoulderr;
			inputBlockButton = gp_face2;
			break;
		case -1:
			inputLeftButton = ord("A"); 
			inputDownButton = ord("S"); 
			inputRightButton = ord("D"); 
			inputUpButton = ord("W"); 

			inputAttackButton = ord("E"); 
			inputJumpButton = vk_space; 
			inputDashButton = ord("Q"); 
			inputBlockButton = vk_shift; 
			break; 
	}


}
