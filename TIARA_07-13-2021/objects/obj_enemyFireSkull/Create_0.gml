event_inherited(); 
#region STATE MACHINE INIT
	scr_stateMachineCreate(); 
	scr_stateAdd("Idle", state_fire_skull_patrol); 
	scr_stateAdd("Shoot", state_fire_skull_shoot); 
	scr_stateAdd("Hit Stun", state_fire_skull_dead);
	scr_stateAdd("Dead",state_fire_skull_dead);
	scr_stateAdd("Explode", state_fire_skull_dead); 
	scr_stateBeginIn("Idle"); 
#endregion

// WIND FORCES
horWindSmooth = 0;
verWindSmooth = 0;
horizontalWindForce = 0;
verticalWindForce = 0;
horizontal_force = 0;
vertical_force = 0;

// ENEMY PROPERTIES
maxHearts =1; 
currentHearts = maxHearts;
damage = 1; 
hitForce = 3; 
hitTimeStopFrames = 2; 
hitXShake = 4; hitXShakeDecay = .1; 
hitYShake = 4; hitYShakeDecay = .1; 
coinValue = 5; 

#region STATE PROPERTIES

	// PATROL
	patrolImageSpeed = .2; 
	patrolAccel = .15; // LOW FRICTIONV ALUES CREATE SLIDEY MOVEMENT
	patrolFriction = .15;  // LOW FRICTIONV ALUES CREATE SLIDEY MOVEMENT
	patrolMaxSpeed = 3
	patrolDir = choose(180,0); 

	// SHOOT
	shootFriction = .3; // FRICTION WHILE ANGRY
	shootChargeUpImageSpeed = .2; // IMAGE SPEED WHEN ANGRY/CHARGING UP
	shootChargeUpTime = 60; // TME IT TAKES TO CHARG EUP FIRST SHOT
	
	shootDelayTime = 50; // DELAY BETWEEN SUCCESSIVE SHOTS
	shootingImageSpeed = .2; // IMAGE SPEED WHILE SHOOTING
	projectileSpeedMin = 3;  // MIN AND MAX SPEED OF GENERATED PROJECTILE
	projectileSpeedMax = 4.5; 
	
	// HIT STUN
	hitStunFriction = .1; 

	
	
#endregion
// AI PROPERTIES
cautionRadius = 200; // DISTANCE AT WHICH THE SKULL WILL CONTINUE ATTACKING ONCE BEGUN
alarmRadius = 100; // DISTANCE AT WHICH SKULL WILL START ATTACKING 
sightOffsetYTop    = -999; 
sightOffsetYBottom = 999; 
separateRadius = 40; 


// SPECIAL PROPERTIES
heavy = false; 

// IMAGE PROPERTIES
myScale = 1; 
image_xscale = myScale; 
image_yscale = myScale; 

patrolSprite = spr_fireSkullPatrol; 
alarmSprite = spr_fireSkullAngry;
attackSprite = spr_fireSkullShoot; 
hitStunSprite = spr_fireSkullExplode;
deathSprite = spr_fireSkullExplode; 

mask_index = spr_fireSkullMask

mass = 1.6; 

state_ignores_walls = true; 

// DO NOT TOUCH**

touchingBounderLastFrame = false; 
lastBounderTouched = NULLVALUE; 