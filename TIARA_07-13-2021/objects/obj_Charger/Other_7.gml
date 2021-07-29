// If the explosion has ended, delete this object

switch(sprite_index)
{
	case(deathSprite):
		instance_destroy();
		break;
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
}