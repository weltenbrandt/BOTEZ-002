//room_goto(rm_test); 

if (file_exists("save.sav"))
{
	load_game();
}
else
{
	room_goto(ROOM_EMPTY);
}