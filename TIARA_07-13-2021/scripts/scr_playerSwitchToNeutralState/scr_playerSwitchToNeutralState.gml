function scr_playerSwitchToNeutralState() {

	if (state_next != "Ledge Wobble")
	{
		if !(onGround)
		{
			scr_stateSwitch("Fall"); 
		}
		else
		{
			if (global.inputGuardHeld)
			{
				scr_stateSwitch("Guard");
			}
			else
			{
				switch global.inputHorizontalTotal
				{
					case -1:
					case 1:
						scr_stateSwitch("Run"); 
						break;
					case 0:
						scr_stateSwitch("Idle"); 
						break;
				}
			}
		}
	}


}
