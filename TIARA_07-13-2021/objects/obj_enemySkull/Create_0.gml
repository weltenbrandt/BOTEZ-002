event_inherited(); 
#region STATE MACHINE INIT
	scr_stateMachineCreate(); 
	scr_stateAdd("Idle", state_skull_idle); 
	scr_stateAdd("Chase", state_skull_chase);
	scr_stateAdd("Charge Up", state_skull_charge_up);
	scr_stateAdd("Hit Stun", state_skull_hit_stun);
	scr_stateAdd("Dead", state_skull_hit_stun);
	scr_stateAdd("Explode", state_skull_explode); 
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

// CHARGE UP PROPERTIES
chargeUpTime = 0; 
chargeUpDelayMin = 5; chargeUpDelayMax = 15;

// AI PROPERTIES
cautionRadius = 500; 
cautionDelayMin = 5; cautionDelayMax = 15;// FRAMES TO DELAY BEFORE ENTERING CHASE PLAYER FROM CAUTION

alarmRadius = 50; 
sightOffsetYTop    = -999; 
sightOffsetYBottom = 999; 

// EXPLOSION
explosionAttackDamage = 1; 
explosionRadialForce = 7; 
explosionImageSpeed = .4; 
explosionTimeStopFrames = 2; 


// CHARGE UP PROPERTIES
chargeUpImageSpeed = .3; // IMAGE SPEED OF CHARGE UP 
chargeUpFriction = 99; 

// HIT STUN PROPERTIES
hitStunFriction = .4; 

// ANIMATION PROPERTIES
// VISUAL ONLY
skullTurnThreshold = 2; // WHEN MOVING BELOW THIS SPEED, WILL DISPALY FORWARD FACING SPRITE< WHEN MOVING ABOVE, WILL DISPLAY TURNED SPRITES <- ONLY APPLIES TO CHASE STATE


// SOUNDS
ds_list_add(hitMaterialSoundList, snd_materialHitGeneric); 


// IDLE PROPERTIES
idleImageSpeed = .1;
idleFriction = 1.3; 
// CHASE PROPERTIES (WHEN CHASING PLAYER)
chaseMaxSpeed = 4; 
chaseAccel = .05; 
chaseFriction = .1; 
chaseImageSpeed = .12;

// SPECIAL PROPERTIES

heavy = false; 

// IMAGE PROPERTIES
myScale = 1 ; 
image_xscale = myScale; 
image_yscale = myScale; 
idleSprite = spr_skullIdle; 
hitStunSprite = spr_skullIdle; 
deathSprite = spr_skullExplode; 
mask_index = spr_skullMask; 

mass = 3; 

state_ignores_walls = true; 

#region NOTES
	// BEHAVIOR RELATED TO STOPPING AND STARTING MILL AROUND TIMERS IS INSIDE THAT STATE

#endregion
