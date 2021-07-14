show_debug_message(sprite_get_name(sprite_index));

// If we die, save the game
if (state == "Dead")
{
	save_game();
}

// PRESS L TO RESTART GAME
if (keyboard_check_pressed(ord("L")))
{
	scr_resetGameInfo(); 
	room_restart();
}

//show_debug_message(state_previous)

if (global.timeStop <= 0)
{
	if (timeStoppedImageSpeed != NULLVALUE){image_speed = timeStoppedImageSpeed;timeStoppedImageSpeed = NULLVALUE;}
	
	onGround = scr_isOnGround(); 
	if (onGround){dashDuringJumpCounter = 0;}
	
	if (instance_exists(oTextbox))
	{
		scr_stateSwitch("Idle");
		velocity[XAXIS] = 0;
	}

	if (!in_bumper)
	{
		scr_stateExecute();
	}
	
	scr_updateActorLocation(); // UPDATES LOCATION BASED ON X AND Y VELOCITY 

	if !(state_ignores_walls)
	{
		scr_playerActivateTraps(); 
	}
	
	#region COLLECT COINS
		var _p = id; 
		with par_collectible
		{
			if (state != "Collected" and collectible and point_distance(x,y, other.x, scr_returnMaskYMiddle(_p)) <= collectRadius)
			{
				scr_stateSwitch("Collected");
			}
		}
	#endregion

	// UPDATE TIMERS
	if (dashCooldownTimer > 0)
	{	--dashCooldownTimer;}
	else {dashCooldownTimer = 0;}

	if (state != "Hit Stun")
	{
		if (invincibilityTimer > 0 )
		{--invincibilityTimer;}
		else {invincibilityTimer = 0;}
	}
	if (flashTimer > 0 )
	{--flashTimer; 
	}else {flashTimer = 0;}
}
else
{
	if (timeStoppedImageSpeed == NULLVALUE){timeStoppedImageSpeed = image_speed;}
	image_speed = 0;
}

// Trails

// Controls the delay for the trails basing on player speed.
// You can change the delay multiplier in the create event
var spd = abs(velocity[XAXIS]) + abs(velocity[YAXIS])

spd = clamp(spd, 0, 2.1);



trail_delay = (2.5 - spd) * delay_multiplier;

// If the player is dashing or was launched, spawn more trails
if (state == "Dash" or launched)
{
	
	if (state == "Dash" or state == "Hit Stun")
	{
		launched = false;
	}
	
	trail_delay -= 1;
	
	trail_delay = (2.5 - spd) * 0.2;
}

// Creates the trail
if (trail_tick >= trail_delay and ((velocity[XAXIS] != 0 or velocity[YAXIS] != 0) or launched))
{
	instance_create_depth(x, y, depth, obj_player_trail);
	trail_tick = 0;
}

// Increases the trail tick per frame, basically a clock. 60 frames is equals to 1 second
trail_tick++;