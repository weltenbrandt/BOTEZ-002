var msg_1 = [["A", "Player:", spr_portrait, sndVoice, 0.4]];
var msg_2 = [["AA", "Player:", spr_portrait, sndVoice, 0.4]];

t_scene_info = [
	[2, create_cutscene_dialogue, msg_1],
	[5, pause_cutscene_for, 5], // Pauses the cutscene for an amount of seconds
	[8, pause_cutscene_until_pressed], // Pauses the cutscene until player presses the attack button
	[10, create_cutscene_dialogue, msg_2],

]
