/// @param key,name,portrait,portrait_talk,obj_class
function scr_defineDialogueActor() {
	var _actorMap = ds_map_create(); 
	ds_map_add(_actorMap,"key",argument[0]); 
	ds_map_add(_actorMap,"name",argument[1])
	ds_map_add(_actorMap,"portrait",argument[2]); 
	ds_map_add(_actorMap,"portrait_talk",argument[3]);
	ds_map_add(_actorMap,"object",argument[4]);
	ds_map_add_map(allActorsMap,ds_map_find_value(_actorMap,"key"),_actorMap); 


}
