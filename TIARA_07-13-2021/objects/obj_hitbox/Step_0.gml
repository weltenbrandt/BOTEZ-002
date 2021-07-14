if !scr_isValidInstance(owner)
{
	instance_destroy(); 
}
else
{
	if (delayTimer > 0)
	{
		active = false;
		delayTimer -= 1; 
	}
	else if (activeTimer > 0)
	{
		active = true; 
		activeTimer -=1;
	}

	if (activeTimer <= 0)
	{
		instance_destroy();
	}
}