event_inherited(); 

// ENEMY PROPERTIES ( SHOULD BE MODIFIED ON A CASE BY CASE BASIS ACCORDING TO ENEMY TYPE) 
maxHearts = 1; 
currentHearts = maxHearts;
coinValue = 12; 
pointValue = 100; 
coinSpawnOffset = -5; // COINS WIL LBE SPAWNED AT THE MIDDLE OF THE SPRITE + THIS AMOUNT OF PIXELS

meleeAttackDamage = 1; 
meleeAttackXForce = 3; 
meleeAttackYForce = -3; 
meleeAttackXShakeForce = 3; meleeAttackXShakeDecay = .1; 
meleeAttackYShakeForce = 3; meleeAttackYShakeDecay = .1; 
meleeAttackTimeStopFrames = 2; 

touchingMeHarmsPlayer = false; // TOUCHING THIS ENEMY HURTS THE PLAYER
invincible = false; // THIS ENEMY IS COMPLETELY INVINCIBLE AT ALL TIMES
heavy = false; // IF TRUE< THIS ENEMY CANNOT BE 'FORCED' OFF OF THE GROUND
mass = 1; // FORCES APPLIED TO THIS ENEMY WILL BE MULTIPLIED BY THIS VALUE


// AI PROPERTIES
cautionRadius = 200; 
cautionDelayMin = 5; cautionDelayMax = 15; // RANDOM DELAY WHEN RESPONDING TO PLAYER ENTERING CAUTION RADIUS
alarmRadius = 100;
sightOffsetYTop    = -120; 
sightOffsetYBottom = 0; 


fallGravity = .1; 
fallFriction = .1; 

// AUDIO PROPERTIES
hitMaterialSoundList = ds_list_create(); // SOUND OF MY MATERIAL BEING HIT
hitMaterialPitchVariance = .1; // VARIANCE OF MATERIAL HIT SOUND
hitResponseSoundList = ds_list_create(); // VOCAL RESPONSE WHEN BEING HIT 
hitResponsePitchVariance = .1; // VARIANCE OF VOCAL RESPONSE SOUND
deathResponseSoundList = ds_list_create(); 
deathResponsePitchVariance = .1;
currentVocalization = NULLVALUE; 

// IMAGE PROPERTIES
myScale = 1; 
image_xscale = myScale; 
image_yscale = myScale; 

#region DON'T TOUCH STUFF

	dead = false; 
	// INVINCIBILITY/ FLICKER PROPERTIES (PROBABLY BEST NOT TO TOUCH THESE) 
	hitStunFlashTime = 2; // HOW LONG THIS ENEMY WILL FLASH ON HIT 
	hitStunInvincibilityTime = 5; // NUMBER OF INVINCBILITY FRAMES ON HIT 
	flickerMod = 4; // INVINCINIBILITY TIME WILL BE DIVIDED BY THIS NUMBER
	flickerModDiv = 3; // IF THE REMAINDER IS == OR ABOVE THIS NUMBER THE PLAYER WILL 'FLICKER OUT' 
	timeStoppedImageSpeed = NULLVALUE; // HELPS US REGULATE ANIMATIONS DURING TIME STOP EFFECT
	
	// PHYSICS VALUES (DO NOT TOUCH)
	velocity[XAXIS] = 0; 
	velocity[YAXIS] = 0; 
	xHitForce = 0;  // THESE VALUES ARE USED TO STORE FORCES APPLIED ON HIT BETWEEN FRAMES (MAINLY SO PLAYER HITBOXES CAN KNOCK ENEMIES AROUND) 
	yHitForce = 0; 
	facing = choose(-1,1); 
	image_xscale = facing; 
	tilemap = layer_tilemap_get_id("Collisions"); 
	separateXDir = 0; // THIS VALUE IS USED TO HELP SEPARTE ENEMIES FROM EACH OTHER
	separateYDir = 0; // THIS VALUE IS USED TO HELP SEPARTE ENEMIES FROM EACH OTHER
	
	// LOGICAL VALUES (DO NOT TOUCH) 
	flashTimer = 0; 
	invincibilityTimer = 0; 
	myTeam = 1; 
#endregion

