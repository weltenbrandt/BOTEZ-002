// DETERMINE OUR DESINTATION X AND Y AND THE SIZE OF THIS PATH
var _nextPointX = pathPointArray[nextPoint,0];
var _nextPointY = pathPointArray[nextPoint,1];
var _pathNumber = array_height_2d(pathPointArray); 

// CEHCK IF WE HAVE REACHED CURRENT DESTINATION POINT, DETERMINE NEXT DESTINATION POINT
if (point_distance(x,y, _nextPointX, _nextPointY) <= 1)
{
	currentPoint = nextPoint; 
	
	if (nextPoint + pathDir > _pathNumber - 1)
	or (nextPoint + pathDir < 0)
	{pathDir*=-1;}
	nextPoint = currentPoint + pathDir; 
}

// MOVE TOWARDS NEXT POINT
var _dir = point_direction(x,y, pathPointArray[nextPoint,0],pathPointArray[nextPoint,1]); 
velocity[XAXIS] = lengthdir_x(mySpeed,_dir);
velocity[YAXIS] = lengthdir_y(mySpeed,_dir);
x += velocity[XAXIS]; 
y += velocity[YAXIS]; 

// OBJECT MOUNTED OBJECTS AS WELL 
// OPTIMIZATION OPPORTUNITY (CREATE A LIST ON PLATFORM OBJECTS INSTEAD OF QUERYING ALL ACTORS) 
var _me = id; 
with par_actor
{
	if (myPlatform == _me)
	{
		x += _me.velocity[XAXIS]; 
		y += _me.velocity[YAXIS]; 
	}
}

with par_collectible
{
	if (myPlatform == _me)
	{
		x += _me.velocity[XAXIS]; 
		y += _me.velocity[YAXIS]; 
	}
}