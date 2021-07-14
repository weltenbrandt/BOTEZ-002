event_inherited(); 
#region STATE MACHINE INIT
	scr_stateMachineCreate(); 
	scr_stateAdd("Idle", state_minotaur_idle); 
	scr_stateAdd("Mill Around", state_minotaur_mill_around);
	scr_stateAdd("Chase Player", state_minotaur_chase_player);
	scr_stateAdd("Melee Attack", state_minotaur_melee_attack);
	scr_stateAdd("Hit Stun", state_minotaur_hit_stun); 
	scr_stateAdd("Dead", state_minotaur_dead); 
	scr_stateAdd("Fall", state_minotaur_fall); 
	scr_stateBeginIn("Idle"); 
#endregion

// ENEMY PROPERTIES
maxHearts =2; 
currentHearts = maxHearts;

// AI PROPERTIES
cautionRadius = 275; 
cautionDelayMin = 4; cautionDelayMax = 44;// FRAMES TO DELAY BEFORE ENTERING CHASE PLAYER FROM CAUTION
alarmRadius = 75; 
sightOffsetYTop    = -120; 
sightOffsetYBottom = 0; 

// MELEE ATTACK PROPERTIES
meleeAttackDamage = 1; 
meleeAttackXForce = 3; 
meleeAttackYForce = -3;
meleeAttackChargeSpeed = .3; 
meleeAttackSwingSpeed = .3; 
meleeAttackDelayMin = 50; meleeAttackDelayMax = 120; 
meleeAttackXShakeForce = 4; meleeAttackXShakeDecay = .1; 
meleeAttackYShakeForce = 4; meleeAttackYShakeDecay = .1; 
meleeAttackTimeStopFrames = 2; 

// UNIQUE MELEE ATTACK PROPERTIES (ONLY MINOTAUR HAS THESE PROPERTIES
meleeAttackMissXShakeForce = 2; meleeAttackMissXShakeDecay = .05; 
meleeAttackMissYShakeForce = 2; meleeAttackMissYShakeDecay = .05; 

// SOUNDS

ds_list_add(hitResponseSoundList, snd_minotaurGetHit); 
ds_list_add(hitMaterialSoundList, snd_materialHitGeneric); 
ds_list_add(deathResponseSoundList, snd_minotaurDie); 


// IDLE PROPERTIES
idleImageSpeed = .1; 

// WALK PROPERTIES (WHEN MILLING AROUND) 
walkMaxSpeed = 2; 
walkAccel = .25; 
walkFriction = .7; // NORMAL FRICTION WHILE RUNNING
walkImageSpeed = .1 ; 

// CHASE PROPERTIES (WHEN CHASING PLAYER)
chaseMaxSpeed = 3; 
chaseAccel = .9; 
chaseFriction = 1.3; // NORMAL FRICTION WHILE RUNNING
chaseImageSpeed = .15;

// FALL/JUMP FORCES
fallGravity = .1; 
fallFriction = .1; 


// SPECIAL PROPERTIES

heavy = false; 

// IMAGE PROPERTIES
myScale = 2; 
image_xscale = myScale; 
image_yscale = myScale; 
idleSprite = spr_minotaurIdle; 
walkSprite = spr_minotaurWalk; 
hitStunSprite = spr_minotaurHitStun;
deathSprite = spr_minotaurDie; 
chargeMeleeAttackSprite = spr_minotaurCharge;
meleeAttackSprite = spr_minotaurStrike; 

#region NOTES
	// BEHAVIOR RELATED TO STOPPING AND STARTING MILL AROUND TIMERS IS INSIDE THAT STATE

#endregion
