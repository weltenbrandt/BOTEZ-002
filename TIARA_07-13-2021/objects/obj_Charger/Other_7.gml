// If the explosion has ended, delete this object

switch(sprite_index)
{

	case(prepareSprite):
		if (prepare_tick < prepare_time)
		{
			image_speed = 0;
			image_index = image_number - 1;
		}
		break;
	case(attackSprite):
		image_index = 0;
		state = Charger.idle;
		break;
	case(parriedSprite):
		image_index = 0;
		state = Charger.stunned;
		break;
	case(damagedSprite):
		image_speed = 0;
		image_index = image_number - 1;
		break;
	case(recoveredSprite):
		image_index = 0;
		state = Charger.idle;
		break;
}