event_inherited(); 



tilemap = layer_tilemap_get_id("Collisions"); 

#region STATE MACHINE INIT
	scr_stateMachineCreate(); 
	scr_stateAdd("Idle", state_player_idle); 
	scr_stateAdd("Run", state_player_run); 
	scr_stateAdd("Slide Land", state_player_run); 
	scr_stateAdd("Jump", state_player_jump); 
	scr_stateAdd("Fall", state_player_jump); 
	scr_stateAdd("Slide", state_player_slide); 
	scr_stateAdd("Wall Slide", state_player_wall_slide); 
	scr_stateAdd("Mantle", state_player_mantle); 
	scr_stateAdd("Ledge Grab", state_player_mantle); 
	scr_stateAdd("Sword Swing Ground", state_player_sword_swing_ground); 
	scr_stateAdd("Sword Swing Air" , state_player_sword_swing_air); 
	scr_stateAdd("Sword Swing Jump", state_player_sword_swing_jump); 
	scr_stateAdd("Shoryuken", state_player_shoryuken); 
	scr_stateAdd("Guard",state_player_guard); // AIR BLOCK IS HANDLED INSIDE state_jump
	scr_stateAdd("Dash",state_player_dash); 
	scr_stateAdd("Ledge Wobble",state_player_idle); 
	scr_stateAdd("Hit Stun",state_player_hit_stun); 
	scr_stateAdd("Dead",state_player_die); 
	onGround = scr_isOnGround(); 
	if (onGround){scr_stateBeginIn("Idle");}
	else {scr_stateBeginIn("Fall");}
#endregion

#region MOVEMENT PARAMETERS (MODIFY THESE TO ALTER THE WAY THAT PLAYER MOVEMENT FEELS 

	// IDLE FORCES
	idleFriction = 1; // THIS IS ONLY APPLIED IF YOU SOMEHOW GET INTO IDLE STATE WITH SPEED ON YOU. 
	// RUN FORCES
	runImageSpeed = .25; // SPEED OF ANIMATION WHEN RUNNING
	runMaxSpeed = 3; 
	
	runAccel = .3;  // RUN ACCEL WHEN IN A STAND STILL
	runOverMaxFriction = .001; // FRICTION WHEN ABOVE MAX SPEED FOR RUN 
	
	// RUN SLIDE/STOP PROPERTIES
	runTurnAccel = .12;  // (APPLIES WHILE TURNING IN RUN TURN LEFT/RIGHT ANIMATIONS) 
	runSlideFriction = .15; // (APPLIES WHILE NOT PRESSING ANYTHING IN RUN STOP LEFT/RIGHT ANIMATION)
	runStopImageSpeed = .25// (APPLIES WHILE NOT PRESSING ANYTHING IN RUN STOP ANIMATIONS)
	runTurnImageSpeed = .2;  // SPEED OF ANIMATION WHEN PLAYING RUN TURN ANIMATIONS (APPLIES AT ALL TIMES)
	
	// BUMPER
	in_bumper = false;
	launched = false;
	
	// WIND FORCES
	horizontalWindForce = 0;
	verticalWindForce = 0;
	horWindSmooth = 0;
	verWindSmooth = 0;
	
	// TRAILS
	// Changes the multiplier for the trail that will depend on the player speed.
	// The higher it is, the less trails will spawn
	delay_multiplier = 20;
	
	trail_tick = 0; // Do not change
	
	// SWORD FORCES
	meleeAttackXShakeForce = 4; meleeAttackXShakeDecay = .1;
	meleeAttackYShakeForce = 4; meleeAttackYShakeDecay = .1;
	groundSlashXVelocity = 5;	groundSwordSwingFriction = .5;
	swordTimeStopFrames = 4; 
	
	// SHORYUKEN PHYSICS PROPERTIES
	shoryukenJumpXforce = 5; 
	shoryukenJumpYForce = -4; 
	shoryukenXFriction = .2; 
	shoryukenGravity = .2; 
	shoryukenStartupImageSpeed = .25; 
	shoryukenImageSpeed = .18; 
	// - SHORYUKEN ATTACK PROPERTIES
	shoryukenDamage = 1; 
	shoryukenAttackXForce = 4; 
	shoryukenAttackYForce = -4; 
	shoryukenTimeStopFrames = 4; 
	shoryukenXHitShake = 4; shoryukenXHitShakeDecay = .1; 
	shoryukenYHitShake = 4; shoryukenYHitShakeDecay = .1; 
	
	// GUARD PROPERTIES 
	guardMinimumTime = 3; // MINIMUM NUMBER OF FRAMES THAT YOU MUST GUARD
	guardBounceMultiplier = .15;  // BOUNCE VELOCITY WHEN BOUNCING
	guardMaxBounces = 5; // MAXIMUM NUMBER OF BOUNCES WHILE GUARDING
	guardAnimationSpeed = .4; 
	guardFriction = .25; 
	
	
	// JUMP FORCES
	jumpYForce = 6.2;  // 4VERTICAL FORCE OF NORMAL JUMP
	jumpGravity = .18; // GRAVITY APPLIED DURING NORMAL JUMPS AND MOST OF THE TIME WHE IN THE AIR
	jumpMaxSpeed = 3; // MAXIMUM X VELOCITY OF JUMP UNDER NORMAL CIRCUMSTANCES
	jumpAccel = .5; // ACCELERATION OF JUMP (AFFECTS HOW EASY IT IS TO CONTROL JUMP X DIR) 
	jumpFriction = .05;  // FRICTION APPLIED TO JUMP WHEN NOT PRESSING LEFT/RIGHT
	jumpOverMaxFriction = .5; // FRICTION APPLIED TO JUMP WHEN ABOVE jumpMaxSpeed
	
	squashYStart = .5; // squash Y AT START (1 is none, above one is stretch, below 1 is squash
	squashTime = 30; // FRAMES FOR squash ANIMATION TO PLAY
	
	ledgeJumpForgivenessFrames = 3; /// NUMBER OF FRAMES AFTER LEAVING A LEDGE THAT YOU CAN STILL JUMP AS IF YOU WERE GROUNDED
	jumpApexHangTimeFrames = 4; // NUMBER OF FRAMES YOU CAN STAY AT 0 VEL AT THE APEX OF A JUMP (IF YOU HOLD JUMP OR UP) 
	
// DASH FORCES
	dashStartXVelocity = 8; // X VELOCITY OF DASH
	dashFrictionStart =  0;  // DASH FRICTION STARTS AT THIS VALUE (HIGHER MAKES DASH END FASTER) <- THIS VALUE SHOULD NOT BE NEGATIVE
	dashFrictionAccel = .065; // FRICTION DURING DASH ACCELS AT THIS RATE (HIGHER MAKES DASH END FASTER)
	dashFrictionMax = .38; // FRICTION CAP FOR DASH ACCEL (AFFECTS DASH MOTION) 
	dashAirFreezeTime = 3; // NUMBER OF FRAMES TO FREEZE MOMENTUM AFTER AN AIR DASH COMPLETES
	dashCooldown = 60; // NUMBER OF FRAMES AFTER A DASH COMPLETES THAT YOU ARE UNABLE TO PERFORM ANOTHER ONE. 
	
	// DASH GROUND VISUAL PROPERTIES
	dashAnimationSpeed = .4; 
	// NOTE: IF DASH ENDS BEFORE ANIMATION IS COMPLETE< REMAINDER OF ANIMATION WILL BE SKIPPED
	
	// DASH PROPERTIES
	airDashPreservesVerticalMomentum = false; // IF THIS IS TRUE, AIR DASHES WILL MAINTAIN VERTICAL MOMENTUM GOING INTO THEM
	wallSlideResetsDashCounter = true; // IF THIS IS TRUE, WALL SLIDING WILL RESET DASH COUNTER
	maxDashesPerJump = 1; // THE MAXIMUM NUMBER OF AIR DASHES THAT YOU CAN MAKE BEFORE TOUCHING THE GROUND AGAIN TO RESET 

	
	// MANTLE PROPERTIES
	mantleThreshold = 999; // THRESHOLD AT WHICH WE WE WILL PERFORM THE DESPERATE MANTLE.
	
	// GROUND SLIDE FORCES
	/*
	slideBoost = 3; // BOOST APPLIED TO X VELOCITY WHEN A SLIDE BEGINS (HAPPENS AS SLIDE TOUCHES GROUND, NOT AT START OF ANIMATION) 
	slideFriction = .1; // FRICTION APPLIED TO SLIDE
	slideJumpForce = 4; // Y FORCE OF SLIDE JUMP
	slideBoostForce = 2;// WHEN CHANGING DIRECTIONS ON A GROUND SLIDE LR to GROUND SLIDE LR, THIS 'BOOST' WILL BE APPLIED 
	slideImageSpeed = .144;
	*/
	
	// WALL SLIDE FORCE
	wallStickAnimationSpeed = .01; 
	wallSlideStickTime = 33; // TIME THAT PLAYER WILL STICK TO WALL BEFORE SLIDING DOWN (NOTE: THIS WILL OVERRIDE WALL STICK ANIMATION IF IT'S NOT FAST ENOUGH)
	wallSlideGravity = .15;  // GRAVITY APPLIED WHILE SLIDING
	wallSlideGraceFrames = 8; // NUMBER OF FRAMES THE PLAYER HAS TO JUMP AFTER PRESSING 'AWAY' FROM WALL 
	wallJumpXForce = 4; // HORIZONTAL FORCE OF WALL JUMMP
	wallJumpYForce = 6; // VERTICAL FORCE OF WALL JUMP
	wallJumpXAccel = .12; // AFFECTS THE AMOUNT OF CONTROL THE PLAYER HAS OVER WALL JUMP
	wallJumpXFriction = .05; // AFFECTS THE SPEED OF WALL JUMP WHEN NOT PRESSING BUTTON
	
	// HIT PROPERTIES
	hitStunImageSpeed = .25; 
	hitStunFrames = 20; // NUMBER OF FRAMES TO REMAIN IN HIT STUN
	hitStunXForce = 2; // AMOUNT OF X FORCE APPLIED TO PLAYER WHEN HIT 
	hitStunYForce = 3; // AMOUNT OF Y FORCE APPLIED TO PLAYER WHEN HIT
	hitStunAirXFriction = .035; // AMOUNT OF FRICTION DURING AERIAL PORTION OF HIT STUN
	hitStunGroundXFriction = .12; // AMOUNT OF FRICTION DURING AERIAL PORTION OF HIT STUN
	hitStunFlashTime = 2; // NUMBER OF FRAMES TO FLASH WHITE ON HIT 
	
	// INVINCIBILITY/ FLICKER PROPERTIES
	
	hitStunInvincibilityTime = 60; // NUMBER OF INVINCBILITY FRAMES ON HIT 
	flickerMod = 4; // INVINCINIBILITY TIME WILL BE DIVIDED BY THIS NUMBER
	flickerModDiv = 3; // IF THE REMAINDER IS == OR ABOVE THIS NUMBER THE PLAYER WILL 'FLICKER OUT' 
	
	// WOBBLE PROPERTIES
	ledgeWobbleTime = 44; // AMOUNT OF TIME TO LEDGE WOBBLE BEFORE SETTLING BACK TO IDLE
	
	// DEATH ANIMATION PROPERTIES
	deathForceMultiplier = 0; // NORMAL HIT STUN FORCES WILL BE MULTIPLIED BY THIS AMOUNT FOR DEATH EFFECT
	deathFreezeFrames = 60; // NUMBER OF FRAMES TO FREEZE IN PLACE ON DEATH
	deathGravity = .08; // GRAVITY TO BE APPLIED DURING DEATH ANIMTION (UNUSED ATM)
	deathFriction = .015; // X FRICTION TO BE APPLIED DURING DEATH ANIMATION (UNUSED ATM)
	deathAnimationSpeed = .32; // SPEED AT WHICH DEATH ANIMATION PLAYS 
	deathRestartTime = 33; // NUMBER OF FRAMES AFTER PLAYER DIES TO WAIT UNTIL RESET <- THIS IS REALLY A DEBUG THING
	//deathFadeSpeed = .05; // THIS VARIABLE IS HANDLED ON OBJ_ROOMTRANSITION
	
	
	// DON'T TOUCH VARIABLES 
	#region DON'T TOUCH THESE VARIABLES
		turnRunAnimationTime = 15; 
		endRunAnimationTime = 15; // DON'T TOUCH THIS
		runTimer = 0; 
		flashTimer = 0; // USED TO REGULATE PLAYER FLASHING WHITE 
		invincibilityTimer = 0; // USED TO REGULAT PLAYER BEING INVINCIBLE.
		hitStunPushDir = NULLVALUE; // THIS TELLS US THE MOST RECENT DIRECTION WE HAVE BEEN PUSHED BY HIT STUN 
		xHitForce = NULLVALUE;  // THESE VALUES ARE USED TO STORE FORCES APPLIED ON HIT BETWEEN FRAMES (MAINLY SO PLAYER HITBOXES CAN KNOCK ENEMIES AROUND) 
		yHitForce = NULLVALUE;
		separateXDir = 0;// THESE VALUES ARE NOT USE BY THE PLAYER AT ALL (JUST PREVENT ERRORS INC OLLISON SINCE ENEMIES USE THEM) 
		separateYDir = 0; 
		
		timeStoppedImageSpeed = NULLVALUE; // HELPS US KEEP TRACK OF IMAGE SPEED DURING TIME STOP 
		
		// HIT BOX PROPERTIES
		invincible = false; // IF TRUE, PLAYER IS INVINCIBLE, IGNORES HITBOXES
		dead = false; // IF TRUE, PLAYER IS DEAD
		heavy = false; // IF TRUE, PLAYER WILL IGNORE Y COMPONENT OF HITBOX FORCES
	
	#endregion

#endregion
#region SET BASIC PHYSICS PROPERTIES
	facing = 1; // 1 = right, -1 - left
	onGround = true; // DETERMINES WHETHER WE ARE ON THE GROUND
	turnRunTrigger = false; 
	mask_index = spr_playerMask; 
	
	velocity[XAXIS] = 0; 
	velocity[YAXIS] = 0; 
	myScale = 1; 
	
	squashScaleY = myScale;
	squashScaleX = myScale;
	squashTweenY = TweenNull(); 
	squashTweenX = TweenNull(); 
#endregion

#region AUDIO PROPERTIES

	hitMaterialSoundList = ds_list_create(); // SOUND OF MY MATERIAL BEING HIT
	hitMaterialPitchVariance = .1; // VARIANCE OF MATERIAL HIT SOUND
	ds_list_add(hitMaterialSoundList, snd_materialHitGeneric); 
	
	hitResponseSoundList = ds_list_create(); // VOCAL RESPONSE WHEN BEING HIT 
	hitResponsePitchVariance = .1; // VARIANCE OF VOCAL RESPONSE SOUND
	ds_list_add(hitResponseSoundList, snd_playerGetHitA); 
	
	deathResponseSoundList = ds_list_create(); // VOCAL RESPONSE WHEN BEING HIT 
	deathResponsePitchVariance = .1; // VARIANCE OF VOCAL RESPONSE SOUND

	currentVocalization = NULLVALUE; 
	
#endregion


// STATE SWITCH LOGIC HANDLERS
nextSwordSwingType = 0; // 0 = down to up, 1 = up to down

// BEHAVIOR CONTROL VARIABLES
blocking = false; 
dashDuringJumpCounter = 0; 
dashCooldownTimer = 0; 

if scr_isValidInstance(obj_cameraAid)
{
	obj_cameraAid.x = x; 
	obj_cameraAid.y = y; 
}

myTeam = 0; 