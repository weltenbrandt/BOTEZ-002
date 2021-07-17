
// Define the cooldown in seconds
creation_cooldown = 3;
creation_cooldown *= room_speed;

// Spawn configurations
spawn = obj_smallBee;
x_offset = 0;
y_offset =0;

// This variables controls the reaction of the explosion from the bees
collision_radius = 30;
collision_x = x;
collision_y = y;
immune = true;


// Do not change these
destroyed = false;
tick = 0;
