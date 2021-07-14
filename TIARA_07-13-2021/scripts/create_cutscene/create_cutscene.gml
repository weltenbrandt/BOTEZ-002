// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_cutscene(info){

var inst = instance_create_depth(x, y, -1, oCutscene);

with (inst)
{
	scene_info = info;
	event_perform(ev_other, ev_user0)
}

}