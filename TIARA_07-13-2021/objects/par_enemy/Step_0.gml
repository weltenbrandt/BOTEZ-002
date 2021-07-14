if (global.timeStop <= 0)
{
	if (timeStoppedImageSpeed != NULLVALUE){image_speed = timeStoppedImageSpeed;timeStoppedImageSpeed = NULLVALUE;}
	scr_stateExecute(); 

	if (scr_isValidInstance(id))
	{
		scr_enemySeparate(); 
		scr_updateActorLocation(); // UPDATES LOCATION BASED ON X AND Y VELOCITY 

		// UPDATE TIMES AND COOLDOWNS
		if (state != "Hit Stun")
		{
			if (invincibilityTimer > 0 )
			{--invincibilityTimer;}
			else {invincibilityTimer = 0;}
		}
		if (flashTimer > 0 )
		{--flashTimer; 
		}else {flashTimer = 0;}
	}
}
else
{
	if (timeStoppedImageSpeed == NULLVALUE){timeStoppedImageSpeed = image_speed;}
	image_speed = 0;
}