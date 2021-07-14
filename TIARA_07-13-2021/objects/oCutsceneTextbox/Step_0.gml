/// @description 
// Get current message

//var skip = global.inputAttackHeld;
//var advance = global.inputAttackPressed;

var _arr = messages[| messageID];

var _text = _arr[MSG.TEXT];

var _sound = _arr[MSG.SOUND];

textspeed = _arr[MSG.MESSAGESPEED];

messageSpeed = textspeed;

// Get message string
messageText = string_copy(_text, 1, messageChar);



// String not fully drawn
if (messageChar <= string_length(_text))
{
	
	if !(audio_is_playing(_sound))
	{
		randomize();
		audio_sound_pitch(_sound, random_range(0.8, 1.2))
		audio_play_sound(_sound, 1, false);
	}
	
	messageChar += messageSpeed;
}
	

// String fully drawn
else if (skip_frame >= skip_cooldown) {
	
	// Go to next message
	if (messageID < ds_list_size(messages) - 1) {
		messageID++;
		messageChar = 0;
		audio_sound_pitch(_sound, 1)
		// Tells the program that the message isn't skipable anymore
		skipable = false;
		
		messageSpeed = textspeed;
	}
	// Close textbox
	else {
		audio_sound_pitch(_sound, 1)
		instance_destroy();
	}
}
else
{
	// Shows the player that the text is completed
	skipable = true;
}

skip_frame++;