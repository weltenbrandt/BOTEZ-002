
if (global.timeStop <= 0)
{
	if (timeStoppedImageSpeed != NULLVALUE){image_speed = timeStoppedImageSpeed;timeStoppedImageSpeed = NULLVALUE;}
	onGround = scr_isOnGround(); 
	scr_stateExecute(); 
	// UPDATE LOCATION IF MOVING 
	if (state == "Moving" and point_distance(0,0,velocity[XAXIS],velocity[YAXIS]) > 0)
	{
		scr_updateActorLocation(); 
	}
}
else
{
	{
		if (timeStoppedImageSpeed == NULLVALUE){timeStoppedImageSpeed = image_speed;}
		image_speed = 0;
	}
}