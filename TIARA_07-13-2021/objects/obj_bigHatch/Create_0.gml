
// Define the cooldown in seconds
creation_cooldown = 3;

// Spawn configurations
spawn = obj_bigBee;
x_offset = 0;
y_offset =0;

// This variables controls the reaction of the explosion from the bees
collision_radius = 30;
collision_x = x;
collision_y = y;

// Destroying variables
immune = false;
regenerate_after = 0; // Defines for how long in seconds the hatch will stay broken.
// ^^^ Set it to 0 if it's supposed to stay broken forever

// Do not change these
creation_cooldown *= room_speed;
regenerate_after *= room_speed;

destroyed = false;
tick = 0;

regenerate_tick = 0;