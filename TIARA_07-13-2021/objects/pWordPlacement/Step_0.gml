if (place_meeting(x, y, oFlyingWord))
{
	
	if (!instance_nearest(x, y, oFlyingWord).threw)
	{
		exit;
	}
	
	audio_play_sound(collect_sound, 1, false);
	
	var inst = instance_place(x, y, oFlyingWord);
	
	var word_data = 0;
	var response = "";
	
	switch(object_index)
	{
		case(oYes):
			word_data = inst.myWord[wordtype.yes];
			response = choose(
				"Seems good",
				"Yeah lol",
				"Can relate",
				"I'll promote you to mod"
			)
			break;
		case(oOk):
			word_data = inst.myWord[wordtype.ok];
			response = choose(
				"Yeah...",
				"You're right, I guess",
				"No opinion tbh",
				"It's ok for me"
			)
			break;
		case(oNo):
			word_data = inst.myWord[wordtype.no];
			response = choose(
				"Not funny, didn't laugh",
				"Enjoy your ban",
				"No lol",
				"Mods, ban this dude"
			)
			break;
	}
	
	
	instance_destroy(inst);
	
	inst = instance_create_depth(x, y, depth, oShootingWord);
	
	with (inst)
	{
		x = obj_player.x;	
		y = obj_player.y - 500;
		
		myDamage = word_data;
		myWord = response;
	}
}

