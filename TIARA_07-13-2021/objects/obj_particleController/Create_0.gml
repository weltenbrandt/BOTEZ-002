/// PARTICLE SYSTEM CONTROLLEr
// note: This particle system only controls PARTICLE PARTICLES, not OBJECT PARTICLES (like obj_hitParticle)


// DEFINE PARTICLE SYSTEMS
global.particleSystemDeep = part_system_create(); // BELOW ENEMY LAYER
var _depth = 300; // MUST MATCH THE particles_deep LAYER.

part_system_depth(global.particleSystemDeep, _depth); 
part_system_automatic_update(global.particleSystemDeep, false);

global.particleSystemShallow = part_system_create(); // ABOVE PLAYER LAYER

// DEFINE PARRTICLES

global.skullParticle = part_type_create(); 
var _part = global.skullParticle;
part_type_sprite(_part, spr_skullParticle, true, true, false);
part_type_direction(_part, 0,360,0,.15);  // DEFINE DIRECTION PROPERTIES OF PARTICLE
part_type_speed(_part, 1, 2,-.05,0);  // DEFINE SPEED OF PARTICLE
part_type_alpha2(_part,.7,.3); // DEFINE ALPHA CHANGE OF THE PARTICLE
part_type_life(_part, 20,30); // DEFINE LIFETIME OF THE PARTICLE
part_type_size(_part, 1, 3, -.05, 0); // DEFINE SIZE CHANGE OF THE PARTICLE 