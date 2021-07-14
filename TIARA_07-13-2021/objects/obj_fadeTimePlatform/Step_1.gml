switch ethereal
{
	case false:
		timer += 1;
		if (timer >= waitTimeToFade)
		{ethereal = true; timer = 0;
			scr_playSoundVariant(.9,snd_placeholderPop);
		}
		break;
	case true:
		timer += 1;
		if (timer >=fadeTime)
		{ethereal = false; timer = 0;
		scr_playSoundVariant(1.1,snd_placeholderPop);
		}
		break;
}