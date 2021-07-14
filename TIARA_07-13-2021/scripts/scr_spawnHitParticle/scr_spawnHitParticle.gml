/// @description SPAWNS A HIT PARTICLE
/// @param x,y
function scr_spawnHitParticle() {

	var _xx = argument[0]; 
	var _yy = argument[1]; 

	var _particleLayer = layer_get_id("particles_shallow"); 
	var _depth = layer_get_depth(_particleLayer); 
	instance_create_depth(_xx,_yy,_depth, obj_hitParticle); 


}
