function scr_returnPlayer() {
	var _p = obj_player; 

	if (instance_number(obj_player) == 1){
		return instance_find(obj_player,0); 
	}


}
