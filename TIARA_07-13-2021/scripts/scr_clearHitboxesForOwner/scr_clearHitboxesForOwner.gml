/// @description clears all hitboxes belonging to the specified owner.
/// @param owner,clearStationaryToo?
function scr_clearHitboxesForOwner() {
	var _targetOwner = argument[0]; 
	var _clearStationary = argument[1]; // CLEAR STATIONARY ONES TOO? 

	with obj_hitbox
	{
		if (owner == _targetOwner)
		{
			if (!stationary or _clearStationary)
			{
				instance_destroy();
			}
		}
	
	}


}
