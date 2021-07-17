/// @description Handle Keys Presses/Input

if (instance_exists(obj_player)) {
	x = obj_player.x;
	y = obj_player.y - sprite_height;
} 
else
{
	x = room_width / 2;
	y = sprite_height * 2;
}

visible = activated;

if(activated) {
	//Register Text
	if(keyboard_check(vk_anykey) and string_length(text) < 20) {
		text = text+string(keyboard_string);
		keyboard_string = "";
	}

	//Holding Backspace
	if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer = 2) {
		text = string_delete(text,string_length(text),1);
		delete_timer = 0;
		keyboard_string = "";
	}

	//Pressing backspace once
	if(keyboard_check_pressed(vk_backspace)) {
		text = string_delete(text,string_length(text),1);
		keyboard_string = "";
		delete_timer = -4;
	}
	
	//Handle Timer Update
	if(delete_timer != 2) {
		delete_timer ++;
	}
}
else {
	keyboard_string = "";
}

// Activating Command
if(keyboard_check_pressed( vk_f3 )) {
	
	if (activated and text != "") {
		cmd = text;
		text = "";
		delete_timer = 2;
		var i = asset_get_index(cmd);
		
		if (room_exists(i)) { 
			show_message("Going to room: " + cmd);
			room_goto(i); 
		}
		else {
			show_message("room '" + cmd + "' doesn't exist");
		}
		
	}
	
	activated = !activated; 
}

// Closes Command
if(keyboard_check_pressed(vk_escape)) {
	text = "";
	delete_timer = 2;
	activated = false; 
}