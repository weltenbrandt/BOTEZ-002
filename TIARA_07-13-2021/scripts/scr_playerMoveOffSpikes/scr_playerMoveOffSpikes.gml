function scr_playerMoveOffSpikes() {
	// MOVE BACKWARDS UNTIL WE ARE NOT ON SPIKES.

	var _spikesTouching = argument[0]; 

	var _dir = point_direction(velocity[XAXIS], velocity[YAXIS],0,0); 
	while place_meeting(x,y, _spikesTouching)
	{
		x += lengthdir_x(1,_dir); 
		y += lengthdir_y(1,_dir); 
	}	


}
