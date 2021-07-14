// Variables for angles
orig_angle = image_angle;
bumper_angle = image_angle;
active = false;
angle = image_angle;

image_index = 1;

// Timer
timer *= room_speed;
initial_timer = timer;

// Flash variables
flashAlpha = 0;
flashColor = make_color_rgb(255, 0, 50);

flash_tick = 0;
tick_speed = 1;

// Radius
//Adding +10 because that's the size of the sprite

collision_radius = 7 + 10;