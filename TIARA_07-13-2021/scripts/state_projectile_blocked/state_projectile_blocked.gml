function state_projectile_blocked() {
	if state_new
	{
		switch blockedBehavior
		{
			case projectileBlockBehaviors.destroy:
				instance_destroy(); 
				break; 
			case projectileBlockBehaviors.bounce:
				velocity[XAXIS] *= (-bounceXMultiplier);
				velocity[XAXIS] += irandom_range(-bounceXVariance,bounceXVariance); 
				velocity[YAXIS] = -bounceYForce + random_range(-bounceYVariance,bounceYVariance); 
				scr_playSoundVariant(.1, bounceSound); 
				break; 
			case projectileBlockBehaviors.hover:
				break; 
		}
	}

	switch blockedBehavior
	{
		case projectileBlockBehaviors.bounce:
			scr_applyGravity(bounceGravity); 
			scr_applyXFriction(bounceFriction); 
			break; 
	}


}
