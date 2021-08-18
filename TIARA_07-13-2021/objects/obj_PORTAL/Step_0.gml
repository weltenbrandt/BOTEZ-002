if (obj_gameDataController.coins < unlock_coins)
{
	image_speed = 1 / ((unlock_coins - obj_gameDataController.coins) + 1);
	image_blend = make_color_rgb(50, 50, 50);
}
else
{
	image_speed = 1;
	image_blend = c_white;
}