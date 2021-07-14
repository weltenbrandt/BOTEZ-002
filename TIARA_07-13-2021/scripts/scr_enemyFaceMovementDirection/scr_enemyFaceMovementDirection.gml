function scr_enemyFaceMovementDirection() {
	if (velocity[XAXIS] > 0 ){scr_enemySetFacing(1);}
	else if (velocity[XAXIS] < 0){scr_enemySetFacing(-1);}


}
