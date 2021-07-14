scr_stateMachineCreate(); 
scr_stateAdd("Idle", state_collectible_idle); 
scr_stateAdd("Moving", state_collectible_moving); 
scr_stateAdd("Collected", state_collectible_collected); 
scr_stateBeginIn("Idle"); 

scr_playSoundVariant(.32, snd_plingg2); 

image_speed = .1; 

// BASIC PROPERTIES
collectRadius = 44; 
collectTime = 55; // COINS CANNOT BE COLLECTED UNTIL THIS TIME 

// VALUE PROPERTIES
pointValue = 5; 
coinValue = 1;

// PHYSICS PROPERTIES
myGravity = .14; 
myFriction = .1; 
yBounceMultiplier = .33; // HOW MUCH Y VEL TO KEEP WHEN BOUNCING OFF FLOOR
xBounceMultiplier = .8; // HOW MUCH X VEL TO KEEP WHEN BOUNCING OFF WALL

// WIND FORCES
horizontalWindForce = 0;
verticalWindForce = 0;
horWindSmooth = 0;
verWindSmooth = 0;

// VISUAL PROPERTIES
t = 0;
increment = 1; //degrees -- freq = 1 oscillation per second (1Hz) in a 30 fps room
amplitude = 5; //pixels of peak oscillation
floatY = 0; 
//clone the y-position (or use x instead if you're doing horizontal oscillation)

// LOGIC VARIABLES
timeStoppedImageSpeed = NULLVALUE; 
collectible = false; 
velocity[XAXIS] = 0; 
velocity[YAXIS] = 0; 
onGround = false; 
separateXDir = 0; 
tilemap = layer_tilemap_get_id("Collisions");

myPlatform = NULLVALUE; 