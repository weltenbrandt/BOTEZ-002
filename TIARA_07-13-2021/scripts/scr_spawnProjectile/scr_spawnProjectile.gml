/// @description spawn projectiles
/// @param x,y,direction,force,object
function scr_spawnProjectile() {

	var _x = argument[0]; 
	var _y = argument[1]; 
	var _dir = argument[2]; 
	var _force = argument[3]; 
	var _obj = argument[4]; 

	var _projectileLayer = layer_get_id("projectiles"); 
	var _layerDepth = layer_get_depth(_projectileLayer); 

	var _proj = instance_create_depth(_x,_y, _layerDepth, _obj); 
	_proj.velocity[XAXIS] = lengthdir_x(_force, _dir); 
	_proj.velocity[YAXIS] = lengthdir_y(_force, _dir); 





}
