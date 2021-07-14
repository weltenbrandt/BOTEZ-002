function scr_endSequence() {
	with obj_sequenceControl{
		if (currentSequence != NULLVALUE){
			skipIndex = 0; 
			currentSequence = NULLVALUE; 
			sequenceStep = NULLVALUE; 
			beginStep = false; 
			with obj_dialogue{
				closing = true; 
				xScaleTween = TweenFire(id,EaseInBack,0,false,0,8,image_xscale__,1,0);
				yScaleTween = TweenFire(id,EaseInBack,0,false,0,8,image_yscale__,1,0);
			}
		}
	}


}
