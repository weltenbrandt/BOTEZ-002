// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_end_action(){


scene++;
if (scene > array_length(scene_info) - 1)
{
	instance_destroy();
	exit;
}

event_perform(ev_other, ev_user0);
}