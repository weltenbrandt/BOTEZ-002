event_inherited();

// Movement variables
spd = 2;

hspd = 0;
vspd = 0;

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
exploded = false;
myTeam = teams.enemy; 

enum beestates
{
	follow,
	explode
}

state = beestates.follow;