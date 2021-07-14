/// @description 
// Get current message

var skip = global.inputAttackHeld;
var advance = global.inputAttackPressed;
var jump = global.inputJumpPressed;

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
	if (skip)
	{
		messageSpeed = textspeed + 1;
	}
	
	if !(audio_is_playing(_sound))
	{
		randomize();
		audio_sound_pitch(_sound, random_range(0.8, 1.2))
		audio_play_sound(_sound, 1, false);
	}
	
	messageChar += messageSpeed;
}
	

// String fully drawn
else if (advance) {
	
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
		global.inputAttackPressed = false;
		global.inputAttackHeld = false;
		audio_sound_pitch(_sound, 1)	
		instance_destroy();
	}
}
else
{
	// Shows the player that the text is completed
	skipable = true;
}

if (jump)
{
	jump_counter+= 4;
}

if (jump_counter > 0)
{
	jump_counter -= 0.03;
}