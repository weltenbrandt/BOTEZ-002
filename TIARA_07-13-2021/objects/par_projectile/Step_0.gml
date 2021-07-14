onGround = scr_isOnGround(); 

scr_stateExecute(); 

if !(bouncesOnWalls)
{
	if (scr_updateActorLocation() or onGround) // RETURNS TRUE IF WALL IS STRUCK 
	{
		scr_removeFromGround(); 
		velocity[XAXIS] = 0; velocity[YAXIS] = 0; 
		scr_stateSwitch("Vaporized"); 
	}
}

timer += 1; 
if (timer >= lifetime) {instance_destroy();}