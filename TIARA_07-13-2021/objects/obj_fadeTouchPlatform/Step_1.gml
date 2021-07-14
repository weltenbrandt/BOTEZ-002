switch ethereal
{
	case false:
		var _p = obj_player; 
		if (timer < fadeTouchTime)
		{
			sprite_index = upSprite; 
			image_speed = upSpriteImageSpeed; 
			if (scr_isValidInstance(_p)
			and _p.myPlatform == id)
			{
				timer += 1; 
				if (timer >= fadeTouchTime)
				{
					scr_playSoundVariant(.1, touchedSound); // SOUND OF PLAYER TRIGGERING FADE EVENT
				}
			}	
		}
		else
		{
			sprite_index = touchedSprite; 
			image_speed  = touchedSpriteImageSpeed; 
			timer += 1; 
			x = anchorX;
			y = anchorY;
			if (timer >= fadeTouchTime + waitTimeToFade)
			{
				sprite_index = crumbleSprite; 
				image_speed  = crumbleSpriteImageSpeed; 
				scr_playSoundVariant(.1, crumbleSound); // SOUND OF PLATFORM FADING OUT 
				ethereal = true; timer = 0; 
			}
		}
		break;
	case true:
		timer += 1; 
		if (timer >= fadeTime)
		{
			ethereal = false;
			scr_playSoundVariant(.1, upSound); // SOUND OF PLATFORM REAPPEARING
			timer = 0; 
		}
		break;
}