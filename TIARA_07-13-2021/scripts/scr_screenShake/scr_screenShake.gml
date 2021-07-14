/// @descriptionn shakes screen
/// @param xShake,xDecay,yShake,yDecay
function scr_screenShake() {

	var _xShakeForce = argument[0]; 
	var _xShakeDecay = argument[1]; 
	var _yShakeForce = argument[2]; 
	var _yShakeDecay = argument[3]; 

	var _cameraControl = obj_cameraController; 

	if (_cameraControl.xShakeForce < _xShakeForce)
	{
		_cameraControl.xShakeForce = _xShakeForce;
	}

	var _oldXDecay = _cameraControl.xShakeDecay; 
	_cameraControl.xShakeDecay = _xShakeDecay;
	if (_cameraControl.xShakeForce >0  and _cameraControl.xShakeDecay == 0)
	{
		 _cameraControl.xShakeDecay = _oldXDecay; 
	}

	if (_cameraControl.yShakeForce < _yShakeForce)
	{
		_cameraControl.yShakeForce = _yShakeForce;
	}
	_cameraControl.yShakeDecay = _yShakeDecay;

	var _oldXDecay = _cameraControl.yShakeDecay; 
	_cameraControl.yShakeDecay = _xShakeDecay;
	if (_cameraControl.yShakeForce >0  and _cameraControl.yShakeDecay == 0)
	{
		 _cameraControl.yShakeDecay = _oldXDecay; 
	}


}
