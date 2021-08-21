if (obj_gameDataController.coins >= coins_to_unlock)
{
	obj_gameDataController.timer = 0;
	obj_gameDataController.coins = 0;
	room_goto_next();
}