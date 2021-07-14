event_inherited(); 

// SET BASE SPEEC
// IMPROVEMENT OPPORTUNITY
//(THIS COULD BE EXPANDED TO HAVE SPEED , ACCELERATION, AND FRICTION FOR MORE NATURAL MOVEMENT)
mySpeed = 1; 


// DETERMINE PATHING POINTS ( CAN BE AN INFINITE NUMBER OF POINTS)
pathPointArray[0,0] = x; pathPointArray[0,1] = y; // POINT 1
pathPointArray[1,0] = x + 100; pathPointArray[1,1] = y; // POINT 2

// ** DO NOT TOUCH **
velocity[XAXIS] = 0; 
velocity[YAXIS] = 0;
currentPoint = 0; 
nextPoint = 1; 
pathDir = 1; 
