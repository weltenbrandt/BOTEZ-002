event_inherited(); 
#region STATE MACHINE INIT
	scr_stateMachineCreate(); 
	scr_stateAdd("Idle", state_ghost_idle); 
	scr_stateAdd("Appear", state_ghost_appear); 
	scr_stateAdd("Vanish", state_ghost_vanish); 
	scr_stateAdd("Chase", state_ghost_chase);
	scr_stateAdd("Hit Stun", state_ghost_hit_stun);
	scr_stateAdd("Dead", state_ghost_hit_stun); // TO FACILIATE KNOCK BACK EFFET, DEATH IS ASSOCIATED WITH DESTROY 
	scr_stateAdd("Destroy", state_ghost_destroy);
	scr_stateBeginIn("Idle"); 
#endregion

// ENEMY PROPERTIES
maxHearts =1; 
currentHearts = maxHearts;
damage = 1; 
hitForce = 3; 
hitTimeStopFrames = 2; 
hitXShake = 4; hitXShakeDecay = .1; 
hitYShake = 4; hitYShakeDecay = .1; 
coinValue = 5; 

// WIND FORCES
horWindSmooth = 0;
verWindSmooth = 0;
horizontalWindForce = 0;
verticalWindForce = 0;
horizontal_force = 0;
vertical_force = 0;

// STATE PROPERTIES
idleImageSpeed = .1;
idleFriction = 1.3; 
idleMoveSpeed = 1; // THE GHOST WILL MOVE AT THIS SPEED TOWARDS A PLAYER WHILE INVISIBLE 
delayTimeMin = 15; // MINIMUM AMOUNT OF TIME THE GHOST WILL BE IDLE AFTER TELEPORTING
delayTimeMax = 45; // MAX AMOUNT OF TIME THE GHOST WILL BE IDLE AFTER TELEPORTING 

// APPEAR/VANISH
appearImageSpeed = .1; 
// DEATH
deathImageSpeed = .25; 
// HIT STUN FRICTION
hitStunFriction = .4; 
// CHASE PROPERTIES
chaseMaxSpeed = 2; 
chaseAccel = .15; 
chaseFriction = .1;  
chaseDelayMinFrames = 22; // GHOSTS WILL ALWAYS WAIT THIS AMOUNT BETWEEN MIN/MAX TIME BEFORE VANISHING FROM CHASE STATE 
chaseDelayMaxFrames = 122; 
// VANISH
teleportMaxRadius = 300; // WHEN TELEPORTING, THIS IS THE MAX DISTANCE FROM THE PLAYER THE GHOST WILL RESETTLE
teleportMinRadius = 50; //WHEN TELEPORTING, THIS IS THE MAX DISTANCE FROM THE PLAYER THE GHOST WILL RESETTLE

// AI PROPERTIES
cautionRadius = 300; // CHASES FROM IDLE 
alarmRadius = 200; // APPEARS FROM IDLE 
sightOffsetYTop    = -999; 
sightOffsetYBottom = 999; 
separateRadius = 40; 


// SPECIAL PROPERTIES
heavy = false; 

// IMAGE PROPERTIES
myScale = 2 ; 
image_xscale = myScale; 
image_yscale = myScale; 
idleSprite = spr_ghostIdle; 
hitStunSprite = spr_ghostHitStun; 
deathSprite = spr_ghostDie; 
invisibleSprite = spr_ghostInvisible; 
mask_index = spr_skullMask; 

mass = 1.6; 

state_ignores_walls = true; 