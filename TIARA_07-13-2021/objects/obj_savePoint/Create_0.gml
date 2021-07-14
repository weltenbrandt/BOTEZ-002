simpleState =  savePointStates.inactive; 

myScale = 2;
image_xscale = myScale;
image_yscale = myScale; 

if (place_meeting(x,y, obj_savePoint))
{
	instance_destroy(); 
}