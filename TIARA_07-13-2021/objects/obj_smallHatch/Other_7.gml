// Resets the animation
image_speed = 0;
image_index = 0;

// Creates the spawned object
instance_create_depth(x + x_offset, y + y_offset, depth - 1, spawn);

// Resets the cooldown variable
tick = 0;