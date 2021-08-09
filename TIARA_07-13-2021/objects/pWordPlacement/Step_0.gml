if (place_meeting(x, y, oFlyingWord))
{
	var inst = instance_place(x, y, oFlyingWord);
	
	switch(object_index)
	{
		case(oYes):
			word_data = inst.myWord[wordtype.yes];
			break;
		case(oOk):
			word_data = inst.myWord[wordtype.ok];
			break;
		case(oNo):
			word_data = inst.myWord[wordtype.no];
			break;
	}
	
	show_debug_message(word_data);
}

