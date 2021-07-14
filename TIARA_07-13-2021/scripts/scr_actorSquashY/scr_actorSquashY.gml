/// @description actor squash Y
/// @param actor,squashFactorStart,time
function scr_actorSquashY() {

	var _actor = argument[0]; 
	var _squashFactorAtStart = argument[1]; 
	var _squashTime = argument[2]; 

	with _actor
	{
		if (TweenExists(squashTweenY)){TweenDestroy(squashTweenY);}
		squashTweenY = TweenFire(id, EaseOutBack, 0, false, 0, _squashTime, squashScaleY__, _squashFactorAtStart, 1); 
	}


}
