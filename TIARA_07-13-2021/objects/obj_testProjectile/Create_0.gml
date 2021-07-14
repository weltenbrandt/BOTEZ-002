event_inherited();

// Speed
spd = 0;

// Direction
dir = 0;

// Speed for each axis
vspd = lengthdir_y(spd, dir);
hspd = lengthdir_x(spd, dir);

// Damage to be caused
damage = 1;

// Lineal y
lineal_y = false;

reflec_cooldown = 0;

facing = sign(hspd);