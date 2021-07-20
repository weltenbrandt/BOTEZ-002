event_inherited();

// Movement variables
spd = 2;

// Getting hit variables
hp = 1;
x_knockout = 5; // (Force of pushing the bee when getting hit)
y_knockout = 2;

// Getting hit variables
hp = 1;

knockout = 3;

// Target variables
target = obj_player;
detection_radius = 200;

// Explosion variables
explosion_sound = snd_placeholderPop;

explosion_charge_time = 1;
explosion_radius = 5;
explosion_damage = 1;

<<<<<<< Updated upstream
background_explosion = obj_beeBackgroundExplosion;

//Sprites
deathSprite = spr_smallBeeExplode;
=======
>>>>>>> Stashed changes

// Don't change these
explosion_charge_time *= room_speed;
tick = 0;
facing = -1;

knock_x = x;
knock_y = y;

<<<<<<< Updated upstream
hspd = 0;
vspd = 0;
=======
>>>>>>> Stashed changes

exploded = false;

enum beestates
{
	follow,
	hit,
	explode
}

state = beestates.follow;