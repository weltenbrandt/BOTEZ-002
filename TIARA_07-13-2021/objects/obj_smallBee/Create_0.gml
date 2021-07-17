event_inherited();

// Movement variables
spd = 2;

hspd = 0;
vspd = 0;

// Getting hit variables
hp = 1;

knockout = 3;

// Target variables
target = obj_player;
detection_radius = 300;

// Explosion variables
explosion_charge_time = 2;
explosion_radius = 30;
explosion_damage = 1;


// Don't change these
explosion_charge_time *= room_speed;
tick = 0;
facing = -1;

knock_x = x;
knock_y = y;


exploded = false;

enum beestates
{
	follow,
	hit,
	explode
}

state = beestates.follow;