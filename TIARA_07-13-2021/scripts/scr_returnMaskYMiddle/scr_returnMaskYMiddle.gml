/// @param inst
function scr_returnMaskYMiddle() {
	var _inst = argument[0]; 

	with _inst
	{
		return y - sprite_get_height(mask_index)*.5*myScale;
	}


}
