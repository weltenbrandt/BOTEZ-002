function macros() {
	// TILE MACROS
#macro TILESIZE 32
#macro TILESIZE_MINUS_ONE 31

	// MOVEMENT MACROS
#macro XAXIS 0
#macro YAXIS 1 
#macro MAX_FALL_SPEED 10

	// UTILITY MACROS

#macro NULLVALUE -9999

#macro LEDGE_WOBBLE_THRESHOLD 3

	// Message properties
	enum MSG {
		TEXT,
		NAME,
		IMAGE,
		SOUND,
		MESSAGESPEED
	}

	enum cameraZoneTypes
	{
		none,
		wall_jump_zone,
		zoom_in_zone,
		zoom_out_zone,
		enum_size
	
	}

	enum teams
	{
		player,
		enemy,
		agnostic,
		enum_size
	}

	enum projectileBlockBehaviors
	{
		destroy,
		bounce,
		hover,
		enum_size
	}

	enum savePointStates
	{
		inactive,
		activating,
		active,
		enum_size
	}

	enum winConditions{
		collect_coins,
		kill_all_enemies, 
		survive_time,
		find_exit,
		enum_size
	}



}
