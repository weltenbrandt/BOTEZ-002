/// @description spawns a hitbox
/// @param owner,damage,stationary,x/xOffset,y/yOffset,width,height,radialForce,xForce,yForce,delay,activeFrames,timeStopFrames,xShake,yShake,xShakeDecay,yShakeDecay,soundVariation,...SoundToPlayA...
function scr_spawnHitbox() {

	var _hitbox = instance_create_depth(x,y,-999, obj_hitbox);

	// PROPERTIES
	var _owner = argument[0]; 
	var _damage = argument[1];
	var _stationary = argument[2]; 
	var _xx = argument[3]; 
	var _yy = argument[4]; 
	var _width = argument[5]; 
	var _height = argument[6]; 
	var _radialForce = argument[7]; 
	var _xForce = argument[8]; 
	var _yForce = argument[9]; 
	var _delay = argument[10]; 
	var _activeFrames = argument[11]; 
	var _timeStopFramesOnHit = argument[12]; 

	var _xShakeForce = argument[13]; 
	var _yShakeForce = argument[14];
	var _xShakeDecay = argument[15]; 
	var _yShakeDecay = argument[16]; 


	if (argument_count > 16)
	{
		var _pitchVariance = argument[17]; // ARUGMENT COUNT 16
		_hitbox.onHitSoundPitchVariance = _pitchVariance; 
	
		var _reps = 0; 
		repeat (argument_count - 18)
		{
			ds_list_add(_hitbox.onHitSoundList, argument[18 + _reps]); 
			++_reps; 
		}
	}

	_hitbox.owner = _owner; 
	_hitbox.damage = _damage; 
	_hitbox.stationary = _stationary; 
	_hitbox.timeStopFrames = _timeStopFramesOnHit; 
	if _stationary == true
	{
		_hitbox.x = _xx - _width*.5;; 
		_hitbox.y = _yy - _width*.5; 
	}
	else
	{
		_hitbox.xOffset = _xx; 
		_hitbox.yOffset = _yy; 
		_hitbox.x = _owner.x + (_xx*_owner.facing) - _width*.5; 
		_hitbox.y = _owner.y + _yy - _height*.5; 
	}

	_hitbox.image_xscale = _width; 
	_hitbox.image_yscale = _height; 
	_hitbox.radialForce = _radialForce; 
	_hitbox.xForce = _xForce*facing;
	_hitbox.yForce = _yForce;
	_hitbox.delayTimer = _delay; 
	_hitbox.activeTimer = _activeFrames;
	_hitbox.myTeam = _owner.myTeam; 

	_hitbox.xShakeForce = _xShakeForce; 
	_hitbox.yShakeForce = _yShakeForce; 
	_hitbox.xShakeDecay = _xShakeDecay; 
	_hitbox.yShakeDecay = _yShakeDecay; 

	return _hitbox; 


}
