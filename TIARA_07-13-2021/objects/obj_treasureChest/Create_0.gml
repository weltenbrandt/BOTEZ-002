enum simpleStates
{
	idle,
	bounce,
	open,
	enum_size
}

// CHEST PROPERTIES
activationDistance = 70; // CHEST WILL OPEN IF PLAYER COMES THIS CLOSE 
coinsInside = 20; // VALUE OF COINS INSIDE ME. 
coinForce = 3; // FORCE OF COIN EJECTION WILL BE THIS +/- 1 
coinForceVariance = .5; // VARIANCE OF COIN EJECTION FORCE
coinAngleVariance = 5; // COINS WILL BE EJECTED AT 90 DEGREE AGNLE +/- THIS AMOUNT

// OPEN PROPERTIES
openAnimationSpeed = .1; // ANIMATION SPEED WHEN OPENING

// BOUNCE PROPERTIES
bounceAnimationSpeed = .2; // ANIMATION SPEED WHILE BOUCNING
bounceDelay = 120; // DELAY BETWEEN BOUNCES

simpleState = simpleStates.idle;  // USED TO REGULATE STATES
timer = 0; 