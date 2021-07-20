event_inherited();

// Movement variables
spd = 2;

// Getting hit variables
hp = 3;
x_knockout = 5; // (Force of pushing the bee when getting hit)
y_knockout = 4;
hurt_sound = snd_minotaurGetHit;

// Target variables
target = obj_player;
detection_radius = 200;

// Explosion variables
explosion_sound = snd_placeholderPop;

explosion_charge_time = 1;
explosion_radius = 5;
explosion_damage = 1;

background_explosion = obj_beeBackgroundExplosion;

//Sprites
deathSprite = spr_BeeExplode;

// Don't change these
explosion_charge_time *= room_speed;
tick = 0;
facing = -1;

knock_x = x;
knock_y = y;

hspd = 0;
vspd = 0;

exploded = false;

attack_cooldown = 0;

state = beestates.follow;