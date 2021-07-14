scr_stateMachineCreate(); 
scr_stateAdd("Moving", state_projectile_move); 
scr_stateAdd("Blocked", state_projectile_blocked); 
scr_stateAdd("Vaporized", state_projectile_vaporize); 
scr_stateBeginIn("Moving"); 


// PHYSICS PROPERTIES
myFriction = 0; 
myGravity = 0; 

// PROJECTILE PROPERTIES
hitForce = 5; // PHYSICS FORCE OF COLLISIONS
bouncesOnWalls = false; // NOT FUNCTIONAL YET
breaksOnContact = true; // WHETHER PROJECTILE BREAKS ON CONTACT WITH TARGET
blockable = true; // NOT FUNCTIONAL YET
blockedBehavior = projectileBlockBehaviors.bounce; 
damage = 1; 
size = 20; // SIZE OF PROJECTILE
myTeam = teams.enemy // PROJECTILE BELONGS TO WHOM? 
explodeObject = NULLVALUE; 
mySpeed = 6; 

// PROPERTIES WHEN BREAKING
breakSound = snd_placeholderPop;

// PROPERTIES WHEN BOUNCING (THIS OCCURS WHEN THE PROJECTILE IS GUARDED AND ITS BLOCK BEHAVIOR IS BOUNCE
bounceYForce = 2; // FORCE OF Y BOUNCE BASE
bounceYVariance = .5; // VARIANCE OF Y BOUNCE
bounceXMultiplier = .4; // MULTIPLIER APPLIED TO X VELOCITY WHEN BOUNCED
bounceXVariance = .2;  // VARIANCE OF X BOUNCE
bounceGravity = .1; // GRAVITY APPLIED DURING BOUNCE STATE
bounceFriction = 0; // FRICTION APPLIED DURING BOUNCE STATE
bounceSound = snd_placeholderPop; 

// DO NOT TOUCH CODE BELOW THIS LINE
// SYSTEMS FOR KEEPING TRACK OF BEHAVIOR
velocity[XAXIS] = 0; 
velocity[YAXIS] = 0; 
separateXDir = 0; 
tilemap = layer_tilemap_get_id("Collisions");
onGround = false; 
myScale = 1; 
facing = 1; 

myPlatform = NULLVALUE; 

lifetime = 360; 
timer = 0; 
