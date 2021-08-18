if (place_meeting(x, y, obj_PORTAL))
{
	instance_nearest(x, y, obj_PORTAL).unlock_coins = coins_to_unlock;
}