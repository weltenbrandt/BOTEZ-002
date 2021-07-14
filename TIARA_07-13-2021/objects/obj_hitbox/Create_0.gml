// PROPERTIES
owner = NULLVALUE; 
damage = 1; 
xForce = 5; 
yForce = 5; 
radialForce = NULLVALUE; 
xShakeForce = 0; xShakeDecay = 0; 
yShakeForce = 0; yShakeDecay = 0; 
stationary = false;
delayTimer = 0; 
activeTimer = 0; 

timeStopFrames = 2; 

onHitSoundList = ds_list_create(); 
onHitSoundPitchVariance = .1;

width = 32;
height = 32; 
xOffset = 0;
yOffset = 0; 

myTeam = teams.agnostic; 

// HELPER VARIABLES
active = false; 

image_alpha = .5; 

collisionList = ds_list_create(); 

connected = false; 
